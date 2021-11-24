import 'package:card_swiper/card_swiper.dart';
import 'package:damo/app/controller/product_controller.dart';
import 'package:damo/view/product/product_info.dart';
import 'package:damo/view/product/product_qa.dart';
import 'package:damo/view/product/product_review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simple_star_rating/simple_star_rating.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class Product extends StatelessWidget {
  ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                pinned: true,
                leading: CupertinoButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(
                    'assets/images_svg/ic_back_white_30.svg',
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
                actions: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                              'assets/images_svg/ic_share_white_30.svg',
                              width: 30.w,
                              height: 30.h)),
                      SizedBox(width: 10.w),
                      InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                              'assets/images_svg/ic_wish_on.svg',
                              width: 30.w,
                              height: 30.h)),
                      SizedBox(width: 10.w),
                    ],
                  ),
                ],
                expandedHeight: 375.h,
                flexibleSpace: FlexibleSpaceBar(
                  background: Obx(
                    () => Swiper.children(
                      autoplay: false,
                      pagination: SwiperPagination(
                          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 17.h),
                          builder: DotSwiperPaginationBuilder(
                              color: Colors.grey,
                              activeColor: Colors.white,
                              size: 7.0,
                              activeSize: 7.0)),
                      children: productController
                          .images[productController.index.value],
                    ),
                  ),
                ),
              ),
              /*SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(17.0.w, 15.h, 10.w, 0),
                  child: Text(
                    '이로아케이크',
                    style: TextStyle(
                      color: Color(0xfff93f5b),
                      fontSize: 12.sp,
                      height: 1,
                      fontFamily: 'NotoSansCJKKR',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),*/
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(17.0.w, 9.h, 10.w, 0),
                  child: Text(
                    '${productController.title[productController.index.value]}',
                    //'${productController.title[productController.index.value]}',
                    style: TextStyle(
                      color: Color(0xff283137),
                      fontSize: 20,
                      fontFamily: 'NotoSansCJKKR',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(17.0.w, 10.h, 15.w, 20.h),
                  child: Text(
                    '${productController.description[productController.index.value]}',
                    style: TextStyle(
                      color: Color(0xff283137),
                      fontFamily: 'NotoSansCJKKR',
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(17.0.w, 4.h, 10.w, 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SimpleStarRating(
                            allowHalfRating: true,
                            starCount: 5,
                            rating: productController.rating[productController.index.value],
                            size: 10.w,
                            isReadOnly: true,
                            spacing: 2.5.w,
                          ),
                          SizedBox(width: 5.0.w),
                          Text(
                            '${productController.rating[productController.index.value]}',
                            style: TextStyle(
                              color: Color(0xff283137),
                              fontFamily: 'NotoSansCJKKR',
                            ),
                          ),
                          SizedBox(width: 2.0.w),
                          Text(
                            '(${productController.reviewCount[productController.index.value]})',
                            style: TextStyle(
                              color: Color(0xff8e97a0),
                              fontFamily: 'NotoSansCJKKR',
                            ),
                          ),
                          SizedBox(width: 110.w),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '30%',
                            style: TextStyle(
                              color: Color(0xfff93f5b),
                              fontSize: 16.sp,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            '${productController.price[productController.index.value]} 원',
                            style: TextStyle(
                              color: Color(0xff283137),
                              fontSize: 20.sp,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 3.0, color: Colors.black),
                    ),
                    tabs: [
                      Tab(
                        child: Text(
                          '상품정보',
                          style: TextStyle(
                            color: Color(0xff283137),
                            fontFamily: 'NotoSansCJKKR',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Review',
                          style: TextStyle(
                            color: Color(0xff283137),
                            fontFamily: 'NotoSansCJKKR',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'FAQ',
                          style: TextStyle(
                            color: Color(0xff283137),
                            fontFamily: 'NotoSansCJKKR',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pinned: false,
              ),
            ];
          },
          body: TabBarView(
            children: [
              ProductInfo(),
              ProductReview(),
              ProductQnA(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          productController.init();
          Get.bottomSheet(
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 300.h,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50.h,
                          width: 375.w,
                          padding: EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 8.h),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                          ),
                          child: Text(
                            '1. 디자인',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.black26,
                          height: 0,
                        ),
                        InkWell(
                          onTap: () {
                            productController.onFirstClicked(0, 0);
                          },
                          child: Row(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 16.h),
                                color: Colors.white,
                                child: Text(
                                  '로즈쿼츠 (지름 10cm) (+3,000원)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: 'NotoSansCJKKR',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Obx(
                                () => Visibility(
                                  visible: productController.optionCheck[0][0],
                                  child: Icon(CupertinoIcons.check_mark),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black26,
                          height: 0,
                        ),
                        InkWell(
                          onTap: () {
                            productController.onFirstClicked(0, 1);
                          },
                          child: Row(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 16.h),
                                color: Colors.white,
                                child: Text(
                                  '코튼캔디 (지름 10cm) (+3,000원)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: 'NotoSansCJKKR',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Obx(
                                () => Visibility(
                                  visible: productController.optionCheck[0][1],
                                  child: Icon(CupertinoIcons.check_mark),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black26,
                          height: 0,
                        ),
                        InkWell(
                          onTap: () {
                            productController.onFirstClicked(0, 2);
                          },
                          child: Row(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 16.h),
                                color: Colors.white,
                                child: Text(
                                  '레드하트 (지름 10cm) (+3,000원)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: 'NotoSansCJKKR',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Obx(
                                () => Visibility(
                                  visible: productController.optionCheck[0][2],
                                  child: Icon(CupertinoIcons.check_mark),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black26,
                          height: 0,
                        ),
                        InkWell(
                          onTap: () {
                            productController.onFirstClicked(0, 3);
                          },
                          child: Row(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 16.h),
                                color: Colors.white,
                                child: Text(
                                  '플라워무드 (지름 10cm) (+3,000원)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: 'NotoSansCJKKR',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Obx(
                                () => Visibility(
                                  visible: productController.optionCheck[0][3],
                                  child: Icon(CupertinoIcons.check_mark),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black26,
                          height: 0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50.h,
                          width: 375.w,
                          padding: EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 8.h),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                          ),
                          child: Text(
                            '2. 케이크 맛',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.black26,
                          height: 0,
                        ),
                        InkWell(
                          onTap: () {
                            productController.onFirstClicked(1, 0);
                          },
                          child: Row(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 16.h),
                                color: Colors.white,
                                child: Text(
                                  '바닐라시트(쌀) + 순우유크림 + 블루베리잼',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: 'NotoSansCJKKR',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Obx(
                                () => Visibility(
                                  visible: productController.optionCheck[1][0],
                                  child: Icon(CupertinoIcons.check_mark),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black26,
                          height: 0,
                        ),
                        InkWell(
                          onTap: () {
                            productController.onFirstClicked(1, 1);
                          },
                          child: Row(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 16.h),
                                color: Colors.white,
                                child: Text(
                                  '초코시트(쌀) + 순우유크림 + 딸기잼(+1,000원)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: 'NotoSansCJKKR',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Obx(
                                () => Visibility(
                                  visible: productController.optionCheck[1][1],
                                  child: Icon(CupertinoIcons.check_mark),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black26,
                          height: 0,
                        ),
                        InkWell(
                          onTap: () {
                            productController.onFirstClicked(1, 2);
                          },
                          child: Row(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 16.h),
                                color: Colors.white,
                                child: Text(
                                  '초코시트(쌀) + 말차크림 + 초코칩(+1,500원)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: 'NotoSansCJKKR',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Obx(
                                () => Visibility(
                                  visible: productController.optionCheck[1][2],
                                  child: Icon(CupertinoIcons.check_mark),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black26,
                          height: 0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50.h,
                          width: 375.w,
                          padding: EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 8.h),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                          ),
                          child: Text(
                            '3. 디자인초',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.black26,
                          height: 0,
                        ),
                        InkWell(
                          onTap: () {
                            productController.onFirstClicked(2, 0);
                          },
                          child: Row(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 16.h),
                                color: Colors.white,
                                child: Text(
                                  '골드기본초(1개)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: 'NotoSansCJKKR',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Obx(
                                () => Visibility(
                                  visible: productController.optionCheck[2][0],
                                  child: Icon(CupertinoIcons.check_mark),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black26,
                          height: 0,
                        ),
                        InkWell(
                          onTap: () {
                            productController.onFirstClicked(2, 1);
                          },
                          child: Row(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 16.h),
                                color: Colors.white,
                                child: Text(
                                  '실버기본초(1개)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: 'NotoSansCJKKR',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Obx(
                                () => Visibility(
                                  visible: productController.optionCheck[2][1],
                                  child: Icon(CupertinoIcons.check_mark),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black26,
                          height: 0,
                        ),
                        InkWell(
                          onTap: () {
                            productController.onFirstClicked(2, 2);
                          },
                          child: Row(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 16.h),
                                color: Colors.white,
                                child: Text(
                                  '하트초(레드)(+1,400원)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: 'NotoSansCJKKR',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Obx(
                                () => Visibility(
                                  visible: productController.optionCheck[2][2],
                                  child: Icon(CupertinoIcons.check_mark),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black26,
                          height: 0,
                        ),
                        InkWell(
                          onTap: () {
                            productController.onFirstClicked(2, 3);
                          },
                          child: Row(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 16.h),
                                color: Colors.white,
                                child: Text(
                                  '하트초(진핑크.사진X)(+1,400원)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: 'NotoSansCJKKR',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Obx(
                                () => Visibility(
                                  visible: productController.optionCheck[2][3],
                                  child: Icon(CupertinoIcons.check_mark),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black26,
                          height: 0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50.h,
                          width: 375.w,
                          padding: EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 8.h),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                          ),
                          child: Text(
                            '4. 선물포장용품',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.black26,
                          height: 0,
                        ),
                        InkWell(
                          onTap: () {
                            productController.onFirstClicked(3, 0);
                          },
                          child: Row(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 16.h),
                                color: Colors.white,
                                child: Text(
                                  '마끈리본+손잡이비닐(+1,000원)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: 'NotoSansCJKKR',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Obx(
                                () => Visibility(
                                  visible: productController.optionCheck[3][0],
                                  child: Icon(CupertinoIcons.check_mark),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black26,
                          height: 0,
                        ),
                        InkWell(
                          onTap: () {
                            productController.onFirstClicked(3, 1);
                          },
                          child: Row(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 16.h),
                                color: Colors.white,
                                child: Text(
                                  '선택안함',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: 'NotoSansCJKKR',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Obx(
                                () => Visibility(
                                  visible: productController.optionCheck[3][1],
                                  child: Icon(CupertinoIcons.check_mark),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black26,
                          height: 0,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.defaultDialog(
                          title: '주문완료',
                          content: Text(
                            '주문이 완료되었습니다.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          confirm: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Text(
                                '확인',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontFamily: 'NotoSansCJKKR',
                                  fontWeight: FontWeight.w500,
                                ),
                              )));
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          '구매하기',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontFamily: 'NotoSansCJKKR',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      height: 90.h,
                      width: 375.w,
                      decoration: BoxDecoration(
                        color: Color(0xff283137),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        child: Container(
          child: Center(
            child: Text(
              '옵션선택',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily: 'NotoSansCJKKR',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          height: 90.h,
          width: 375.w,
          decoration: BoxDecoration(
            color: Color(0xff283137),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
