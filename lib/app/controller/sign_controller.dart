import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignController extends GetxController {
  bool readOnly = false;
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
    code = json['code'];
    accessToken = json['data']['accessToken'].toString();
    isFirst = json['data']['isFirst'];
    refreshToken = json['data']['refreshToken'].toString();
    description = json['description'].toString();
    result = json['result'];
  }
}

class GetRefreshTokenController extends GetxController {
  late int code;
  late String refreshToken;
  late String description;
  late bool result;

  Future<void> saveRefreshTokenData(dynamic json) async {
    code = json['code'];
    refreshToken = json['data'].toString();
    description = json['description'].toString();
    result = json['result'];
  }
}

class PostUsersAccessController extends GetxController {
  late int code;
  late String data;
  late String description;
  late bool result;

  Future<void> checkUsersAccess(dynamic json) async {
    code = json['code'];
    data = json['data'].toString();
    description = json['description'].toString();
    result = json['result'];
  }
}
