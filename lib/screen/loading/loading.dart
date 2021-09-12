// import 'dart:async';

// import 'package:damo/screen/home_main.dart';
// import 'package:damo/sign/sign.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import package:flutter/material.dart';
// import 'package:transition/transition.dart';

// class Loading extends StatefulWidget {
//   @override
//   _LoadingState createState() => _LoadingState();
// }

// class _LoadingState extends State<Loading> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
//             if (!snapshot.hasData) {
//               print('로그인 정보가 없습니다.');
//               return Sign();
//             } else {
//               print('로그인 정보가 있습니다. 메인화면으로 이동합니다.');
//               return HomeMain();
//             }
//           }),
//     );
//   }
// }
