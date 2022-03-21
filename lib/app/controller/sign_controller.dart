import 'package:damo/app/controller/shop_controller.dart';
import 'package:damo/app/controller/user_controller.dart';
import 'package:damo/app/data/model/oauth_model.dart';
import 'package:damo/app/data/model/token_model.dart';
import 'package:damo/app/data/model/user_model.dart';
import 'package:damo/app/data/provider/apple.dart';
import 'package:damo/app/data/provider/kakao.dart';
import 'package:damo/app/data/provider/oauth_api.dart';
import 'package:damo/app/data/provider/user/user_api.dart';
import 'package:damo/view/main/home_main.dart';
import 'package:damo/view/sign/get_user_name.dart';
import 'package:damo/view/sign/get_user_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_controller.dart';

import 'notification/notofication_controller.dart';

class SignController extends GetxController {
  Rx<AuthSignModel> authSignModel = AuthSignModel().obs;
  Rx<AuthLoginModel> authLoginModel = AuthLoginModel().obs;
  late NicknameDoubleCheckModel nicknameDoubleCheckModel;
  late RxString oauthAccessToken;
  RxBool isNicknameCheck = false.obs;
  RxBool readOnlyPhoneNumber = false.obs;
  Rx<FocusNode> nicknameFocusNode = FocusNode().obs;
  Rx<FocusNode> phoneNumberFocusNode = FocusNode().obs;
  Rx<TextEditingController> nicknameController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> smsAuthNumberController =
      TextEditingController().obs;
  Rx<Color> getAuthNumberButtonColor = Color(0xffd1d1d6).obs;
  Rx<Color> confirmAuthNumberButtonColor = Color(0xffd1d1d6).obs;
  Rx<CountdownController> countdownController =
      CountdownController(autoStart: true).obs;
  RxBool countdownVisibility = false.obs;
  RxString nicknameCheckString = '* 닉네임은 한글, 숫자, 영문으로 된 2~8자로 구성해주세요.'.obs;
  RxBool enableGetAuthNumberButton = false.obs;

  String? verificationUserId;
  /*FirebaseAuth auth = FirebaseAuth.instance;
  PhoneAuthCredential? phoneAuthCredential;*/

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
    toJsonInput['phoneNumber'] = phoneNumberController.value.text;
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
    Get.offAll(() => HomeMain());
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
        Get.to(() => GetUserNumber(), binding: SignBinding());
      }
      if (authLoginModel.value.isFirst == false) {
        print('이미 가입 된 유저이므로 토큰 저장 후, 메인페이지로 이동합니다.');
        TokenModel().saveToken(authLoginModel.value.accessToken!,
            authLoginModel.value.refreshToken!);
        tokenController.token!['accessToken'] =
            authLoginModel.value.accessToken!;
        tokenController.token!['refreshToken'] =
            authLoginModel.value.refreshToken!;
        Get.offAll(() => HomeMain(), binding: BindingsBuilder(() {
          NotificationBinding().dependencies();
          UserBinding().dependencies();
          ShopBinding().dependencies();
        }));
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

  void onAppleLoginClicked() async {
    oauthAccessToken = await Apple().getAppleToken();
    toJsonInput.clear();
    toJsonInput['oauthAccessToken'] = oauthAccessToken.value;

    jsonResponse = await OauthNetwork()
        .postOauthAppleLogin(AuthLoginModel().toJson(toJsonInput));
    model = AuthLoginModel.fromJson(jsonResponse);

    authLoginModel.update((val) {
      val!.code = model.code;
      val.accessToken = model.accessToken;
      val.refreshToken = model.refreshToken;
      val.description = model.description;
      val.isFirst = model.isFirst;
      val.result = model.result;
    });

    TokenModel().saveToken(
        authLoginModel.value.accessToken!, authLoginModel.value.refreshToken!);
    tokenController.token!['accessToken'] = authLoginModel.value.accessToken!;
    tokenController.token!['refreshToken'] = authLoginModel.value.refreshToken!;
    Get.offAll(() => HomeMain());
  }

  void onPhoneNumberChanged() {
    if (RegExp(r'^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$')
            .hasMatch(phoneNumberController.value.value.text) ==
        true) {
      getAuthNumberButtonColor.value = Color(0xfff93f5b);
      enableGetAuthNumberButton.value = true;
    } else {
      getAuthNumberButtonColor.value = Color(0xffd1d1d6);
      enableGetAuthNumberButton.value = false;
    }
  }

  void onAuthNumberChanged() {
    if (RegExp(r'^([0-9]{6})$')
            .hasMatch(smsAuthNumberController.value.value.text) ==
        true) {
      confirmAuthNumberButtonColor.value = Color(0xfff93f5b);
    } else {
      confirmAuthNumberButtonColor.value = Color(0xffd1d1d6);
    }
  }

  var acceptList = [
    AcceptRadioModel('모두 동의').obs,
    AcceptRadioModel('서비스 이용약관 동의(필수)').obs,
    AcceptRadioModel('개인정보의 수집 및 이용 동의(필수)').obs,
    AcceptRadioModel('앱푸쉬 알림 동의(선택)').obs,
    AcceptRadioModel('마케팅 수신 동의(선택)').obs,
  ].obs;

  void doubleCheckClicked() async {
    nicknameFocusNode.value.unfocus();
    if (RegExp(r'^([가-힣a-zA-Z0-9]){2,8}$')
            .hasMatch(nicknameController.value.text) ==
        true) {
      Map<String, dynamic> input = {
        'nickname': nicknameController.value.value.text.toString()
      };
      nicknameDoubleCheckModel =
          await UserNetwork().postUsersCheckNickname(input);
      if (nicknameDoubleCheckModel.data == true) {
        isNicknameCheck.value = true;
        nicknameCheckString.value = '사용가능한 닉네임 입니다!';
      } else {
        isNicknameCheck.value = false;
        nicknameCheckString.value = '이미 존재하는 닉네임 입니다.';
      }
    } else {
      nicknameCheckString.value =
          '알맞지 않은 닉네임 입력입니다.\n* 한글, 숫자, 영문으로 된 2~8자로 구성해주세요.';
    }
  }

  void acceptOn(int index) {
    if (index == 0) {
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
    } else {
      acceptList[index].update((val) {
        val!.check = true;
        val.ic = SvgPicture.asset(
          'assets/images_svg/ic_radiobtn_on.svg',
          width: 20.w,
          height: 20.h,
        );
      });
      if (acceptList[1].value.check == true &&
          acceptList[2].value.check == true &&
          acceptList[3].value.check == true &&
          acceptList[4].value.check == true) {
        acceptList[0].update((val) {
          val!.check = true;
          val.ic = SvgPicture.asset(
            'assets/images_svg/ic_radiobtn_on.svg',
            width: 20.w,
            height: 20.h,
          );
        });
      } else {
        acceptList[0].update((val) {
          val!.check = false;
          val.ic = SvgPicture.asset(
            'assets/images_svg/ic_radiobtn_off.svg',
            width: 20.w,
            height: 20.h,
          );
        });
      }
    }
  }

  void acceptOff(int index) {
    if (index == 0) {
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
      acceptList[index].update((val) {
        val!.check = false;
        val.ic = SvgPicture.asset(
          'assets/images_svg/ic_radiobtn_off.svg',
          width: 20.w,
          height: 20.h,
        );
      });
      if (acceptList[1].value.check == true &&
          acceptList[2].value.check == true &&
          acceptList[3].value.check == true &&
          acceptList[4].value.check == true) {
        acceptList[0].update((val) {
          val!.check = true;
          val.ic = SvgPicture.asset(
            'assets/images_svg/ic_radiobtn_on.svg',
            width: 20.w,
            height: 20.h,
          );
        });
      } else {
        acceptList[0].update((val) {
          val!.check = false;
          val.ic = SvgPicture.asset(
            'assets/images_svg/ic_radiobtn_off.svg',
            width: 20.w,
            height: 20.h,
          );
        });
      }
    }
  }

  get confirmButtonColor => (acceptList[1].value.check &&
          acceptList[2].value.check &&
          isNicknameCheck.value)
      ? Color(0xfff93f5b)
      : Color(0xffd1d1d6);

  void changeReadOnly() {
    readOnlyPhoneNumber = false.obs;
  }

  /*void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      await auth.signInWithCredential(phoneAuthCredential);
      Get.to(() => GetUserNickname());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }*/

  void verifyPhoneNumber() async {
    print('verifyPhoneNumber');
    phoneNumberFocusNode.value.unfocus();
    String phoneNumber = '+82' +
        phoneNumberController.value.value.text.split('-')[0][1] +
        phoneNumberController.value.value.text.split('-')[0][2] +
        phoneNumberController.value.value.text.split('-')[1] +
        phoneNumberController.value.value.text.split('-')[2];

    /*await auth.verifyPhoneNumber(
      timeout: const Duration(seconds: 120),
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) async {
        print("otp 문자옴");
      },
      verificationFailed: (verificationFailed) async {
        print(verificationFailed.code);
        print(verificationFailed.message);
        print(verificationFailed);
        print("코드발송실패");
      },
      codeSent: (verificationId, resendToken) async {
        print("코드보냄");
        countdownVisibility.value = true;
        readOnlyPhoneNumber.value = true;
        getAuthNumberButtonColor.value = Color(0xffd1d1d6);
        enableGetAuthNumberButton.value = false;
        verificationUserId = verificationId;
      },
    );*/
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

class SignBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<SignController>(SignController());
  }
}
