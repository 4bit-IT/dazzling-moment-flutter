import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/view/main/home_main.dart';
import 'package:damo/view/mypage/my_page.dart';
import 'package:damo/view/sign/sign.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

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

class Damo extends StatelessWidget with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onInit: () async {
        print('mainInit');
        WidgetsBinding.instance!.addObserver(this);
        final PendingDynamicLinkData? data =
            await FirebaseDynamicLinks.instance.getInitialLink();

        // 딥링크가 있는 경우 체크 (딥링크는 단순히 앱만 실행하는 것이 아닌 특정 게시물로의 이동이 필요한 경우 사용)
        final Uri? deepLink = data?.link;
        //print(deepLink!.path);
        if (deepLink != null) {

          //딥링크가 있는 경우 URL을 분석해서 어느 게시물로 이동할지 알아내야 함
          if (tokenController.initialized == false) {
            await tokenController.fetchData();
          }
          print('딥링크 있음');
          Get.to(MyPage());
        } else {
          print('딥링크 없음');
        }
        FirebaseDynamicLinks.instance.onLink.listen((event) {
          Get.to(() => MyPage());
        }).onError((error) {
          print('error');
        });
      },
      onDispose: () {
        WidgetsBinding.instance!.removeObserver(this);
      },
      debugShowCheckedModeBanner: false,
      home: ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () {
          return tokenController.isAutoLogin.value == true
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
