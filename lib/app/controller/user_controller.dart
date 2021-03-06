import 'dart:io';
import 'dart:math';
import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/app/data/model/user_model.dart';
import 'package:damo/app/data/provider/user/user_api.dart';
import 'package:damo/viewmodel/get_dialog.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kpostal/kpostal.dart';

class UserController extends GetxController {
  TokenController tokenController = Get.find();
  Rx<GetUserInfoModel> getUserInfoModel = GetUserInfoModel().obs;
  Rx<AccessTokenAvailableCheckModel> accessTokenAvailableCheckModel =
      AccessTokenAvailableCheckModel().obs;
  Rx<ChangeAddressModel> changeAddressModel = ChangeAddressModel().obs;
  Rx<UpdateAppleUserInfo> updateAppleUserInfo = UpdateAppleUserInfo().obs;
  Rx<NicknameDoubleCheckModel> nicknameDoubleCheckModel =
      NicknameDoubleCheckModel().obs;
  Rx<CheckOwnerModel> checkOwnerModel = CheckOwnerModel().obs;
  Rx<UserPhoneNumberModel> userPhoneNumberModel = UserPhoneNumberModel().obs;
  Rx<ChangeProfileImageModel> changeProfileImageModel =
      ChangeProfileImageModel().obs;
  Rx<ChangeDefaultProfileImageModel> changeDefaultProfileImageModel =
      ChangeDefaultProfileImageModel().obs;
  Rx<RefreshAccessTokenModel> refreshAccessTokenModel =
      RefreshAccessTokenModel().obs;
  RxBool? addrEditCheck = false.obs;
  Rx<TextEditingController> addr2Controller =
      TextEditingController(text: '').obs;
  Rx<UserImageModel> userImageModel = UserImageModel().obs;
  RxString addr1 = ''.obs;
  RxInt zipcode = 0.obs;
  RxString addr2 = ''.obs;
  RxBool isFetchingData = false.obs;
  Map<String, dynamic> input = {};
  String sendData = '';
  var jsonResponse;
  var model;

  @override
  void onInit() async {
    super.onInit();
    await getUserInfo();
  }

  bool isAdditionalInformatinApple() {
    //false?????? ?????? ?????? ????????????
    if (userController.getUserInfoModel.value.provider == "APPLE") {
      return userController.getUserInfoModel.value.hasAdditionalInformation ==
              false
          ? false
          : true;
    }
    return true;
  }

  Future<void> getUserInfo() async {
    jsonResponse = await UserNetwork().getUsers();
    print(jsonResponse);
    if (jsonResponse['code'] == 3) {
      print('????????? ?????????????????????.');
    }
    if (jsonResponse['code'] == 2) {
      print('?????? ???????????? ??????????????? ??????????????????.');
    }
    if (jsonResponse['code'] == 1) {
      model = GetUserInfoModel.fromJson(jsonResponse);
      getUserInfoModel.update((val) {
        val!.code = model.code;
        val.addr1 = model.addr1;
        val.addr2 = model.addr2;
        val.zipcode = model.zipcode;
        val.ageRange = model.ageRange;
        val.lastAgreeDateOfMarketing = model.lastAgreeDateOfMarketing;
        val.lastAgreeDateOfPushNotification =
            model.lastAgreeDateOfPushNotification;
        val.lastAgreeDateOfServiceAndPersonalData =
            model.lastAgreeDateOfServiceAndPersonalData;
        val.marketing = model.marketing;
        val.pushNotification = model.pushNotification;
        val.serviceAndPersonalData = model.serviceAndPersonalData;
        val.birth = model.birth;
        val.createdAt = model.createdAt;
        val.email = model.email;
        val.hasAdditionalInformation = val.hasAdditionalInformation;
        val.provider = val.provider;
        val.id = model.id;
        val.isOwner = model.isOwner;
        val.name = model.name;
        val.nickname = model.nickname;
        val.phoneNumber = model.phoneNumber;
        val.profileImage = model.profileImage;
        val.sex = model.sex;
        val.description = model.description;
        val.result = model.result;
      });
      addr1.value = getUserInfoModel.value.addr1!;
      addr2.value = getUserInfoModel.value.addr2!;
      userImageModel.value.imageUrl = getUserInfoModel.value.profileImage;
      addr2Controller.value.text = getUserInfoModel.value.addr2!;
    }
  }

  void isAvailableAccessToken() {}

  Future<void> registerAddress() async {
    input.clear();
    input['addr1'] = addr1.value;
    input['addr2'] = addr2Controller.value.value.text;
    input['zipcode'] = zipcode.value;
    sendData = ChangeAddressModel().toJson(input);
    jsonResponse = await UserNetwork().postUsersAddress(sendData);
    model = ChangeAddressModel.fromJson(jsonResponse);
    changeAddressModel.update((val) {
      val!.code = model.code;
      val.description = model.description;
      val.result = model.result;
    });

    if (changeAddressModel.value.code == 3) {
      print('????????? ????????????????????? ??? ????????? ???????????????.');
      tokenController.refreshGetAccessToken();
    }
    if (changeAddressModel.value.code == 2) {
      print('?????? ????????? ??????????????????.');
      return;
    }
    if (changeAddressModel.value.code == 1) {
      print('????????? ??????????????????.');
    }
  }

  Future<void> selectAddress() async {
    Kpostal? result = await Get.to(
        () => KpostalView(kakaoKey: 'f531a0ec792da7f77d6b58255ae76aa0'));
    if (result != null) {
      addr1.value = result.address;
      addr1.refresh();
      zipcode.value = int.parse(result.postCode);
    }
  }

  Future<void> onAddressChanged() async {}

  Future<void> selectProfileImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? selectImage = await _picker.pickImage(
      //???????????? ??????
      source: ImageSource.gallery, //????????? ?????????
      imageQuality: 100, // ????????? ?????????
    );
    if (selectImage != null) {
      userImageModel.update((val) {
        val!.imageUrl = null;
        val.defaultImage = null;
        val.image = FileImage(
          File(selectImage.path),
        );
      });
    }
  }

  Future<void> changeProfileImage() async {
    dynamic sendData = await ChangeProfileImageModel()
        .toJson(userImageModel.value.image.file.path);
    jsonResponse = await UserNetwork().patchUserProfileImage(sendData);
    model = ChangeProfileImageModel.fromJson(jsonResponse);

    if (model.code == 1) {
      String random = Random().nextInt(2147483890).toString();
      getUserInfoModel.value.profileImage = model.imageUrl + "?v=$random";

      getUserInfoModel.refresh();
      print('????????? ????????? ??????????????????.');
    }
    if (model.code == 2) {}
    if (model.code == 3) {}
  }

  Future<void> selectDefaultProfileImage() async {
    userImageModel.update((val) {
      val!.imageUrl = null;
      val.image = null;
      val.defaultImage = getUserInfoModel.value.sex == 'MALE'
          ? Image.asset('assets/images/img_?????????????????????@3x.png')
          : Image.asset('assets/images/img_?????????????????????@3x.png');
    });
    print(userImageModel.value.image);
    print(userImageModel.value.imageUrl);
    print(userImageModel.value.defaultImage);
  }

  Future<void> onChangedDefaultProfileImage() async {
    print('????????? ????????? ?????????????????? ???????????????.');
    jsonResponse = await UserNetwork().patchUsersProfileimageDefault();
    model = ChangeDefaultProfileImageModel.fromJson(jsonResponse);

    if (model.code == 1) {
      getUserInfoModel.value.profileImage = model.imageUrl;
      getUserInfoModel.refresh();
      print('????????? ????????? ??????????????????.');
    }
    if (model.code == 2) {}
    if (model.code == 3) {}
  }

  Future<void> clickUserInfoModify() async {
    GetDialog().alternativeDialog(
        '??????????????? ?????????????????????????', () async => await modifyUserData());
  }

  Future<void> modifyUserData() async {
    Get.back();
    isFetchingData.value = true;
    print(userImageModel.value.imageUrl);
    print(userImageModel.value.image);
    print(userImageModel.value.defaultImage);
    if (userImageModel.value.imageUrl == null) {
      if (userImageModel.value.image != null) {
        print('image');
        await changeProfileImage();
      } else {
        print('default');
        await onChangedDefaultProfileImage();
      }
    }
    await registerAddress();
    isFetchingData.value = false;
    Fluttertoast.showToast(
      msg: '????????? ?????????????????????',
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.red[200],
      fontSize: 15.0,
    );
    print(getUserInfoModel.value.profileImage);
  }
}

class UserImageModel {
  String? imageUrl;
  dynamic image;
  Image? defaultImage;

  UserImageModel({this.imageUrl, this.image, this.defaultImage});
}

class UserBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<UserController>(UserController(), permanent: true);
  }
}
