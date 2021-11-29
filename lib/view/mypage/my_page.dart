import 'package:damo/app/controller/user_controller.dart';
import 'package:damo/view/mypage/edit_my_info.dart';
import 'package:damo/view/mypage/purchase_history.dart';
import 'package:damo/view/mypage/setting.dart';
import 'package:damo/view/notification/notice_admin.dart';
import 'package:damo/view/shop/shop_main.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/bar/back_button_clicked.dart';
import 'package:damo/viewmodel/bar/bottom_navigaton.dart';
import 'package:damo/viewmodel/bar/drawer.dart';
import 'package:damo/viewmodel/bar/scroll_behavior.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

UserController userController = Get.find();

class MyPage extends StatefulWidget {
  MyPage({this.bottomNavigationIndex});

  final bottomNavigationIndex;

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  DamoAppBar appBar = DamoAppBar();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: BackButtonClicked().onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: DrawerButton(),
        appBar: appBar.noSearchBar(context),
        bottomNavigationBar: BottomNavigation(
          selectedBottomNavigationBarIndex: 3,
          scrollController: scrollController,
        ),
        body: ScrollConfiguration(
          behavior: NoGlowScrollBehavior(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 1.h,
                  decoration: BoxDecoration(
                    color: Color(0xfff1f3f5),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 25.h),
                    Row(
                      children: [
                        SizedBox(width: 150.w),
                        Obx(
                          () => ExtendedImage.network(
                            userController.getUserInfoModel.value.profileImage!,
                            width: 75.w,
                            height: 75.h,
                            fit: BoxFit.cover,
                            cache: true,
                            // border: Border.all(color: Colors.red, width: 1.0),
                            shape: BoxShape.circle,
                            // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          ),
                        ),
                        SizedBox(width: 110.w),
                        Column(
                          children: [
                            InkWell(
                              child: SvgPicture.asset(
                                'assets/images_svg/ic_my_edit.svg',
                                width: 30.w,
                                height: 30.h,
                              ),
                              onTap: () {
                                Get.to(() => EditMyInfo());
                              },
                            ),
                            SizedBox(height: 54.h),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 11.h),
                    Text(
                      userController.getUserInfoModel.value.nickname!,
                      style: TextStyle(
                        color: Color(0xff283137),
                        fontSize: 16.h,
                        fontFamily: 'NotoSansCJKKR',
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      userController.getUserInfoModel.value.email!,
                      style: TextStyle(
                        color: Color(0xff283137),
                        fontFamily: 'NotoSansCJKKR',
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            // Get.to(() => WishListPage());
                          },
                          child: Container(
                            height: 79.h,
                            width: 164.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xfff1f3f5), width: 1.5.h),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  '7',
                                  style: TextStyle(
                                      color: Color(0xfff93f5b),
                                      fontSize: 20.h,
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w700,
                                      height: 1),
                                ),
                                SizedBox(height: 11.h),
                                Text(
                                  '찜목록',
                                  style: TextStyle(
                                      color: Color(0xff283137),
                                      fontFamily: 'NotoSansCJKKR',
                                      fontSize: 14.h,
                                      height: 1),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => PurchaseHistory());
                          },
                          child: Container(
                            height: 79.h,
                            width: 163.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xfff1f3f5), width: 1.5.h),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  '6',
                                  style: TextStyle(
                                      color: Color(0xfff93f5b),
                                      fontSize: 20.h,
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w700,
                                      height: 1),
                                ),
                                SizedBox(height: 11.h),
                                Text(
                                  '구매내역',
                                  style: TextStyle(
                                      color: Color(0xff283137),
                                      fontFamily: 'NotoSansCJKKR',
                                      fontSize: 14.h,
                                      height: 1),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      height: 1,
                      decoration: BoxDecoration(
                        color: Color(0xfff1f3f5),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
                      child: Column(
                        children: [
                          Container(
                            height: 60.h,
                            child: CupertinoButton(
                              minSize: 0,
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Get.to(() => NotificationAdmin());
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images_svg/ic_my_notice.svg'),
                                      SizedBox(width: 16.w),
                                      Text(
                                        '공지사항',
                                        style: TextStyle(
                                          color: Color(0xff283137),
                                          fontFamily: 'NotoSansCJKKR',
                                        ),
                                      ),
                                    ],
                                  ),
                                  SvgPicture.asset(
                                      'assets/images_svg/ic_바로가기.svg',
                                      width: 20.w,
                                      height: 20.h),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 1.h,
                            decoration: BoxDecoration(
                              color: Color(0xfff1f3f5),
                            ),
                          ),
                          Container(
                            height: 60.h,
                            child: CupertinoButton(
                              minSize: 0,
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images_svg/ic_my_event.svg'),
                                      SizedBox(width: 16.w),
                                      Text(
                                        '이벤트',
                                        style: TextStyle(
                                          color: Color(0xff283137),
                                          fontFamily: 'NotoSansCJKKR',
                                        ),
                                      ),
                                    ],
                                  ),
                                  SvgPicture.asset(
                                      'assets/images_svg/ic_바로가기.svg',
                                      width: 20.w,
                                      height: 20.h),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 1.h,
                            decoration: BoxDecoration(
                              color: Color(0xfff1f3f5),
                            ),
                          ),
                          Container(
                            height: 60.h,
                            child: CupertinoButton(
                              minSize: 0,
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Get.to(() => SettingApp());
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images_svg/ic_my_setting.svg'),
                                      SizedBox(width: 16.w),
                                      Text(
                                        '앱 알림 및 설정',
                                        style: TextStyle(
                                          color: Color(0xff283137),
                                          fontFamily: 'NotoSansCJKKR',
                                        ),
                                      ),
                                    ],
                                  ),
                                  SvgPicture.asset(
                                      'assets/images_svg/ic_바로가기.svg',
                                      width: 20.w,
                                      height: 20.h),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 1.h,
                            decoration: BoxDecoration(
                              color: Color(0xfff1f3f5),
                            ),
                          ),
                          Container(
                            height: 60.h,
                            child: CupertinoButton(
                              minSize: 0,
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images_svg/ic_my_Q&A.svg'),
                                      SizedBox(width: 16.w),
                                      Text(
                                        '자주 묻는 질문',
                                        style: TextStyle(
                                          color: Color(0xff283137),
                                          fontFamily: 'NotoSansCJKKR',
                                        ),
                                      ),
                                    ],
                                  ),
                                  SvgPicture.asset(
                                      'assets/images_svg/ic_바로가기.svg',
                                      width: 20.w,
                                      height: 20.h),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 1.h,
                            decoration: BoxDecoration(
                              color: Color(0xfff1f3f5),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          TextButton(
                            onPressed: () {
                              Get.to(() => ShopMain());
                            },
                            child: Text(
                              '판매자 신청하기',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(0xff8e97a0),
                                fontFamily: 'NotoSansCJKKR',
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
