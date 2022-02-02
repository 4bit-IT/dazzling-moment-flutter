import 'package:damo/app/controller/sign_controller.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/get_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:timer_count_down/timer_count_down.dart';

class GetUserNumber extends StatelessWidget {
  final SignController signController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        FocusScope.of(context).unfocus();
        return Future(() {
          return GetDialog().backButtonDialog(() {
            signController.phoneNumberController.value.clear();
            signController.smsAuthNumberController.value.clear();
            signController.countdownVisibility.value = false;
            signController.getAuthNumberButtonColor.value = Color(0xffd1d1d6);
            signController.readOnlyPhoneNumber.value = false;
          });
        });
      },
      child: Scaffold(
        appBar: DamoAppBar().textAppBar(context, '회원가입'),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('휴대폰 번호'),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      height: 52.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xffd1d1d6),
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 0),
                              child: Obx(
                                () => TextFormField(
                                  readOnly:
                                      signController.readOnlyPhoneNumber.value,
                                  onChanged: (text) {
                                    signController.onPhoneNumberChanged();
                                  },
                                  controller: signController
                                      .phoneNumberController.value,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    MaskTextInputFormatter(
                                      mask: '###-####-####',
                                    )
                                  ],
                                  style: TextStyle(
                                    fontFamily: 'NotoSansCJKKR',
                                    fontSize: 18.sp,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '휴대폰 번호를 입력해주세요',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Obx(
                            () => InkWell(
                              onTap: () {
                                if (signController.enableGetAuthNumberButton
                                    .value) signController.verifyPhoneNumber();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 92.w,
                                height: 52.h,
                                decoration: BoxDecoration(
                                  color: signController
                                      .getAuthNumberButtonColor.value,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.r),
                                    bottomRight: Radius.circular(10.r),
                                  ),
                                ),
                                child: Text('인증문자 받기'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text('인증 번호'),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      height: 52.h,
                      padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xffd1d1d6),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: TextFormField(
                              onChanged: (text) {
                                signController.onAuthNumberChanged();
                              },
                              controller:
                                  signController.smsAuthNumberController.value,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                MaskTextInputFormatter(
                                  mask: '######',
                                  filter: {'#': RegExp(r'^[0-9]')},
                                ),
                              ],
                              style: TextStyle(
                                fontFamily: 'NotoSansCJKKR',
                                fontSize: 18.sp,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '인증번호를 입력해주세요',
                              ),
                            ),
                          ),
                          Obx(
                            () => Expanded(
                              flex: 1,
                              child: Visibility(
                                visible:
                                    signController.countdownVisibility.value,
                                child: Countdown(
                                  seconds: 120,
                                  build: (BuildContext context, double time) {
                                    return Text(
                                        '${(time ~/ 60).toString()} : ${(time.toInt() % 60).toString()}');
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      '많은 인증 번호 요청 시 사용이 제한될 수 있습니다',
                      style: TextStyle(
                        fontFamily: 'NotoSansCJKKR',
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                signController.phoneAuthCredential =
                    PhoneAuthProvider.credential(
                        verificationId: signController.verificationUserId!,
                        smsCode:
                            signController.smsAuthNumberController.value.text);
                signController.signInWithPhoneAuthCredential(
                    signController.phoneAuthCredential!);
              },
              child: Obx(
                () => Container(
                  alignment: Alignment.center,
                  height: 60.h,
                  color: signController.confirmAuthNumberButtonColor.value,
                  child: Text(
                    '인증문자 확인',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontFamily: 'NotoSansCJKKR',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
