import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/view/main/home_main.dart';
import 'package:damo/view/sign/sign.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

import 'app/data/model/token_model.dart';

late Widget nextScreen;
TokenController tokenController = Get.put(TokenController(), permanent: true);

Future<void> main() async {
  KakaoContext.clientId = '051ba7adea57eb74c808616d4969e482';
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance
      .activate(webRecaptchaSiteKey: 'recaptcha-v3-site-key');
  await tokenController.fetchData();
  runApp(Damo());

}

class Damo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(6);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () {
          print(tokenController.isAutoLogin!.value);
          return tokenController.isAutoLogin!.value == true
              ? HomeMain()
              : Sign();
        },
      ),
    );
    /*ScreenUtilInit(
      designSize: size,
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // home: AnimatedSplashScreen(
        //   duration: 1500,
        //   splash: 'assets/images/DAMO_logo-03.png',
        //   nextScreen: Sign(),
        //   splashTransition: SplashTransition.fadeTransition,
        //   pageTransitionType: PageTransitionType.fade,
        //   backgroundColor: Colors.white,
        //   splashIconSize: 300.0,
        // ),
        home: nextScreen,
      ),
    );*/
  }
}
