import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/app/data/model/user_model.dart';
import 'package:damo/app/data/provider/user/user_api.dart';
import 'package:damo/view/mypage/edit_my_address.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class UserController extends GetxController {
  TokenController tokenController = Get.find();
  Rx<GetUserInfoModel> getUserInfoModel = GetUserInfoModel().obs;
  Rx<AccessTokenAvailableCheckModel> accessTokenAvailableCheckModel = AccessTokenAvailableCheckModel().obs;
  Rx<ChangeAddressModel> changeAddressModel = ChangeAddressModel().obs;
  Rx<NicknameDoubleCheckModel> nicknameDoubleCheckModel = NicknameDoubleCheckModel().obs;
  Rx<CheckOwnerModel> checkOwnerModel = CheckOwnerModel().obs;
  Rx<UserPhoneNumberModel> userPhoneNumberModel = UserPhoneNumberModel().obs;
  Rx<ChangeProfileImageModel> changeProfileImageModel = ChangeProfileImageModel().obs;
  Rx<ChangeDefaultProfileImageModel> changeDefaultProfileImageModel = ChangeDefaultProfileImageModel().obs;
  Rx<RefreshAccessTokenModel> refreshAccessTokenModel = RefreshAccessTokenModel().obs;
  RxBool? addrEditCheck = false.obs;
  Rx<TextEditingController> addr2Controller = TextEditingController(text: '').obs;
  RxString addr1 = ''.obs;
  RxString zipcode = ''.obs;
  RxString addr2 = ''.obs;

  Map<String, dynamic> input = {};
  String sendData = '';
  var response;
  var model;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    print('user');
    await getUserInfo();
  }

  Future<void> getUserInfo() async {
    print(tokenController.isAutoLogin!.value);
      input.clear();
      response = await UserNetwork().getUsers();
      model = GetUserInfoModel.fromJson(response);
      getUserInfoModel.update((val) {
        val!.code = model.code;
        val.addr1 = model.addr1;
        val.addr2 = model.addr2;
        val.zipcode = model.zipcode;
        val.ageRange = model.ageRange;
        val.lastAgreeDateOfMarketing = model.lastAgreeDateOfMarketing;
        val.lastAgreeDateOfPushNotification = model.lastAgreeDateOfPushNotification;
        val.lastAgreeDateOfServiceAndPersonalData = model.lastAgreeDateOfServiceAndPersonalData;
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
      print(getUserInfoModel.value.profileImage);
      if (getUserInfoModel.value.code == 1) {
      } else if (getUserInfoModel.value.code == 2) {
      } else {
        tokenController.reGetAccessToken();
      }


  }

  void isAvailableAccessToken() {}

  Future<void> registerAddress() async {
    input.clear();
    input['addr1'] = addr1.value;
    input['addr2'] = addr2.value;
    input['zipcode'] = zipcode.value;
    print(input);
    sendData = ChangeAddressModel().toJson(input);
    response = await UserNetwork().postUsersAddress(sendData);
    print(response);
    model = ChangeAddressModel.fromJson(response);
    changeAddressModel.update((val) {
      val!.code = model.code;
      val.description = model.description;
      val.result = model.result;
    });

    if (changeAddressModel.value.code == 3) {
      tokenController.reGetAccessToken();
      print(3);
    } else if (changeAddressModel.value.code == 2){
      return;
    }
    print(1);
    /*getUserInfoModel.value.addr1 = addr1.value;
    getUserInfoModel.value.addr2 = addr2Controller.value.value.text;
    getUserInfoModel.value.zipcode = zipcode.value;*/
    change(addr1: addr1.value, addr2: addr2.value, zipcode: zipcode.value);

    print(getUserInfoModel.value.addr1);
    print(getUserInfoModel.value.addr2);
  }

  change({
    String? addr1,
    String? addr2,
    String? zipcode
  }) {
    getUserInfoModel.update((val){

      val!.addr1 = addr1;
      val.addr2 = addr2;
      val.zipcode = zipcode;
    });
  }

  Future<void> onAddressChanged() async {
    await Get.to(() => EditMyAddress());
    if (addrEditCheck!.value ==
        true) {
      await Get.defaultDialog(
        title: '상세 주소입력',
        titleStyle: TextStyle(
          color: Color(0xff283137),
          fontSize: 16,
          fontFamily: 'NotoSansCJKKR',
          fontWeight: FontWeight.w700,
        ),
        content: Padding(
          padding: const EdgeInsets.fromLTRB(
              0, 20, 0, 0),
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
                addr2Controller.value.clear();
                Get.back();
              }),
        ],
      );
      addrEditCheck = false.obs;
    }
  }
}
