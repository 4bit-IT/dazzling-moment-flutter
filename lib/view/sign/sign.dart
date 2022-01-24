import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:damo/app/controller/sign_controller.dart';
import 'package:damo/view/sign/get_user_number.dart';
import 'package:damo/view/sign/get_user_name.dart';
import 'package:damo/viewmodel/bar/scroll_behavior.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Sign extends StatelessWidget {
  SignController signController = Get.put(SignController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    print(3);
    signController.initialized
        ? signController = Get.find()
        : Get.lazyPut(() => SignController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoGlowScrollBehavior(),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 278.h),
                  SvgPicture.asset('assets/images_svg/logo_login.svg',
                      width: 85.w, height: 98.3.h),
                  SizedBox(height: 214.h),
                  Row(
                    children: [
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Divider(
                          color: Color(0xfff1f3f5),
                          thickness: 1.h,
                        ),
                      ),
                      SizedBox(width: 9.w),
                      Text(
                        '간편 로그인',
                        style: TextStyle(
                          color: Color(0xff8e8e93),
                          fontSize: 18.sp,
                          fontFamily: 'NotoSansCJKKR',
                          height: 1,
                        ),
                      ),
                      SizedBox(width: 9.w),
                      Expanded(
                        child: Divider(
                          color: Color(0xfff1f3f5),
                          thickness: 1.h,
                        ),
                      ),
                      SizedBox(width: 16.w),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    children: [
                      SizedBox(width: 94.w),
                      Container(
                        width: 93.w,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => GetUserNumber());
                              },
                              child: SvgPicture.asset(
                                'assets/images_svg/ic_login_apple.svg',
                                width: 44.w,
                                height: 44.h,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              '애플',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontFamily: 'NotoSansCJKKR',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 93.w,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                signController.onKakaoLoginClicked();
                              },
                              child: SvgPicture.asset(
                                'assets/images_svg/ic_login_kakao.svg',
                                width: 44.w,
                                height: 44.h,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              '카카오',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontFamily: 'NotoSansCJKKR',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 95.w),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 200),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Get.to(() => GetUserNickname());
                        },
                        color: Colors.blue,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "페이스북으로 로그인",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 7),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Get.to(() => GetUserNumber());
                        },
                        color: Colors.green,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "네이버로 로그인",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 7),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Get.to(
                            () => AnimatedSplashScreen(
                              duration: 1000,
                              splash: Image.asset(
                                'assets/images/스플래시@3x.png',
                                width: 375.w,
                                fit: BoxFit.fill,
                              ),
                              nextScreen: Sign(),
                              splashTransition: SplashTransition.fadeTransition,
                              backgroundColor: Colors.white,
                              splashIconSize: 812.h,
                            ),
                          );
                        },
                        color: Colors.grey[400],
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "애플 로그인",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
