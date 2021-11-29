import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/app/data/model/user_model.dart';
import 'package:damo/app/data/provider/user/user_api.dart';
import 'package:damo/view/mypage/edit_my_address.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  TokenController tokenController = Get.find();
  Rx<GetUserInfoModel> getUserInfoModel = GetUserInfoModel().obs;
  Rx<AccessTokenAvailableCheckModel> accessTokenAvailableCheckModel =
      AccessTokenAvailableCheckModel().obs;
  Rx<ChangeAddressModel> changeAddressModel = ChangeAddressModel().obs;
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
  RxString addr1 = ''.obs;
  RxString zipcode = ''.obs;
  RxString addr2 = ''.obs;
  Map<String, dynamic> input = {};
  String sendData = '';
  var jsonResponse;
  var model;

  @override
  void onInit() async {
    super.onInit();
    await getUserInfo();
  }

  Future<void> getUserInfo() async {
    jsonResponse = await UserNetwork().getUsers();
    if (jsonResponse['code'] == 3) {
      print('토큰이 만료되었습니다.');
    }
    if (jsonResponse['code'] == 2) {
      print('유저 데이터를 불러오는데 실패했습니다.');
    }
    if (jsonResponse['code'] == 1) {
      model = GetUserInfoModel.fromJson(jsonResponse);
      print('유저 데이터를 성공적으로 불러왔습니다');
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
    }
  }

  void isAvailableAccessToken() {}

  Future<void> registerAddress() async {
    input.clear();
    input['addr1'] = addr1.value;
    input['addr2'] = addr2.value;
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
      print('토큰이 만료되었으므로 재 갱신을 시도합니다.');
      tokenController.refreshGetAccessToken();
    }
    if (changeAddressModel.value.code == 2) {
      print('주소 변경에 실패했습니다.');
      return;
    }
    if (changeAddressModel.value.code == 1) {
      print('주소를 변경했습니다.');
      change(addr1: addr1.value, addr2: addr2.value, zipcode: zipcode.value);
    }
  }

  void change({String? addr1, String? addr2, String? zipcode}) {
    getUserInfoModel.update((val) {
      val!.addr1 = addr1;
      val.addr2 = addr2;
      val.zipcode = zipcode;
    });
  }

  Future<void> onAddressChanged() async {
    await Get.to(() => EditMyAddress());
    if (addrEditCheck!.value == true) {
      addr2Controller.value.clear();
      await Get.defaultDialog(
        title: '상세 주소입력',
        titleStyle: TextStyle(
          color: Color(0xff283137),
          fontSize: 16,
          fontFamily: 'NotoSansCJKKR',
          fontWeight: FontWeight.w700,
        ),
        content: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: TextFormField(
            controller: addr2Controller.value,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '없으시면 입력하지 않아도 됩니다.',
              hintStyle: TextStyle(
                  color: Color(0xff283137),
                  fontFamily: 'NotoSansCJKKR',
                  fontSize: 14.h,
                  height: 1),
            ),
          ),
        ),
        actions: [
          TextButton(
              child: Text(
                "확인",
                style: TextStyle(
                    color: Color(0xff283137),
                    fontFamily: 'NotoSansCJKKR',
                    fontSize: 14.h,
                    height: 1),
              ),
              onPressed: () async {
                addr2 = addr2Controller.value.value.text.obs;
                await registerAddress();
                print('주소변경 완료');
                Get.back();
              }),
          TextButton(
              child: Text(
                "취소",
                style: TextStyle(
                    color: Color(0xff283137),
                    fontFamily: 'NotoSansCJKKR',
                    fontSize: 14.h,
                    height: 1),
              ),
              onPressed: () {
                Get.back();
              }),
        ],
      );
      addrEditCheck = false.obs;
    }
  }

  Future<void> onChangedProfileImage() async {
    bool _alertCheck = false;
    final ImagePicker _picker = ImagePicker();
    print('프로필 사진을 선택합니다.');
    XFile? selectImage = await _picker.pickImage(
      //이미지를 선택
      source: ImageSource.gallery, //위치는 갤러리
      maxHeight: 75,
      maxWidth: 75,
      imageQuality: 30, // 이미지 크기 압축을 위해 퀄리티를 30으로 낮춤.
    );
    if (selectImage != null) {
      await Get.defaultDialog(
        title: ' ',
        titleStyle: TextStyle(
            color: Color(0xff283137),
            fontFamily: 'NotoSansCJKKR',
            fontSize: 15.h,
            height: 1),
        content: Padding(
          padding: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 20.h),
          child: Text(
            '정말로 변경하시겠습니까?',
            style: TextStyle(
                color: Color(0xff283137),
                fontFamily: 'NotoSansCJKKR',
                fontSize: 17.h,
                height: 1.h),
          ),
        ),
        actions: [
          TextButton(
              child: Text(
                "예",
                style: TextStyle(
                    color: Color(0xff283137),
                    fontFamily: 'NotoSansCJKKR',
                    fontSize: 15.h,
                    height: 1),
              ),
              onPressed: () async {
                _alertCheck = true;
                Get.back();
              }),
          TextButton(
              child: Text(
                "아니오",
                style: TextStyle(
                    color: Color(0xff283137),
                    fontFamily: 'NotoSansCJKKR',
                    fontSize: 15.h,
                    height: 1),
              ),
              onPressed: () {
                Get.back();
              }),
        ],
      );
      if (_alertCheck == true) {
        //확인창에서 예 클릭시
        dynamic sendData =
            await ChangeProfileImageModel().toJson(selectImage.path);
        jsonResponse = await UserNetwork().patchUserProfileImage(sendData);
        model = ChangeProfileImageModel.fromJson(jsonResponse);

        if (model.code == 1) {
          getUserInfoModel.value.profileImage = model.imageUrl;
          getUserInfoModel.refresh();
          print('프로필 사진을 변경했습니다.');
        }
        if (model.code == 2) {}
        if (model.code == 3) {}
      }
      if (_alertCheck == false) {
        //확인창에서 아니오 클릭시
        print('프로필 사진 변경을 취소했습니다.');
      }
    }
  }

  Future<void> onChangedDefaultProfileImage() async {
    print('프로필 사진을 기본이미지로 변경합니다.');
    jsonResponse = await UserNetwork().patchUsersProfileimageDefault();
    model = ChangeDefaultProfileImageModel.fromJson(jsonResponse);

    if (model.code == 1) {
      getUserInfoModel.value.profileImage = model.imageUrl;
      getUserInfoModel.refresh();
      print('프로필 사진을 변경했습니다.');
    }
    if (model.code == 2) {}
    if (model.code == 3) {}
  }
}
