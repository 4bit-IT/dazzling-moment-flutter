import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/bar/bottom_navigaton.dart';
import 'package:damo/viewmodel/bar/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  TokenController tokenController = Get.put(TokenController());
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
      body: SingleChildScrollView(
        child: Column(
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
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 26.h,
                          width: 52.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xfff93f5b), width: 1.h),
                            borderRadius: BorderRadius.circular(13.r),
                          ),
                          child: Column(
                            children: [
                              Text(
                                '주문순',
                                style: TextStyle(
                                  color: Color(0xfff93f5b),
                                  fontSize: 12,
                                  fontFamily: 'NotoSansCJKKR',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 26.h,
                          width: 52.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xfff1f3f5), width: 1.h),
                            color: Color(0xfff1f3f5),
                            borderRadius: BorderRadius.circular(13.r),
                          ),
                          child: Column(
                            children: [
                              Text(
                                '별점순',
                                style: TextStyle(
                                  color: Color(0xff283137),
                                  fontSize: 12,
                                  fontFamily: 'NotoSansCJKKR',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 26.h,
                          width: 74.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xfff1f3f5), width: 1.h),
                            color: Color(0xfff1f3f5),
                            borderRadius: BorderRadius.circular(13.r),
                          ),
                          child: Column(
                            children: [
                              Text(
                                '리뷰많은순',
                                style: TextStyle(
                                  color: Color(0xff283137),
                                  fontSize: 12,
                                  fontFamily: 'NotoSansCJKKR',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/images_svg/ic_filter.svg',
                      width: 30.w,
                      height: 30.h,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            GridView.builder(
              itemCount: 100,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 294.h,
                crossAxisCount: 2,
                crossAxisSpacing: 5.w,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Stack(
                      children: [
                        Image.asset(
                          'assets/images/img.png',
                          fit: BoxFit.fill,
                          width: 185.w,
                          height: 185.h,
                        ),
                        Positioned(
                          left: 10.w,
                          bottom: 10.h,
                          child: SvgPicture.asset(
                            'assets/images_svg/ic_new.svg',
                            width: 38.w,
                            height: 20.h,
                          ),
                        ),
                        Positioned(
                          right: 5.w,
                          bottom: 5.h,
                          child: SvgPicture.asset(
                            'assets/images_svg/ic_wish_on.svg',
                            width: 30.w,
                            height: 30.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '이로아케이크',
                            style: TextStyle(
                              color: Color(0xff283137),
                              fontSize: 10.sp,
                              height: 1,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          Text(
                            '플루트 딸기가득 케이크',
                            style: TextStyle(
                              color: Color(0xff283137),
                              fontSize: 13.sp,
                              height: 1,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text(
                            '서울에서 입소문난 수제디저트 공방...',
                            style: TextStyle(
                              color: Color(0xff283137),
                              fontSize: 11.sp,
                              height: 1,
                              fontFamily: 'NotoSansCJKKR',
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images_svg/ic_review_10.svg',
                                    width: 10.w,
                                    height: 10.h,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Text(
                                    '4.9',
                                    style: TextStyle(
                                      color: Color(0xff283137),
                                      fontSize: 12.sp,
                                      height: 1,
                                      fontFamily: 'NotoSansCJKKR',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    '(1,234)',
                                    style: TextStyle(
                                      color: Color(0xff8e97a0),
                                      fontSize: 12.sp,
                                      height: 1,
                                      fontFamily: 'NotoSansCJKKR',
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '29,500',
                                style: TextStyle(
                                    color: Color(0xff283137),
                                    fontFamily: 'NotoSansCJKKR',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp,
                                    height: 1),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
