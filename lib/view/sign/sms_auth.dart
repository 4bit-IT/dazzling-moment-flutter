import 'package:damo/app/controller/sign_controller.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/custom_textfield.dart';
import 'package:damo/viewmodel/get_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:timer_count_down/timer_count_down.dart';

class SMSAuth extends StatelessWidget {
  final SignController signController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        FocusScope.of(context).unfocus();
        return Future(() {
          return GetDialog().backButtonDialog(() {
            signController.countdownVisibility.value = false;
            signController.authNumberFocusNode[0].requestFocus();
            for (int i = 0; i < 4; i++) {
              signController.authNumberController[i].clear();
            }
          });
        });
      },
      child: Scaffold(
        appBar: DamoAppBar().textAppBar(context, '회원가입'),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '인증번호를 입력하세요',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    height: (375 / 5).w,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          width: (375 / 5).w,
                          child: CustomTextField().focusTextField(
                              signController.authNumberController[index],
                              false,
                              TextInputType.phone,
                              TextAlign.center,
                              '',
                              1,
                              1, () {
                            signController.onAuthNumberChanged(context, index);
                          }, [MaskTextInputFormatter(mask: '#')], "",
                              signController.authNumberFocusNode[index]),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 10.w,
                        );
                      },
                    ),
                  ),
                  /*Container(
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
                              // if (signController.enableGetAuthNumberButton
                              //     .value) signController.verifyPhoneNumber();
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
                  ),*/
                  SizedBox(
                    height: 24.h,
                  ),
                  InkWell(
                    onTap: () {
                      /*signController.phoneAuthCredential =
                  PhoneAuthProvider.credential(
                      verificationId: signController.verificationUserId!,
                      smsCode:
                          signController.smsAuthNumberController.value.text);
              signController.signInWithPhoneAuthCredential(
                  signController.phoneAuthCredential!);*/
                    },
                    child: Obx(
                      () => Container(
                        alignment: Alignment.center,
                        height: 60.h,
                        color: signController.getAuthNumberButtonColor.value,
                        child: Text(
                          '다음',
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
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Countdown(
                        seconds: 120,
                        build: (BuildContext context, double time) {
                          return Text(
                            '${(time ~/ 60).toString()} : ${(time.toInt() % 60).toString()}',
                            style: TextStyle(color: Color(0xfff93f5b)),
                          );
                        },
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          '재전송',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                  /*Text('인증 번호'),
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
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:damo/viewmodel/bar/app_bar.dart';
// import 'package:damo/view/main/home_main.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:sms_autofill/sms_autofill.dart';
// import 'package:get/get.dart';

// class smsAuth extends StatefulWidget {
//   @override
//   _smsAuthState createState() => _smsAuthState();
// }

// class _smsAuthState extends State<smsAuth> {
//   TextEditingController controller = TextEditingController();
//   TextEditingController controller2 = TextEditingController();
//   final SmsAutoFill _autoFill = SmsAutoFill();
//   String? _verificationId;
//   FirebaseAuth auth = FirebaseAuth.instance;

//   void verifyPhoneNumber() async {
//     print(controller.value.text);

//     //사용자가 이전에 인증했는지 확인하고, 다른 SMS 인증 코드를 제출하지 않고 Firebase에 로그인 할 수 있는지 확인
//     PhoneVerificationCompleted verificationCompleted =
//         (PhoneAuthCredential phoneAuthCredential) async {
//       await auth.signInWithCredential(phoneAuthCredential);
//       print("휴대폰 번호가 자동으로 인증되고 사용자가 로그인 해 있다: ${auth.currentUser!.uid}");
//     };

//     //오류 수신
//     PhoneVerificationFailed verificationFailed =
//         (FirebaseAuthException authException) {
//       print(
//           '전화 번호 인증 실패. Code: ${authException.code}. Message: ${authException.message}');
//     };

//     //SMS를 보낼 때 Firebase에서 생성 한 확인 ID를 저장. 이 값은 나중에 사용자가 로그인 할 때 필요.
//     void Function(String verificationId, int? forceResendingToken) codeSent =
//         (String verificationId, int? forceResendingToken) async {
//       print('Please check your phone for the verification code.');
//       _verificationId = verificationId;
//     };

//     //장치에서 지원하는 경우 SMS 자동 검색 시간이 초과되면 앱에 알리고 앱에 대한 인증 ID를 제공
//     PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
//         (String verificationId) {
//       print("verification code: " + verificationId);
//       _verificationId = verificationId;
//     };

//     try {
//       await auth.verifyPhoneNumber(
//           phoneNumber: controller.text,
//           timeout: const Duration(seconds: 5),
//           verificationCompleted: verificationCompleted,
//           verificationFailed: verificationFailed,
//           codeSent: codeSent,
//           codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
//     } catch (e) {
//       print("Failed to Verify Phone Number: $e");
//     }
//   }

//   void signInWithPhoneNumber() async {
//     try {
//       final AuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: _verificationId!,
//         smsCode: controller2.text,
//       );

//       final User? user = (await auth.signInWithCredential(credential)).user;

//       print("Successfully signed in UID: ${user!.uid}");
//       Get.to(() => HomeMain());
//     } catch (e) {
//       print("Failed to sign in: " + e.toString());
//       Get.snackbar('실패', '실패');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: DamoAppBar().noSearchBar(context),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             TextFormField(
//               controller: controller,
//               decoration: const InputDecoration(
//                   labelText: 'Phone number (+xx xxx-xxx-xxxx)'),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 16.0),
//               alignment: Alignment.center,
//               child: CupertinoButton(
//                 color: Colors.greenAccent[400],
//                 child: Text("현재 번호 가져오기"),
//                 onPressed: () async {
//                   try {
//                     controller.text = (await _autoFill.hint)!;
//                   } catch (e) {
//                     print(e);
//                   }
//                 },
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 16.0),
//               alignment: Alignment.center,
//               child: CupertinoButton(
//                 color: Colors.greenAccent[400],
//                 child: Text("Verify Number"),
//                 onPressed: () async {
//                   verifyPhoneNumber();
//                 },
//               ),
//             ),
//             TextFormField(
//               controller: controller2,
//               decoration: const InputDecoration(labelText: 'Verification code'),
//             ),
//             Container(
//               padding: const EdgeInsets.only(top: 16.0),
//               alignment: Alignment.center,
//               child: CupertinoButton(
//                   color: Colors.greenAccent[200],
//                   onPressed: () async {
//                     signInWithPhoneNumber();
//                   },
//                   child: Text("Sign in")),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
