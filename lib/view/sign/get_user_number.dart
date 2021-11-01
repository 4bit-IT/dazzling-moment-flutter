import 'package:damo/app/controller/sign_controller.dart';
import 'package:damo/view/sign/get_user_name.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetUserInfo extends StatelessWidget {
  final SignController getController = Get.put(SignController());
  String? _verificationId;
  FirebaseAuth auth = FirebaseAuth.instance;

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

  void verifyPhoneNumber() async {
    String phoneNumber = '+82' +
        getController.phoneNumberController.value.text.split('-')[0][1] +
        getController.phoneNumberController.value.text.split('-')[0][2] +
        getController.phoneNumberController.value.text.split('-')[1] +
        getController.phoneNumberController.value.text.split('-')[2];

    //auth.setSettings(appVerificationDisabledForTesting: true);

    //사용자가 이전에 인증했는지 확인하고, 다른 SMS 인증 코드를 제출하지 않고 Firebase에 로그인 할 수 있는지 확인
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await auth.signInWithCredential(phoneAuthCredential);
      print("휴대폰 번호가 자동으로 인증되고 사용자가 로그인 해 있다: ${auth.currentUser!.uid}");
    };

    //오류 수신
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      print(
          '전화 번호 인증 실패. Code: ${authException.code}. Message: ${authException.message}');
    };

    //SMS를 보낼 때 Firebase에서 생성 한 확인 ID를 저장. 이 값은 나중에 사용자가 로그인 할 때 필요.
    void Function(String verificationId, int? forceResendingToken) codeSent =
        (String verificationId, int? forceResendingToken) async {
      print('Please check your phone for the verification code.');
      _verificationId = verificationId;
    };

    //장치에서 지원하는 경우 SMS 자동 검색 시간이 초과되면 앱에 알리고 앱에 대한 인증 ID를 제공
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      print("verification code: " + verificationId);
      _verificationId = verificationId;
    };

    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: const Duration(seconds: 120),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);

      getController.offGetAuthNumberButton();
      getController.changeReadOnly();
    } catch (e) {
      print("Failed to Verify Phone Number: $e");
    }
  }

  void signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: getController.smsAuthNumberController.text,
      );

      final User? user = (await auth.signInWithCredential(credential)).user;

      print("Successfully signed in UID: ${user!.uid}");
      Get.to(() => GetUserNickname());
    } catch (e) {
      print("Failed to sign in: " + e.toString());
      Get.snackbar('실패', '실패');
    }
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
                      height: 1
                    ),
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
                                print(text);
                                print(RegExp(
                                        r'^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$')
                                    .hasMatch(
                                    getController.phoneNumberController.value.text));
                                if (RegExp(r'^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$')
                                        .hasMatch(
                                    getController.phoneNumberController.value.text) ==
                                    false) {
                                  getController.offGetAuthNumberButton();
                                } else {
                                  getController.onGetAuthNumberButton();
                                }
                              },
                              controller: getController.phoneNumberController,
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
                        GetBuilder<SignController>(builder: (_) {
                          return InkWell(
                            onTap: () {
                              if (RegExp(r'^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$')
                                      .hasMatch(
                                  getController.phoneNumberController.value.text) ==
                                  true) {
                                verifyPhoneNumber();
                              }
                            },
                            child: getController.getAuthNumberButton,
                          );
                        }),
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
                            readOnly: getController.readOnly,
                            onChanged: (text) {
                              getController.conditionAuthNumber(text);
                            },
                            controller: getController.smsAuthNumberController,
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
          GetBuilder<SignController>(builder: (_) {
            return InkWell(
                onTap: () {
                  signInWithPhoneNumber();
                },
                child: getController.confirmAuthNumberButton);
          }),
        ],
      ),
    );
  }
}
