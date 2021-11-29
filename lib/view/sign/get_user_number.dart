import 'package:damo/app/controller/sign_controller.dart';
import 'package:damo/view/sign/get_user_name.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetUserInfo extends StatelessWidget {
  final SignController signController = Get.find();
  String? _verificationId;
  FirebaseAuth auth = FirebaseAuth.instance;
  PhoneAuthCredential? phoneAuthCredential;

  List<Widget> authNumber = [
    Text(
      '인증 번호',
      style: TextStyle(
        color: Color(0xff283137),
        fontFamily: 'NotoSansCJKKR',
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  ];

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
          await auth.signInWithCredential(phoneAuthCredential);
      Get.to(() => GetUserNickname());
      if (authCredential.user != null) {
        await auth.currentUser!.delete();
        print("auth정보삭제");
        auth.signOut();
        print("phone로그인된것 로그아웃");
      }
    } on FirebaseAuthException catch (e) {}
  }

  void verifyPhoneNumber() async {
    String phoneNumber = '+82' +
        signController.phoneNumberController.value.value.text.split('-')[0][1] +
        signController.phoneNumberController.value.value.text.split('-')[0][2] +
        signController.phoneNumberController.value.value.text.split('-')[1] +
        signController.phoneNumberController.value.value.text.split('-')[2];

    await auth.verifyPhoneNumber(
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
        _verificationId = verificationId;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().textAppBar(context, '회원가입'),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '휴대폰 번호',
                    style: TextStyle(
                        color: Color(0xff283137),
                        fontFamily: 'NotoSansCJKKR',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        height: 1),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    height: 52.h,
                    width: 343.w,
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
                            child: TextFormField(
                              onChanged: (text) {
                                signController.onPhoneNumberChanged();
                              },
                              controller:
                                  signController.phoneNumberController.value,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                MaskTextInputFormatter(
                                  mask: '###-####-####',
                                )
                              ],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '  휴대폰 번호를 입력해주세요',
                                hintStyle: TextStyle(
                                  color: Color(0xffd1d1d6),
                                  fontFamily: 'NotoSansCJKKR',
                                  fontSize: 14.sp,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (RegExp(r'^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$')
                                    .hasMatch(signController
                                        .phoneNumberController.value.text) ==
                                true) {
                              verifyPhoneNumber();
                            }
                          },
                          child: Obx(
                              () => signController.getAuthNumberButton.value),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: authNumber,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    height: 52.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xffd1d1d6),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Container(
                      child: GetBuilder<SignController>(
                        builder: ((_) {
                          return TextFormField(
                            readOnly: signController.readOnly.value,
                            onChanged: (text) {
                              signController.onAuthNumberChanged();
                            },
                            controller:
                                signController.smsAuthNumberController.value,
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              MaskTextInputFormatter(
                                mask: '######',
                                filter: {'#': RegExp(r'^[0-9]')},
                              ),
                            ],
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusColor: Colors.black,
                              hintText: '  인증번호를 입력해주세요',
                              hintStyle: TextStyle(
                                color: Color(0xffd1d1d6),
                                fontFamily: 'NotoSansCJKKR',
                                fontSize: 14.sp,
                                height: 1,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              phoneAuthCredential = PhoneAuthProvider.credential(
                  verificationId: _verificationId!,
                  smsCode: signController.smsAuthNumberController.value.text);
              signInWithPhoneAuthCredential(phoneAuthCredential!);
              print(phoneAuthCredential!.token);
            },
            child: Obx(() => signController.confirmAuthNumberButton.value),
          ),
        ],
      ),
    );
  }
}
