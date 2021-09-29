//import 'package:damo/screen/Internet_check.dart';
//import 'package:damo/screen/loading.dart';

import 'package:damo/screen/sign/sign.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  KakaoContext.clientId = '146054d09a25beea21919c465959bafe';
  runApp(Damo());
}

class Damo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          duration: 1500,
          splash: 'assets/images/DAMO_logo-03.png',
          nextScreen: Sign(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: Colors.white,
          splashIconSize: 300.0,
        ),
    );
  }
}
