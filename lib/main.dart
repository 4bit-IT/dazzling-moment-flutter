import 'package:damo/view/sign/sign.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  KakaoContext.clientId = '051ba7adea57eb74c808616d4969e482';
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Damo());
}

class Damo extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
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
      },
    );
  }
}
