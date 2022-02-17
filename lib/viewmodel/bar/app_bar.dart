import 'package:damo/view/notification/notice_user.dart';
import 'package:damo/view/search/seach_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class DamoAppBar {
  dynamic appBar(BuildContext context) {
    return AppBar(
      shape: Border(bottom: BorderSide(color: Color(0xfff1f3f5), width: 1.h)),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.grey[700],
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: SvgPicture.asset('assets/images_svg/logo_main.svg'),
      actions: [
        Row(
          children: [
            InkWell(
                onTap: () {
                  Get.to(() => SearchPage());
                },
                child: SvgPicture.asset('assets/images_svg/ic_search.svg',
                    width: 30.w, height: 30.h)),
            SizedBox(width: 10.w),
            InkWell(
                onTap: () {
                  Get.to(() => NotificationUser());
                },
                child: SvgPicture.asset('assets/images_svg/ic_notification.svg',
                    width: 30.w, height: 30.h)),
            SizedBox(width: 10.w),
          ],
        ),
      ],
    );
  }

  dynamic noSearchBar(BuildContext context) {
    return AppBar(
      shape: Border(bottom: BorderSide(color: Color(0xfff1f3f5), width: 1.h)),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.grey[700],
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: SvgPicture.asset('assets/images_svg/logo_main.svg'),
      actions: [
        Row(
          children: [
            SizedBox(width: 10.w),
            InkWell(
                onTap: () {
                  Get.to(() => NotificationUser());
                },
                child: SvgPicture.asset('assets/images_svg/ic_notification.svg',
                    width: 30.w, height: 30.h)),
            SizedBox(width: 10.w),
          ],
        ),
      ],
    );
  }

  dynamic textAppBar(BuildContext context, String text) {
    return AppBar(
      shape: Border(bottom: BorderSide(color: Color(0xfff1f3f5), width: 1.h)),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Text(
        text,
        style: TextStyle(
          color: Color(0xff283137),
          fontSize: 21.3.sp,
          fontFamily: 'NotoSansCJKKR',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  dynamic suffixAppBar(BuildContext context, String text, String suffixText, void func()) {
    return AppBar(
      shape: Border(bottom: BorderSide(color: Color(0xfff1f3f5), width: 1.h)),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Text(
        text,
        style: TextStyle(
          color: Color(0xff283137),
          fontSize: 21.3.sp,
          fontFamily: 'NotoSansCJKKR',
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            func();
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
            child: Center(
              child: Text(
                suffixText,
                style: TextStyle(
                  color: Color(0xff8e97a0),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  dynamic shopAppBar(BuildContext context) {
    return AppBar(
      shape: Border(bottom: BorderSide(color: Color(0xfff1f3f5), width: 1.h)),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.red,
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Image.asset(
        'assets/images/DAMO_logo-02.png',
        width: 130.0,
      ),
    );
  }
}
