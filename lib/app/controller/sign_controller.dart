import 'package:damo/app/data/model/oauth_model.dart';
import 'package:damo/app/data/model/token_model.dart';
import 'package:damo/app/data/model/user_model.dart';
import 'package:damo/app/data/provider/kakao.dart';
import 'package:damo/app/data/provider/oauth_api.dart';
import 'package:damo/app/data/provider/user/user_api.dart';
import 'package:damo/view/main/home_main.dart';
import 'package:damo/view/sign/get_user_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignController extends GetxController {
  bool readOnly = false;
  late Rx<AuthSignModel> authSignModel;
  late Rx<AuthLoginModel> authLoginModel;
  late Rx<Future<String>> oauthAccessToken;
  Map<String, dynamic> input = {};
  onKakaoLoginClicked() async {
    oauthAccessToken = Kakao().getKakaoToken().obs;
    input.clear();
    input['oauthAccessToken'] = oauthAccessToken;
    authLoginModel = AuthLoginModel.fromJson(await OauthNetwork().postOauthKakaoLogin(input)).obs;

<<<<<<< HEAD
=======
    if(authLoginModel.value.code == 1 && authLoginModel.value.result == true) {
      if(authLoginModel.value.isFirst == true && authLoginModel.value.accessToken =='' && authLoginModel.value.refreshToken == ''){
        //첫 로그인
        Get.to(() => GetUserInfo());
      }
      else {
        Token().saveToken(authLoginModel.value.accessToken, authLoginModel.value.refreshToken);
        Get.to(() => HomeMain());
      }
    }
    else {
      print('잘못된 카카오 토큰');
    }
  }

>>>>>>> d65dc7e35b3a3b372cacae7872facdab7a099334
  var isNicknameCheck = false.obs;
  NicknameDoubleCheckModel? nicknameDoubleCheckModel;
  var nicknameController = TextEditingController().obs;
  var acceptList = [
    AcceptRadioModel(
      '모두 동의',
    ).obs,
    AcceptRadioModel(
      '서비스 이용약관 동의(필수)',
    ).obs,
    AcceptRadioModel(
      '개인정보의 수집 및 이용 동의(필수)',
    ).obs,
    AcceptRadioModel(
      '앱푸쉬 알림 동의(선택)',
    ).obs,
    AcceptRadioModel(
      '마케팅 수신 동의(선택)',
    ).obs,
  ].obs;

  void doubleCheckClicked() async {
    if (RegExp(r'^([가-힣a-zA-Z0-9]){2,8}$')
            .hasMatch(nicknameController.value.text) ==
        true) {
      Map<String, dynamic> input = {
        'nickname': nicknameController.value.value.text.toString()
      };
      nicknameDoubleCheckModel =
          await UserNetwork().postUsersCheckNickname(input);
      if (nicknameDoubleCheckModel!.data == true) {
        isNicknameCheck = true.obs;
        Get.snackbar('닉네임 중복확인', '사용가능한 닉네임 입니다.');
      } else {
        isNicknameCheck = false.obs;
        Get.snackbar('닉네임 중복확인', '이미 존재하는 닉네임 입니다.');
      }
      isNicknameCheck = true.obs;
    } else {
      Get.snackbar('닉네임', '알맞지 않은 닉네임 입력입니다.');
    }
  }

  void acceptClicked(int index) {
    if (index == 0) {
      if (acceptList[0].value.check == true) {
        for (int i = 0; i < 5; i++) {
          acceptList[i].update((val) {
            val!.check = false;
            val.ic = SvgPicture.asset(
              'assets/images_svg/ic_radiobtn_off.svg',
              width: 20.w,
              height: 20.h,
            );
          });
        }
      } else {
        for (int i = 0; i < 5; i++) {
          acceptList[i].update((val) {
            val!.check = true;
            val.ic = SvgPicture.asset(
              'assets/images_svg/ic_radiobtn_on.svg',
              width: 20.w,
              height: 20.h,
            );
          });
        }
      }
    } else {
      if (acceptList[index].value.check == true) {
        acceptList[index].update((val) {
          val!.check = false;
          val.ic = SvgPicture.asset(
            'assets/images_svg/ic_radiobtn_off.svg',
            width: 20.w,
            height: 20.h,
          );
        });
      } else {
        acceptList[index].update((val) {
          val!.check = true;
          val.ic = SvgPicture.asset(
            'assets/images_svg/ic_radiobtn_on.svg',
            width: 20.w,
            height: 20.h,
          );
        });
      }
      for (int i = 1; i < 5; i++) {
        if (acceptList[i].value.check == false) {
          acceptList[0].update((val) {
            val!.check = false;
            val.ic = SvgPicture.asset(
              'assets/images_svg/ic_radiobtn_off.svg',
              width: 20.w,
              height: 20.h,
            );
          });
          break;
        }
        if (i == 4) {
          acceptList[0].update((val) {
            val!.check = true;
            val.ic = SvgPicture.asset(
              'assets/images_svg/ic_radiobtn_on.svg',
              width: 20.w,
              height: 20.h,
            );
          });
        }
      }
    }
  }

  get getConfirmButton => (acceptList[1].value.check &&
          acceptList[2].value.check &&
          isNicknameCheck.value)
      ? SvgPicture.asset(
          'assets/images_svg/btn_확인_on.svg',
          width: 375.w,
          fit: BoxFit.fill,
        ).obs
      : SvgPicture.asset(
          'assets/images_svg/btn_확인_off.svg',
          width: 375.w,
          fit: BoxFit.fill,
        ).obs;

  Widget getAuthNumberButton = SvgPicture.asset(
    'assets/images_svg/btn_인증번호받기_off.svg',
    width: 92.w,
    height: 52.h,
    fit: BoxFit.fill,
  );
  Widget confirmAuthNumberButton = SvgPicture.asset(
    'assets/images_svg/btn_인증문자확인_off.svg',
    width: 375.w,
  );
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController smsAuthNumberController = TextEditingController();

  void onGetAuthNumberButton() {
    getAuthNumberButton = SvgPicture.asset(
      'assets/images_svg/btn_인증번호받기_on.svg',
      width: 92.w,
      height: 52.h,
      fit: BoxFit.fill,
    );

    update();
  }

  void offGetAuthNumberButton() {
    getAuthNumberButton = SvgPicture.asset(
      'assets/images_svg/btn_인증번호받기_off.svg',
      width: 92.w,
      height: 52.h,
      fit: BoxFit.fill,
    );

    update();
  }

  void onConfirmAuthNumberButton() {
    confirmAuthNumberButton = SvgPicture.asset(
      'assets/images_svg/btn_인증문자확인_on.svg',
      width: 375.w,
    );

    update();
  }

  void offConfirmAuthNumberButton() {
    confirmAuthNumberButton = SvgPicture.asset(
      'assets/images_svg/btn_인증문자확인_off.svg',
      width: 375.w,
    );
  }

  void changeReadOnly() {
    readOnly = false;

    update();
  }

  void conditionAuthNumber(String text) {
    print(RegExp(r'^([0-9]{6})$').hasMatch(text));
    if (RegExp(r'^([0-9]{6})$').hasMatch(text) == false) {
      offConfirmAuthNumberButton();
    } else {
      onConfirmAuthNumberButton();
    }
  }
}

class PostKakaoLoginController extends GetxController {
  late int code;
  late String accessToken;
  late bool isFirst;
  late String refreshToken;
  late String description;
  late bool result;

  Future<void> saveKakaoLoingData(dynamic json) async {
    code = await json['code'];
    accessToken = await json['data']['accessToken'];
    isFirst = await json['data']['isFirst'];
    refreshToken = await json['data']['refreshToken'];
    description = await json['description'];
    result = await json['result'];
  }
}

class GetRefreshTokenController extends GetxController {
  late int code;
  late RxString refreshToken;
  late RxString description;
  late bool result;

  Future<void> saveRefreshTokenData(dynamic json) async {
    code = json['code'];
    refreshToken = json['data'].toString().obs;
    description = json['description'].toString().obs;
    result = json['result'];
  }
}

class PostUsersAccessController extends GetxController {
  late int code;
  late String data;
  late String description;
  late bool result;

  Future<void> checkUsersAccess(dynamic json) async {
    description = json['description'].toString();
    code = json['code'];
    data = json['data'].toString();
    result = json['result'];
  }
}

class AcceptRadioModel {
  bool check = false;
  var ic = SvgPicture.asset(
    'assets/images_svg/ic_radiobtn_off.svg',
    width: 20.w,
    height: 20.h,
  );
  late String description;

  AcceptRadioModel(String description) : this.description = description;
}
