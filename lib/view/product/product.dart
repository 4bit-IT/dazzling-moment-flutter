import 'package:card_swiper/card_swiper.dart';
import 'package:damo/app/controller/favorite_controller.dart';
import 'package:damo/app/controller/order_controller.dart';
import 'package:damo/app/controller/product_controller.dart';
import 'package:damo/app/controller/shop_controller.dart';
import 'package:damo/view/product/product_info.dart';
import 'package:damo/view/product/product_faq.dart';
import 'package:damo/view/product/product_reservation.dart';
import 'package:damo/view/product/product_review.dart';
import 'package:damo/viewmodel/get_dialog.dart';
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
  late OrderController orderController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => shopController.isLoadingShopData.value
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
                                  onTap: () {
                                    Get.dialog(Dialog(
                                      child: Column(
                                        children: [Text('????????????')],
                                      ),
                                    ));
                                  },
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
                                      );
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
                                margin:
                                    EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 17.h),
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
                                        shopController.shopGetDetailModel.value
                                            .reviewCount!
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
                                        '??? ',
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
                                  '????????????',
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
      ),
      bottomNavigationBar: InkWell(
        onTap: () async {
          orderController = Get.put<OrderController>(OrderController());
          //await productController.onClickedOptionSelect();
          Get.bottomSheet(
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: optionListView(),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (orderController.selectDateClicked() == true) {
                      GetDialog().simpleDialog('????????? ???????????? ????????? ?????????');
                    } else {
                      Get.back();
                      Get.to(() => ProductReservation(),
                          binding: OrderBinding());
                    }
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            '?????? ?????? ????????????',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Obx(
                          () => orderController.price.value != 0
                              ? Text(
                                  ' ${formatter.format(orderController.price.value)} ???',
                                  style: TextStyle(color: Colors.white))
                              : Container(),
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
              '????????????',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
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
        return ExpansionTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15.h, 0, 10.h),
                child: Text(
                  shopController.shopGetDetailModel.value.optionList[index]
                          ['allowMultipleChoices']
                      ? '${shopController.shopGetDetailModel.value.optionList[index]['title']} (????????????)'
                      : '${shopController.shopGetDetailModel.value.optionList[index]['title']} (????????????)',
                  style: TextStyle(
                    color: Color(0xff283137),
                    fontSize: 18.sp,
                    height: 1,
                    fontFamily: 'NotoSansCJKKR',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                shopController.shopGetDetailModel.value.optionList[index]
                    ['description'],
                style: TextStyle(
                  color: Color(0xffbdbdbd),
                  fontSize: 12.sp,
                  height: 1,
                  fontFamily: 'NotoSansCJKKR',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          children: [
            SizedBox(height: 12.h),
            Divider(height: 0),
            Padding(
                padding: EdgeInsets.fromLTRB(20.w, 12.h, 20, 12.h),
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
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: shopController.shopGetDetailModel.value
          .optionList[index]['optionDetailList'].length,
      itemBuilder: (BuildContext context, int detailIndex) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              shopController.shopGetDetailModel.value.optionList[index]
                      ['optionDetailList'][detailIndex]['allowMultipleChoices']
                  ? '${shopController.shopGetDetailModel.value.optionList[index]['optionDetailList'][detailIndex]['content']} (+ ${formatter.format(shopController.shopGetDetailModel.value.optionList[index]['optionDetailList'][detailIndex]['price'])} ???)'
                  : '${shopController.shopGetDetailModel.value.optionList[index]['optionDetailList'][detailIndex]['content']} (+ ${formatter.format(shopController.shopGetDetailModel.value.optionList[index]['optionDetailList'][detailIndex]['price'])} ???)',
              style: TextStyle(
                color: Color(0xff283137),
                fontSize: 15.sp,
                fontFamily: 'NotoSansCJKKR',
              ),
            ),
            shopController.shopGetDetailModel.value.optionList[index]
                    ['optionDetailList'][detailIndex]['allowMultipleChoices']
                ? Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(
                            () {
                              orderController.optionSubtractClicked(
                                  index, detailIndex);
                            },
                          );
                        },
                        child: Container(
                          height: 32.h,
                          width: 32.w,
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                          decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(color: Color(0xffd1d1d6)),
                                top: BorderSide(color: Color(0xffd1d1d6)),
                                bottom: BorderSide(color: Color(0xffd1d1d6)),
                              ),
                              color: Colors.white),
                          child: Text(
                            '-',
                            style: TextStyle(
                              color: Color(0xff283137),
                              fontSize: 14.sp,
                              height: 1,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 32.h,
                        width: 32.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xffd1d1d6)),
                        ),
                        child: Text(
                          orderController
                              .option[index].detail![detailIndex].count
                              .toString(),
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: 'NotoSansCJKKR',
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(
                            () {
                              orderController.optionAddClicked(
                                  index, detailIndex);
                            },
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 32.h,
                          width: 32.w,
                          padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              right: BorderSide(color: Color(0xffd1d1d6)),
                              top: BorderSide(color: Color(0xffd1d1d6)),
                              bottom: BorderSide(color: Color(0xffd1d1d6)),
                            ),
                          ),
                          child: Text(
                            '+',
                            style: TextStyle(
                              color: Color(0xff283137),
                              fontSize: 14.sp,
                              height: 1,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(
                    width: 32.w,
                    height: 32.h,
                    child: Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: orderController
                          .option[index].detail![detailIndex].check,
                      onChanged: (value) {
                        setState(
                          () {
                            orderController.optionCheck(
                                index, detailIndex, value!);
                          },
                        );
                      },
                      checkColor: Color(0xfff93f5b),
                      activeColor: Colors.white,
                    ),
                  ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
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
