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
  Rx<AuthSignModel> authSignModel = AuthSignModel().obs;
  Rx<AuthLoginModel> authLoginModel = AuthLoginModel().obs;
  late NicknameDoubleCheckModel nicknameDoubleCheckModel;

  late RxString oauthAccessToken;
  RxBool isNicknameCheck = false.obs;
  RxBool readOnly = false.obs;
  Rx<TextEditingController> nicknameController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> smsAuthNumberController =
      TextEditingController().obs;
  Rx<SvgPicture> getAuthNumberButton = SvgPicture.asset(
    'assets/images_svg/btn_인증번호받기_off.svg',
    width: 92.w,
    height: 52.h,
    fit: BoxFit.fill,
  ).obs;
  Rx<SvgPicture> confirmAuthNumberButton = SvgPicture.asset(
    'assets/images_svg/btn_인증문자확인_off.svg',
    width: 375.w,
  ).obs;

  Map<String, dynamic> toJsonInput = {};
  String sendData = '';
  var jsonResponse;
  var model;

  Future<void> signUpClicked() async {
    toJsonInput.clear();
    toJsonInput['marketing'] = acceptList[2].value.check;
    toJsonInput['pushNotification'] = acceptList[3].value.check;
    toJsonInput['fcmToken'] = 'fcm_token';
    toJsonInput['nickname'] = nicknameController.value.value.text;
    toJsonInput['oauthAccessToken'] = oauthAccessToken.value;
    toJsonInput['phoneNumber'] = '010-3874-0360';
    jsonResponse = await OauthNetwork()
        .postOauthKakao(AuthSignModel().toJson(toJsonInput));
    model = AuthSignModel.fromJson(jsonResponse);
    authSignModel.update((val) {
      val!.code = model.code;
      val.accessToken = model.accessToken;
      val.refreshToken = model.refreshToken;
      val.description = model.description;
      val.isFirst = model.isFirst;
      val.result = model.result;
    });
    TokenModel().saveToken(
        authSignModel.value.accessToken!, authSignModel.value.refreshToken!);
    tokenController.token!['accessToken'] = authSignModel.value.accessToken!;
    tokenController.token!['refreshToken'] = authSignModel.value.refreshToken!;
  }

  void onKakaoLoginClicked() async {
    oauthAccessToken = (await Kakao().getKakaoToken()).obs;
    toJsonInput.clear();
    toJsonInput['oauthAccessToken'] = oauthAccessToken.value;
    jsonResponse = await OauthNetwork()
        .postOauthKakaoLogin(AuthLoginModel().toJson(toJsonInput));
    model = AuthLoginModel.fromJson(jsonResponse);

    authLoginModel.update((val) {
      val!.code = model.code;
      val.accessToken = model.accessToken;
      val.refreshToken = model.refreshToken;
      val.description = model.description;
      val.isFirst = model.isFirst;
      val.result = model.result;
    });

    if (authLoginModel.value.code == 1) {
      if (authLoginModel.value.isFirst == true) {
        print('첫 로그인이므로 회원가입 페이지로 이동합니다.');
        Get.to(() => GetUserInfo());
      }
      if (authLoginModel.value.isFirst == false) {
        print('이미 가입 된 유저이므로 토큰 저장 후, 메인페이지로 이동합니다.');
        TokenModel().saveToken(authLoginModel.value.accessToken!,
            authLoginModel.value.refreshToken!);
        tokenController.token!['accessToken'] =
            authLoginModel.value.accessToken!;
        tokenController.token!['refreshToken'] =
            authLoginModel.value.refreshToken!;
        Get.to(() => HomeMain());
      }
    }
    if (authLoginModel.value.code == 2) {
      print('잘못된 카카오 토큰입니다.');
    }
    if (authLoginModel.value.code == 3) {
      // 이 구문을 실행될 일이 없음
      print('토큰이 만료되었습니다.');
    }
  }

  void onPhoneNumberChanged() {
    if (RegExp(r'^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$')
            .hasMatch(phoneNumberController.value.value.text) ==
        false) {
      getAuthNumberButton.value = SvgPicture.asset(
        'assets/images_svg/btn_인증번호받기_off.svg',
        width: 92.w,
        height: 52.h,
        fit: BoxFit.fill,
      );
    } else {
      getAuthNumberButton.value = SvgPicture.asset(
        'assets/images_svg/btn_인증번호받기_on.svg',
        width: 92.w,
        height: 52.h,
        fit: BoxFit.fill,
      );
    }
  }

  void onAuthNumberChanged() {
    print(RegExp(r'^([0-9]{6})$')
        .hasMatch(smsAuthNumberController.value.value.text));
    if (RegExp(r'^([0-9]{6})$')
            .hasMatch(smsAuthNumberController.value.value.text) ==
        false) {
      confirmAuthNumberButton.value = SvgPicture.asset(
        'assets/images_svg/btn_인증문자확인_off.svg',
        width: 375.w,
        fit: BoxFit.fill,
      );
    } else {
      confirmAuthNumberButton.value = SvgPicture.asset(
        'assets/images_svg/btn_인증문자확인_on.svg',
        width: 375.w,
        height: 52.h,
        fit: BoxFit.fill,
      );
    }
  }

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
      Map<String, dynamic> toJsonInput = {
        'nickname': nicknameController.value.value.text.toString()
      };
      nicknameDoubleCheckModel =
          await UserNetwork().postUsersCheckNickname(toJsonInput);
      if (nicknameDoubleCheckModel.data == true) {
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

  void changeReadOnly() {
    readOnly = false.obs;
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
