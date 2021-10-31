import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/bar/bottom_navigaton.dart';
import 'package:damo/viewmodel/bar/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  ScrollController scrollController = ScrollController();
  DamoAppBar appBar = DamoAppBar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar.appBar(context),
      drawer: DrawerButton(),
      bottomNavigationBar: BottomNavigation(
        selectedBottomNavigationBarIndex: 0,
        scrollController: scrollController,
      ),
      body: Column(
        children: [
          SvgPicture.asset('assets/images_svg/img_main_banner.svg',
              width: 375.w, height: 100.h),
          SizedBox(height: 12.h),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Container(
              // 컨테이너의 높이를 200으로 설정
              height: 76.h,
              // 리스트뷰 추가
              child: ListView(
                // 스크롤 방향 설정. 수평적으로 스크롤되도록 설정
                scrollDirection: Axis.horizontal,

                // 컨테이너들을 ListView의 자식들로 추가
                children: [
                  InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        SvgPicture.asset(
                            'assets/images_svg/ic_category_all_off.svg',
                            width: 50.w,
                            height: 50.h),
                        SizedBox(height: 7.h),
                        Text(
                          '전체',
                          style: TextStyle(
                            color: Color(0xff283137),
                            fontSize: 10,
                            fontFamily: 'NotoSansCJKKR',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 7.w),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                            'assets/images_svg/ic_category_cake_off.svg',
                            width: 50.w,
                            height: 50.h),
                      ),
                      SizedBox(height: 7.h),
                      Text(
                        '케이크',
                        style: TextStyle(
                          color: Color(0xff283137),
                          fontSize: 10,
                          fontFamily: 'NotoSansCJKKR',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 7.w),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                            'assets/images_svg/ic_category_flower_off.svg',
                            width: 50.w,
                            height: 50.h),
                      ),
                      SizedBox(height: 7.h),
                      Text(
                        '꽃',
                        style: TextStyle(
                          color: Color(0xff283137),
                          fontSize: 10,
                          fontFamily: 'NotoSansCJKKR',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 7.w),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                            'assets/images_svg/ic_category_dessert_off.svg',
                            width: 50.w,
                            height: 50.h),
                      ),
                      SizedBox(height: 7.h),
                      Text(
                        '디저트',
                        style: TextStyle(
                          color: Color(0xff283137),
                          fontSize: 10,
                          fontFamily: 'NotoSansCJKKR',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 7.w),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                            'assets/images_svg/ic_category_wine_off.svg',
                            width: 50.w,
                            height: 50.h),
                      ),
                      SizedBox(height: 7.h),
                      Text(
                        '와인',
                        style: TextStyle(
                          color: Color(0xff283137),
                          fontSize: 10,
                          fontFamily: 'NotoSansCJKKR',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 7.w),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                            'assets/images_svg/ic_category_giftcard_off.svg',
                            width: 50.w,
                            height: 50.h),
                      ),
                      SizedBox(height: 7.h),
                      Text(
                        '선물카드',
                        style: TextStyle(
                          color: Color(0xff283137),
                          fontSize: 10,
                          fontFamily: 'NotoSansCJKKR',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 7.w),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                            'assets/images_svg/ic_category_giftbox_off.svg',
                            width: 50.w,
                            height: 50.h),
                      ),
                      SizedBox(height: 7.h),
                      Text(
                        '선물상자',
                        style: TextStyle(
                          color: Color(0xff283137),
                          fontSize: 10,
                          fontFamily: 'NotoSansCJKKR',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            height: 1,
            decoration: BoxDecoration(
              color: Color(0xfff1f3f5),
            ),
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
