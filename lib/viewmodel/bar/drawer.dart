import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:damo/app/controller/sign_controller.dart';
import 'package:damo/app/controller/user_controller.dart';
import 'package:damo/app/data/model/token_model.dart';
import 'package:damo/view/mypage/edit_my_info.dart';
import 'package:damo/view/mypage/setting.dart';
import 'package:damo/view/notification/notice_admin.dart';
import 'package:damo/viewmodel/bar/scroll_behavior.dart';
import 'package:damo/view/sign/sign.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/route_manager.dart';
import 'package:page_transition/page_transition.dart';

import '../image_model.dart';

UserController userController = Get.find();
SignController signController = Get.find();

class DrawerButton extends StatefulWidget {
  @override
  _DrawerButtonState createState() => _DrawerButtonState();
}

class _DrawerButtonState extends State<DrawerButton> {
  Future<dynamic> onLogout() {
    return showDialog(
        barrierDismissible: false, //여백눌려도 안닫힘.
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)), //테두리 둥글기
              title: Text("로그아웃 하시겠습니까?"),
              actions: [
                TextButton(
                  child: Text(
                    "예",
                    style: TextStyle(
                        fontFamily: 'NotoSans', color: Colors.red[400]),
                  ),
                  onPressed: () {
                    print('로그아웃 합니다.');
                    TokenModel().removeToken();
                    Get.offAll(
                      () => AnimatedSplashScreen(
                        duration: 500,
                        splash: SvgPicture.asset('assets/images_svg/스플래시.svg',fit: BoxFit.fill,),
                        nextScreen: Sign(),
                        splashTransition: SplashTransition.fadeTransition,
                        pageTransitionType: PageTransitionType.fade,
                        backgroundColor: Colors.white,
                        splashIconSize: 300.0,
                      ),
                    );
                  },
                ),
                TextButton(
                    child: Text(
                      "아니오",
                      style: TextStyle(
                          fontFamily: 'NotoSans', color: Colors.red[400]),
                    ),
                    onPressed: () {
                      Get.back();
                    }),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowScrollBehavior(),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.fromLTRB(16.w, 65.h, 16.w, 0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: Obx(() => ImageModel().networkImage(
                        userController.getUserInfoModel.value.profileImage!))),
                SizedBox(
                  width: 113.w,
                ),
                InkWell(
                    onTap: () {
                      Get.to(() => EditMyInfo());
                    },
                    child:
                        SvgPicture.asset('assets/images_svg/ic_my_edit.svg')),
              ],
            ),
            SizedBox(height: 16.h),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '어서오세요.\n'),
                  TextSpan(
                      text: userController.getUserInfoModel.value.nickname),
                  TextSpan(text: '님'),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              userController.getUserInfoModel.value.email!,
              style: TextStyle(
                color: Color(0xff283137),
                fontSize: 12,
                fontFamily: 'NotoSansCJKKR',
              ),
            ),
            SizedBox(height: 31.h),
            Divider(
              height: 0,
            ),
            InkWell(
              onTap: () {
                Get.to(() => NotificationAdmin());
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 15.h, 0, 15.h),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/images_svg/ic_my_notice.svg',
                        width: 30.w, height: 30.h),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      '공지사항',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xff283137),
                        fontFamily: 'NotoSansCJKKR',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 0,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 15.h, 0, 15.h),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/images_svg/ic_my_event.svg',
                        width: 30.w, height: 30.h),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      '이벤트',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xff283137),
                        fontFamily: 'NotoSansCJKKR',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 0,
            ),
            InkWell(
              onTap: () {
                Get.to(() => SettingApp());
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 15.h, 0, 15.h),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/images_svg/ic_my_setting.svg',
                        width: 30.w, height: 30.h),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      '앱 알림 및 설정',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xff283137),
                        fontFamily: 'NotoSansCJKKR',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 0,
            ),
            SizedBox(
              height: 23.h,
            ),
            InkWell(
              child: Text(
                '로그아웃 ',
                style: TextStyle(
                  color: Color(0xff8e97a0),
                  fontFamily: 'NotoSansCJKKR',
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: onLogout,
            ),
          ],
        ),
      ),
    );
  }
}
