import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:damo/view/notification/notification_main.dart';
import 'package:damo/view/search/seach_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class DamoAppBar {
  dynamic tabBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.red,
      ),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Image.asset(
        'assets/images/DAMO_logo-02.png',
        width: 115.0,
      ),
      actions: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(
            Icons.search,
            color: Colors.redAccent,
          ),
          onPressed: () {},
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(
            Icons.notifications_none,
            color: Colors.redAccent,
          ),
          onPressed: () {
            Get.to(NotificationMain());
          },
        ),
        SizedBox(width: 10.0),
      ],
      bottom: TabBar(
        labelStyle: GoogleFonts.lato(color: Colors.black38, fontSize: 15.0),
        unselectedLabelStyle: TextStyle(fontSize: 15.0),
        labelColor: Colors.red,
        unselectedLabelColor: Colors.black,
        indicatorColor: Colors.white,
        isScrollable: false,
        tabs: [
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('핸드메이드 케이크'),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.cake_outlined),
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('꽃'),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.yard_outlined)
              ],
            ),
          ),
        ],
      ),
    );
  }

  dynamic appBar(BuildContext context) {
    return AppBar(
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
                onTap: () {},
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
                onTap: () {},
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
          fontSize: 16,
          fontFamily: 'NotoSansCJKKR',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  dynamic sellerAppBar(BuildContext context) {
    return AppBar(
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
