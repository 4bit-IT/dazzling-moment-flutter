import 'package:card_swiper/card_swiper.dart';
import 'package:damo/app/controller/favorite_controller.dart';
import 'package:damo/app/controller/product_controller.dart';
import 'package:damo/app/controller/shop_controller.dart';
import 'package:damo/view/main/home_main.dart';
import 'package:damo/view/product/product_info.dart';
import 'package:damo/view/product/product_faq.dart';
import 'package:damo/view/product/product_review.dart';
import 'package:damo/viewmodel/loading.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simple_star_rating/simple_star_rating.dart';
import 'package:intl/intl.dart';

var formatter = NumberFormat('#,##,000');

class Product extends StatelessWidget {
  ShopController shopController = Get.find();
  FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shopController.isLoadingShopData.value
          ? Loading().simpleLoading()
          : DefaultTabController(
              length: 3,
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
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
                            Obx(
                              () => InkWell(
                                  onTap: () async {
                                    await favoriteController
                                        .onClickedFavoriteButton(
                                            shopController
                                                .shopGetDetailModel.value.id!,
                                            Get.arguments);
                                  },
                                  child: favoriteController.wishIcon.value),
                            ),
                            SizedBox(width: 10.w),
                          ],
                        ),
                      ],
                      expandedHeight: 375.h,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Swiper(
                          autoplay: false,
                          pagination: SwiperPagination(
                              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 17.h),
                              builder: DotSwiperPaginationBuilder(
                                  color: Colors.grey,
                                  activeColor: Colors.white,
                                  size: 7.0,
                                  activeSize: 7.0)),
                          itemBuilder: (BuildContext context, int index) {
                            return ExtendedImage.network(
                              shopController
                                  .shopGetDetailModel.value.images[index],
                              fit: BoxFit.fill,
                              cache: false,
                            );
                          },
                          itemCount: shopController
                              .shopGetDetailModel.value.images.length,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(17.0.w, 15.h, 10.w, 0.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              shopController.shopGetDetailModel.value.name!,
                              style: TextStyle(
                                color: Color(0xfff93f5b),
                                fontSize: 12.sp,
                                height: 1.h,
                                fontFamily: 'NotoSansCJKKR',
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(height: 14.h),
                            Text(
                              shopController
                                  .shopGetDetailModel.value.dataDescription!,
                              style: TextStyle(
                                color: Color(0xff283137),
                                fontSize: 20.sp,
                                height: 1.h,
                                fontFamily: 'NotoSansCJKKR',
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SliverToBoxAdapter(
                    //   child: Padding(
                    //     padding: EdgeInsets.fromLTRB(17.0.w, 9.h, 10.w, 0.h),
                    //     child: Text(
                    //       shopController.shopGetDetailModel.value.content!,
                    //       style: TextStyle(
                    //         color: Color(0xff283137),
                    //         fontSize: 20.sp,
                    //         height: 1.h,
                    //         fontFamily: 'NotoSansCJKKR',
                    //         fontWeight: FontWeight.w500,
                    //         overflow: TextOverflow.ellipsis,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SliverToBoxAdapter(
                    //   child: Padding(
                    //     padding: EdgeInsets.fromLTRB(17.0.w, 10.h, 15.w, 20.h),
                    //     child: Text(
                    //       shopController.shopGetDetailModel.value.dataDescription!,
                    //       style: TextStyle(
                    //         color: Color(0xff283137),
                    //         fontSize: 20.sp,
                    //         height: 1.h,
                    //         fontFamily: 'NotoSansCJKKR',
                    //         fontWeight: FontWeight.w500,
                    //         overflow: TextOverflow.ellipsis,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(17.0.w, 4.h, 0.w, 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SimpleStarRating(
                                  allowHalfRating: true,
                                  starCount: 5,
                                  rating: shopController
                                      .shopGetDetailModel.value.rating!,
                                  size: 16.w,
                                  isReadOnly: true,
                                  spacing: 2.5.w,
                                ),
                                SizedBox(width: 5.0.w),
                                Text(
                                  shopController
                                      .shopGetDetailModel.value.rating!
                                      .toString(),
                                  style: TextStyle(
                                    color: Color(0xff283137),
                                    fontFamily: 'NotoSansCJKKR',
                                  ),
                                ),
                                SizedBox(width: 2.0.w),
                                Text(
                                  '(' +
                                      shopController
                                          .shopGetDetailModel.value.reviewCount!
                                          .toString() +
                                      ')',
                                  style: TextStyle(
                                    color: Color(0xff8e97a0),
                                    fontFamily: 'NotoSansCJKKR',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 110.w),
                            Row(
                              children: [
                                SizedBox(width: 5.0),
                                Text(
                                  formatter
                                          .format(shopController
                                              .shopGetDetailModel
                                              .value
                                              .basePrice!)
                                          .toString() +
                                      '원 ',
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
                            borderSide:
                                BorderSide(width: 3.0, color: Colors.black),
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
        onTap: () async {
          ProductController productController = Get.put(ProductController());
          //await productController.onClickedOptionSelect();
          Get.bottomSheet(
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(child: optionListView()),
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                    //Get.to(() => );
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            '구매하기 ',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Text(
                          '( 원)'
                        ),
                      ],
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
            elevation: 20.0,
            enableDrag: true,
            backgroundColor: Colors.white,
          );
        },
        child: Container(
          child: Center(
            child: Text(
              '옵션선택',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
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

  Widget optionListView() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: shopController.shopGetDetailModel.value.optionList.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 15.h, 0, 10.h),
              child: Center(
                child: Text(
                  shopController.shopGetDetailModel.value.optionList[index]
                      ['title'],
                  style: TextStyle(
                    color: Color(0xff283137),
                    fontSize: 18.sp,
                    height: 1,
                    fontFamily: 'NotoSansCJKKR',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Text(
              shopController.shopGetDetailModel.value.optionList[index]
                  ['description'],
              style: TextStyle(
                color: Color(0xfff93f5b),
                fontSize: 12.sp,
                height: 1,
                fontFamily: 'NotoSansCJKKR',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 7.h),
            Container(
              height: 4.h,
              decoration: BoxDecoration(
                color: Color(0xfff1f3f5),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(5.w, 10.h, 0, 10.h),
                child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return detailOptionListView(index, setState);
                })),
          ],
        );
      },
    );
  }

  Widget detailOptionListView(int index, StateSetter setState) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: shopController.shopGetDetailModel.value
          .optionList[index]['optionDetailList'].length,
      itemBuilder: (BuildContext context, int detailIndex) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                shopController.option[index].detail![detailIndex].count == null
                    ? Container(
                  width: 80.w,
                      child: Checkbox(
                          value: shopController
                              .option[index].detail![detailIndex].check,
                          onChanged: (value) {
                            setState(
                              () {
                                if (shopController.shopGetDetailModel.value
                                                .optionList[index]
                                            ['allowMultipleChoices'] ==
                                        false &&
                                    shopController.option[index]
                                            .detail![detailIndex].check ==
                                        false) {
                                  for (int i = 0;
                                      i <
                                          shopController
                                              .shopGetDetailModel
                                              .value
                                              .optionList[index]
                                                  ['optionDetailList']
                                              .length;
                                      i++) {
                                    if (i != detailIndex) {
                                      if (shopController
                                              .option[index].detail![i].count ==
                                          null) {
                                        shopController.option[index].detail![i]
                                            .check = false;
                                      } else {
                                        shopController
                                            .option[index].detail![i].count = 0;
                                      }
                                    }
                                  }
                                }
                                shopController.option[index].detail![detailIndex]
                                    .check = value!;
                              },
                            );
                          },
                          checkColor: Color(0xfff93f5b),
                          activeColor: Colors.white,
                        ),
                    )
                    : Container(
                  width: 80.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(4.w, 4.h, 4.w, 4.h),
                              child: InkWell(
                                onTap: () {
                                  setState(
                                    () {
                                      if (shopController.option[index]
                                              .detail![detailIndex].count! >
                                          0) {
                                        shopController
                                            .option[index]
                                            .detail![detailIndex]
                                            .count = shopController
                                                .option[index]
                                                .detail![detailIndex]
                                                .count! -
                                            1;
                                      }
                                    },
                                  );
                                },
                                child: Icon(Icons.remove),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(4.w, 4.h, 4.w, 4.h),
                              child: Text(
                                shopController
                                    .option[index].detail![detailIndex].count
                                    .toString(),
                                style: TextStyle(
                                  color: Color(0xff283137),
                                  fontSize: 15.sp,
                                  fontFamily: 'NotoSansCJKKR',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(4.w, 4.h, 4.w, 4.h),
                              child: InkWell(
                                onTap: () {
                                  setState(
                                    () {
                                      if (shopController.option[index]
                                                  .detail![detailIndex].count! <
                                              shopController.shopGetDetailModel
                                                          .value.optionList[index]
                                                      ['optionDetailList']
                                                  [detailIndex]['count'] &&
                                          shopController.shopGetDetailModel.value
                                                      .optionList[index]
                                                  ['allowMultipleChoices'] ==
                                              false) {
                                        for (int i = 0;
                                            i <
                                                shopController
                                                    .shopGetDetailModel
                                                    .value
                                                    .optionList[index]
                                                        ['optionDetailList']
                                                    .length;
                                            i++) {
                                          if (i != detailIndex) {
                                            if (shopController.option[index]
                                                    .detail![i].check ==
                                                true) {
                                              shopController.option[index]
                                                  .detail![i].check = false;
                                            }
                                            if (shopController.option[index]
                                                        .detail![i].count !=
                                                    null &&
                                                shopController.option[index]
                                                        .detail![i].count! >
                                                    0) {
                                              shopController.option[index]
                                                  .detail![i].count = 0;
                                            }
                                          }
                                        }
                                      }
                                      shopController
                                          .option[index]
                                          .detail![detailIndex]
                                          .count = shopController.option[index]
                                              .detail![detailIndex].count! +
                                          1;
                                    },
                                  );
                                },
                                child: Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                      ),
                SizedBox(width: 11.w),
                Text(
                  shopController.shopGetDetailModel.value.optionList[index]
                      ['optionDetailList'][detailIndex]['content'],
                  style: TextStyle(
                    color: Color(0xff283137),
                    fontSize: 15.sp,
                    fontFamily: 'NotoSansCJKKR',
                  ),
                ),
              ],
            ),
            Text(
              '+ ${formatter.format(shopController.shopGetDetailModel.value.optionList[index]['optionDetailList'][detailIndex]['price'])} 원',
              style: TextStyle(
                color: Color(0xff283137),
                fontSize: 15.sp,
                fontFamily: 'NotoSansCJKKR',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      },
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
