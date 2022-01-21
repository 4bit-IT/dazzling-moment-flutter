import 'package:damo/app/controller/shop_controller.dart';
import 'package:damo/app/controller/wishList_controller.dart';
import 'package:damo/view/product/product.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WishListPage extends StatefulWidget {
  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  int pageNumber = 1;
  ScrollController scrollController = ScrollController();
  WishListController wishListController = Get.put(WishListController());
  ShopController shopController = Get.find();
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 500));
    await wishListController.getFavoritesList(pageNumber);
    if (wishListController.favoritesProductListModel.value.hasNextPage == true)
      pageNumber++;
    _refreshController.loadComplete();
  }

  void _onRefresh() async {
    wishListController.favoritesProductListModel.value.hasNextPage = true;
    await wishListController.getFavoritesList(0);
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: DamoAppBar().textAppBar(context, '찜 목록'),
        backgroundColor: Colors.white,
        body: SmartRefresher(
          enablePullDown: false,
          enablePullUp: true,
          controller: _refreshController,
          footer: CustomFooter(
            builder: (BuildContext context, LoadStatus? mode) {
              Widget body;
              if (mode == LoadStatus.idle) {
                body = Text('');
              } else if (mode == LoadStatus.loading) {
                body = CupertinoActivityIndicator();
              } else {
                body = Text('');
              }
              return Container(
                height: 55.0,
                child: Center(child: body),
              );
            },
          ),
          header: CustomHeader(
            builder: (BuildContext context, RefreshStatus? mode) {
              Widget body;
              if (mode == RefreshStatus.idle) {
                body = Text('');
              } else if (mode == RefreshStatus.refreshing) {
                body = CupertinoActivityIndicator();
              } else {
                body = Text('');
              }
              return Container(
                height: 55.0,
                child: Center(child: body),
              );
            },
          ),
          onLoading: _onLoading,
          onRefresh: _onRefresh,
          child: GridView.builder(
            itemCount: wishListController.storageFavoriteList.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 280.h,
              crossAxisCount: 2,
              crossAxisSpacing: 5.w,
            ),
            itemBuilder: (BuildContext context, int index) {
              return CupertinoButton(
                padding: EdgeInsets.all(0),
                onPressed: () async {
                  await shopController.loadShopDetail(
                      wishListController.storageFavoriteList[index]['id']);
                  await Get.to(() => Product(),
                      arguments: wishListController.storageFavoriteList[index]
                          ['id']);
                  _onRefresh();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Stack(
                      children: [
                        wishListController.storageFavoriteList[index]
                                    ['shopProfileImage'] ==
                                null
                            ? SvgPicture.asset(
                                'assets/images_svg/ic_mystore_new.svg',
                                width: 185.w,
                                height: 185.h,
                                fit: BoxFit.fill,
                              )
                            : ExtendedImage.network(
                                wishListController.storageFavoriteList[index]
                                    ['shopProfileImage'],
                                width: 185.w,
                                height: 185.h,
                                fit: BoxFit.fill,
                                cache: false,
                              ),
                        Positioned(
                          right: 5.w,
                          bottom: 5.h,
                          child: wishListController.storageFavoriteList[index]
                                      ['isFavorite'] ==
                                  true
                              ? wishListController.wishIconOn
                              : wishListController.wishIconOff,
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
                            wishListController.storageFavoriteList[index]
                                ['name'],
                            style: TextStyle(
                              color: Color(0xff283137),
                              fontSize: 10.sp,
                              height: 1,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          Text(
                            wishListController.storageFavoriteList[index]
                                ['description'],
                            style: TextStyle(
                              color: Color(0xff283137),
                              fontSize: 11.sp,
                              height: 1.h,
                              fontFamily: 'NotoSansCJKKR',
                              overflow: TextOverflow.ellipsis,
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
                                    wishListController
                                        .storageFavoriteList[index]['rating']
                                        .toString(),
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
                                    '(' +
                                        wishListController
                                            .storageFavoriteList[index]
                                                ['reviewCount']
                                            .toString() +
                                        ')',
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
                                formatter
                                    .format(wishListController
                                            .storageFavoriteList[index]
                                        ['basePrice'])
                                    .toString(),
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
