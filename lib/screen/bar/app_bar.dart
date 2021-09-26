import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:damo/screen/notification/notification_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transition/transition.dart';
import '../search/seach_product.dart';

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
            size: 25.0,
            color: Colors.redAccent,
          ),
          onPressed: () {},
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(
            Icons.notifications_none,
            size: 25.0,
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
        color: Colors.red,
      ),
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
            size: 25.0,
            color: Colors.redAccent,
          ),
          onPressed: () {
            Get.to(SearchPage());
          },
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(
            Icons.notifications_none,
            size: 25.0,
            color: Colors.redAccent,
          ),
          onPressed: () {},
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(
            Icons.near_me_outlined,
            size: 25.0,
            color: Colors.redAccent,
          ),
          onPressed: () {
            showAdaptiveActionSheet(
              context: context,
              title: const Text('상품보기'),
              actions: <BottomSheetAction>[
                BottomSheetAction(
                    title: const Text('거리순'),
                    onPressed: () {
                      Get.back();
                    }),
                BottomSheetAction(
                    title: const Text('인기순'),
                    onPressed: () {
                      Get.back();
                    }),
                BottomSheetAction(
                    title: const Text('추천순'),
                    onPressed: () {
                      Get.back();
                    }),
                BottomSheetAction(
                    title: const Text('지역순'),
                    onPressed: () {
                      Get.back();
                      showAdaptiveActionSheet(
                        context: context,
                        title: const Text('지역선택'),
                        actions: <BottomSheetAction>[
                          BottomSheetAction(
                              title: const Text('서울특별시'),
                              onPressed: () {
                                Get.back();
                              }),
                          BottomSheetAction(
                              title: const Text('경기도'),
                              onPressed: () {
                                Get.back();
                              }),
                          BottomSheetAction(
                              title: const Text('경상남도'),
                              onPressed: () {
                                Get.back();
                              }),
                          BottomSheetAction(
                              title: const Text('부산광역시'), onPressed: () {}),
                        ],
                        cancelAction: CancelAction(
                            title: const Text(
                                '닫기')), // onPressed parameter is optional by default will dismiss the ActionSheet
                      );
                    }),
              ],
              cancelAction: CancelAction(
                  title: const Text(
                      '닫기')), // onPressed parameter is optional by default will dismiss the ActionSheet
            );
          },
        ),
      ],
    );
  }

  dynamic noSearchBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.red,
      ),
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
            Icons.notifications_none,
            size: 25.0,
            color: Colors.redAccent,
          ),
          onPressed: () {},
        ),
        SizedBox(width: 10.0),
      ],
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
