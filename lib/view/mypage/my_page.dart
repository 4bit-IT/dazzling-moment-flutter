import 'package:damo/app/controller/owner/owner_shop_controller.dart';
import 'package:damo/app/controller/user_controller.dart';
import 'package:damo/view/mypage/edit_my_info.dart';
import 'package:damo/view/mypage/purchase_history.dart';
import 'package:damo/view/mypage/setting.dart';
import 'package:damo/view/mypage/updateAppleInfo/updateAppleInfoNickname.dart';
import 'package:damo/view/mypage/updateAppleInfo/updateAppleInfoPhoneNumber.dart';
import 'package:damo/view/mypage/wish_list_page.dart';
import 'package:damo/view/notification/notice_admin.dart';
import 'package:damo/view/shop/shop_main.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/bar/back_button_clicked.dart';
import 'package:damo/viewmodel/bar/bottom_navigaton.dart';
import 'package:damo/viewmodel/bar/drawer.dart';
import 'package:damo/viewmodel/bar/scroll_behavior.dart';
import 'package:damo/viewmodel/image_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share_plus/share_plus.dart';

import '../../viewmodel/get_dialog.dart';

class MyPage extends StatefulWidget {
  MyPage({this.bottomNavigationIndex});

  final bottomNavigationIndex;

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  UserController userController = Get.find();
  OwnerShopController? ownerShopController;
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  DamoAppBar appBar = DamoAppBar();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: BackButtonClicked().onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: DrawerButton(),
        appBar: appBar.textAppBar(context, '내 정보'),
        bottomNavigationBar: BottomNavigation(
          selectedBottomNavigationBarIndex: 3,
          scrollController: scrollController,
        ),
        body: ScrollConfiguration(
          behavior: NoGlowScrollBehavior(),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
                  child: Column(
                    children: [
                      SizedBox(height: 25.h),
                      Stack(
                        children: [
                          Obx(() => Center(
                                child: ImageModel().networkImage(userController
                                    .getUserInfoModel.value.profileImage!),
                              )),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: InkWell(
                              child: SvgPicture.asset(
                                'assets/images_svg/ic_my_edit.svg',
                                width: 30.w,
                                height: 30.h,
                              ),
                              onTap: () async {
                                if (userController
                                        .isAdditionalInformatinApple() ==
                                    false) {
                                  GetDialog().onAdditionalInformationApple();
                                } else
                                  Get.to(() => EditMyInfo());
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 11.h),
                      Text(userController.getUserInfoModel.value.nickname!),
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
                              Get.to(() => WishListPage());
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 164.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xfff1f3f5), width: 1.5.h),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Wrap(
                                direction: Axis.vertical,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    '7',
                                    style: TextStyle(
                                        color: Color(0xfff93f5b),
                                        fontSize: 20.sp,
                                        fontFamily: 'NotoSansCJKKR',
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 11.h),
                                  Text(
                                    '찜 목록',
                                    style: TextStyle(
                                        color: Color(0xff283137),
                                        fontFamily: 'NotoSansCJKKR',
                                        fontSize: 14.sp),
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
                              alignment: Alignment.center,
                              width: 163.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xfff1f3f5), width: 1.5.h),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Wrap(
                                direction: Axis.vertical,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    '6',
                                    style: TextStyle(
                                        color: Color(0xfff93f5b),
                                        fontSize: 20.sp,
                                        fontFamily: 'NotoSansCJKKR',
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 11.h),
                                  Text(
                                    '구매내역',
                                    style: TextStyle(
                                        color: Color(0xff283137),
                                        fontFamily: 'NotoSansCJKKR',
                                        fontSize: 14.sp),
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
                      Divider(height: 0),
                      Column(
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
                          Divider(height: 0),
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
                          Divider(height: 0),
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
                          Divider(height: 0),
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
                            height: 60.h,
                            child: CupertinoButton(
                              minSize: 0,
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Get.to(
                                  () => UpdateAppleInfoNickname(),
                                );
                              },
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
                                        '테스트 입니다.',
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
                          Divider(height: 0),
                          Container(
                            height: 60.h,
                            child: CupertinoButton(
                              minSize: 0,
                              padding: EdgeInsets.zero,
                              onPressed: () async {
                                /// Dynamic Links 에서 만든 URL Prefix
                                String url = "https://damoforyou.page.link";

                                /// Dynamic Links 소스를 이용해 만들기
                                final DynamicLinkParameters parameters =
                                    DynamicLinkParameters(
                                  uriPrefix: url,

                                  /// 딥링크 사용을 위한 특정 게시판-게시글ID 구성
                                  link: Uri.parse('$url/main'),

                                  /// 안드로이드의 경우 packageName 추가
                                  androidParameters: AndroidParameters(
                                    packageName: "com.damoforyou.damo",
                                  ),

                                  /// iOS의 경우 bundleId 추가 (appStoreId와 TeamID가 필요)
                                  iosParameters: const IOSParameters(
                                    bundleId: "com.damoforyou.damo",
                                    minimumVersion: '2',
                                  ),
                                );
                                final ShortDynamicLink dynamicUrl =
                                    await FirebaseDynamicLinks.instance
                                        .buildShortLink(parameters);
                                var uri = dynamicUrl.shortUrl;
                                print(uri);
                                await Share.share('$uri');
                              },
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
                                        '공유하기(테스트)',
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
                          Divider(height: 0),
                          SizedBox(height: 24.h),
                          TextButton(
                            onPressed: () async {
                              Get.to(() => ShopMain(),
                                  binding: OwnerShopBinding());
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
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
