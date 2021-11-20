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
