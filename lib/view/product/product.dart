import 'package:card_swiper/card_swiper.dart';
import 'package:damo/view/product/product_info.dart';
import 'package:damo/view/product/product_qa.dart';
import 'package:damo/view/product/product_review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

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
                  background: Swiper.children(
                    autoplay: false,
                    pagination: SwiperPagination(
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 17.h),
                        builder: DotSwiperPaginationBuilder(
                            color: Colors.grey,
                            activeColor: Colors.white,
                            size: 7.0,
                            activeSize: 7.0)),
                    children: [
                      Image.asset(
                        "assets/images/상품사진1@3x.png",
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "assets/images/상품사진2@3x.png",
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "assets/images/상품사진3@3x.png",
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
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
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(17.0.w, 9.h, 10.w, 0),
                  child: Text(
                    '플루트 딸기가득 케이크',
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
                    '서울에서 입소문난 수제케이크 집입니다. 기념일용 아름다운 케이크와 함께 눈부신 순간을 축복하세요.  ',
                    style: TextStyle(
                      color: Color(0xff283137),
                      fontFamily: 'NotoSansCJKKR',
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(17.0.w, 4.h, 0.w, 20.h),
                  child: Row(
                    children: [
                      SimpleStarRating(
                        allowHalfRating: true,
                        starCount: 5,
                        rating: 3.0,
                        size: 10.w,
                        isReadOnly: true,
                        spacing: 2.5.w,
                      ),
                      SizedBox(width: 5.0.w),
                      Text(
                        '4.9',
                        style: TextStyle(
                          color: Color(0xff283137),
                          fontFamily: 'NotoSansCJKKR',
                        ),
                      ),
                      SizedBox(width: 2.0.w),
                      Text(
                        '(1,234)',
                        style: TextStyle(
                          color: Color(0xff8e97a0),
                          fontFamily: 'NotoSansCJKKR',
                        ),
                      ),
                      SizedBox(width: 110.w),
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
                        '29,500',
                        style: TextStyle(
                          color: Color(0xff283137),
                          fontSize: 20.sp,
                          fontFamily: 'NotoSansCJKKR',
                          fontWeight: FontWeight.w700,
                        ),
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
                          'F&Q',
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
      bottomNavigationBar: Container(
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
