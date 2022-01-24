import 'package:damo/app/controller/notification/notofication_controller.dart';
import 'package:damo/app/controller/shop_controller.dart';
import 'package:damo/app/controller/user_controller.dart';
import 'package:damo/app/data/provider/agreement_api.dart';
import 'package:damo/view/product/product.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/bar/bottom_navigaton.dart';
import 'package:damo/viewmodel/bar/drawer.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:intl/intl.dart';
import 'package:transition/transition.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as ts;

var formatter = NumberFormat('#,##,000');

class HomeMain extends StatelessWidget {
  final notificationController = Get.put(NotificationController());
  final userController = Get.put(UserController(),permanent: true);
  final shopController = Get.put(ShopController());
  int pageNumber = 1;
  String sortValue = 'RATING';
  List sortValueName = ['별점순', '리뷰많은순', '가격순', '최신순', '오래된순'];
  ScrollController scrollController = ScrollController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 500));
    await shopController.loadShopMain(pageNumber, sortValue);
    if (shopController.loadShopMainPageModel.value.hasNextPage == true)
      pageNumber++;
    _refreshController.loadComplete();
  }

  void _onRefresh() async {
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().appBar(context),
      drawer: DrawerButton(),
      bottomNavigationBar: BottomNavigation(
        selectedBottomNavigationBarIndex: 0,
        scrollController: scrollController,
      ),
      body: Column(
        children: [
          SvgPicture.asset(
            'assets/images_svg/img_main_banner.svg',
            width: 375.w,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 9.h, 0, 0),
            child: Container(
                height: 40.h,
                child: ListView.builder(
                    itemCount: sortValueName.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              pageNumber = 1;
                              sortValue = shopController.sortValueName[index];
                              await shopController.sortMainPage(index);
                              shopController.currentSortIndex.value = index;
                              _onRefresh();
                            },
                            child: Obx(
                              () => Container(
                                height: 30.h,
                                width: 74.w,
                                decoration: BoxDecoration(
                                  color: index ==
                                          shopController.currentSortIndex.value
                                      ? Colors.white
                                      : Color(0x4fc9c7c7),
                                  borderRadius: BorderRadius.circular(13.r),
                                  border: index ==
                                          shopController.currentSortIndex.value
                                      ? Border.all(
                                          color: Color(0xfff93f5b), width: 0.7)
                                      : null,
                                ),
                                child: Center(
                                  child: Text(
                                    sortValueName[index],
                                    style: TextStyle(
                                      color: shopController
                                                  .currentSortIndex.value ==
                                              index
                                          ? Color(0xfff93f5b)
                                          : Color(0xff283137),
                                      fontWeight: shopController
                                                  .currentSortIndex.value ==
                                              index
                                          ? FontWeight.w500
                                          : null,
                                      fontSize: 12,
                                      fontFamily: 'NotoSansCJKKR',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.w),
                        ],
                      );
                    })),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5.h, 0, 5.h),
            child: Container(
              height: 1.5,
              margin: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
              ),
              decoration: BoxDecoration(
                color: Color(0xfff1f3f5),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Container(
                height: 460.h,
                child: SmartRefresher(
                  enablePullDown: false,
                  //refresh 비활성화
                  enablePullUp: true,
                  //loading 활성화
                  controller: _refreshController,
                  footer: CustomFooter(
                    builder: (BuildContext context, LoadStatus? mode) {
                      Widget body;
                      if (mode == LoadStatus.idle) {
                        body = Text(' ');
                      } else if (mode == LoadStatus.loading) {
                        body = CupertinoActivityIndicator();
                      } else {
                        body = Text(' ');
                      }
                      return Container(
                        height: 55.0,
                        child: Center(child: body),
                      );
                    },
                  ),
                  onLoading: _onLoading,
                  onRefresh: _onRefresh,
                  child: Obx(
                    () => GridView.builder(
                      itemCount: shopController.storageMainPage.length,
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
                            print(
                                "ShopId:${shopController.storageMainPage[index]['id']}");
                            shopController.loadShopDetail(
                                shopController.storageMainPage[index]['id']);
                            Get.to(() => Product(),
                                arguments: shopController.storageMainPage[index]
                                    ['id']);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              Stack(
                                children: [
                                  shopController.storageMainPage[index]
                                              ['shopProfileImage'] ==
                                          null
                                      ? SvgPicture.asset(
                                          'assets/images_svg/ic_mystore_new.svg',
                                          width: 185.w,
                                          height: 185.h,
                                          fit: BoxFit.fill,
                                        )
                                      : ExtendedImage.network(
                                          shopController.storageMainPage[index]
                                              ['shopProfileImage'],
                                          width: 185.w,
                                          height: 185.h,
                                          fit: BoxFit.fill,
                                          cache: false,
                                        ),
                                  Obx(
                                    () => Positioned(
                                      right: 5.w,
                                      bottom: 5.h,
                                      child: shopController
                                          .storageMainPage[index]
                                              ['isFavoriteButton']
                                          .value,
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
                                      shopController.storageMainPage[index]
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
                                      shopController.storageMainPage[index]
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                              shopController
                                                  .storageMainPage[index]
                                                      ['rating']
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
                                                  shopController
                                                      .storageMainPage[index]
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
                                              .format(shopController
                                                      .storageMainPage[index]
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
              ),
            ),
          ),
        ],
      ),
    );
  }

// SizedBox(height: 12.h),
// Padding(
//   padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
//   child: Container(
//     // 컨테이너의 높이를 200으로 설정
//     height: 76.h,
//     // 리스트뷰 추가
// child: ListView(
//   // 스크롤 방향 설정. 수평적으로 스크롤되도록 설정
// scrollDirection: Axis.horizontal,

//       // 컨테이너들을 ListView의 자식들로 추가
//       children: [
//         InkWell(
//           onTap: () {},
//           child: Column(
//             children: [
//               SvgPicture.asset(
//                   'assets/images_svg/ic_category_all_off.svg',
//                   width: 50.w,
//                   height: 50.h),
//               SizedBox(height: 7.h),
//               Text(
//                 '전체',
//                 style: TextStyle(
//                   color: Color(0xff283137),
//                   fontSize: 10,
//                   fontFamily: 'NotoSansCJKKR',
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(width: 7.w),
//         Column(
//           children: [
//             InkWell(
//               onTap: () {},
//               child: SvgPicture.asset(
//                   'assets/images_svg/ic_category_cake_off.svg',
//                   width: 50.w,
//                   height: 50.h),
//             ),
//             SizedBox(height: 7.h),
//             Text(
//               '케이크',
//               style: TextStyle(
//                 color: Color(0xff283137),
//                 fontSize: 10,
//                 fontFamily: 'NotoSansCJKKR',
//               ),
//             ),
//           ],
//         ),
//         SizedBox(width: 7.w),
//         Column(
//           children: [
//             InkWell(
//               onTap: () {},
//               child: SvgPicture.asset(
//                   'assets/images_svg/ic_category_flower_off.svg',
//                   width: 50.w,
//                   height: 50.h),
//             ),
//             SizedBox(height: 7.h),
//             Text(
//               '꽃',
//               style: TextStyle(
//                 color: Color(0xff283137),
//                 fontSize: 10,
//                 fontFamily: 'NotoSansCJKKR',
//               ),
//             ),
//           ],
//         ),
//         SizedBox(width: 7.w),
//         Column(
//           children: [
//             InkWell(
//               onTap: () {},
//               child: SvgPicture.asset(
//                   'assets/images_svg/ic_category_dessert_off.svg',
//                   width: 50.w,
//                   height: 50.h),
//             ),
//             SizedBox(height: 7.h),
//             Text(
//               '디저트',
//               style: TextStyle(
//                 color: Color(0xff283137),
//                 fontSize: 10,
//                 fontFamily: 'NotoSansCJKKR',
//               ),
//             ),
//           ],
//         ),
//         SizedBox(width: 7.w),
//         Column(
//           children: [
//             InkWell(
//               onTap: () {},
//               child: SvgPicture.asset(
//                   'assets/images_svg/ic_category_wine_off.svg',
//                   width: 50.w,
//                   height: 50.h),
//             ),
//             SizedBox(height: 7.h),
//             Text(
//               '와인',
//               style: TextStyle(
//                 color: Color(0xff283137),
//                 fontSize: 10,
//                 fontFamily: 'NotoSansCJKKR',
//               ),
//             ),
//           ],
//         ),
//         SizedBox(width: 7.w),
//         Column(
//           children: [
//             InkWell(
//               onTap: () {},
//               child: SvgPicture.asset(
//                   'assets/images_svg/ic_category_giftcard_off.svg',
//                   width: 50.w,
//                   height: 50.h),
//             ),
//             SizedBox(height: 7.h),
//             Text(
//               '선물카드',
//               style: TextStyle(
//                 color: Color(0xff283137),
//                 fontSize: 10,
//                 fontFamily: 'NotoSansCJKKR',
//               ),
//             ),
//           ],
//         ),
//         SizedBox(width: 7.w),
//         Column(
//           children: [
//             InkWell(
//               onTap: () {},
//               child: SvgPicture.asset(
//                   'assets/images_svg/ic_category_giftbox_off.svg',
//                   width: 50.w,
//                   height: 50.h),
//             ),
//             SizedBox(height: 7.h),
//             Text(
//               '선물상자',
//               style: TextStyle(
//                 color: Color(0xff283137),
//                 fontSize: 10,
//                 fontFamily: 'NotoSansCJKKR',
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   ),
// ),
// SizedBox(height: 12.h),
// Container(
//   height: 1,
//   decoration: BoxDecoration(
//     color: Color(0xfff1f3f5),
//   ),
// ),
// SizedBox(height: 12.h),
// Padding(
//   padding: const EdgeInsets.fromLTRB(16, 0, 10, 0),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Row(
//         children: [
//           InkWell(
//             onTap: () {},
//             child: Container(
//               height: 26.h,
//               width: 52.w,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     color: Color(0xfff93f5b), width: 1.h),
//                 borderRadius: BorderRadius.circular(13.r),
//               ),
//               child: Column(
//                 children: [
//                   Text(
//                     '주문순',
//                     style: TextStyle(
//                       color: Color(0xfff93f5b),
//                       fontSize: 12,
//                       fontFamily: 'NotoSansCJKKR',
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(width: 8.w),
//           InkWell(
//             onTap: () {},
//             child: Container(
//               height: 26.h,
//               width: 52.w,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     color: Color(0xfff1f3f5), width: 1.h),
//                 color: Color(0xfff1f3f5),
//                 borderRadius: BorderRadius.circular(13.r),
//               ),
//               child: Column(
//                 children: [
//                   Text(
//                     '별점순',
//                     style: TextStyle(
//                       color: Color(0xff283137),
//                       fontSize: 12,
//                       fontFamily: 'NotoSansCJKKR',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(width: 8.w),
//           InkWell(
//             onTap: () {},
// child: Container(
//   height: 26.h,
//   width: 74.w,
//   decoration: BoxDecoration(
//     border: Border.all(
//         color: Color(0xfff1f3f5), width: 1.h),
//     color: Color(0xfff1f3f5),
//     borderRadius: BorderRadius.circular(13.r),
//   ),
//               child: Column(
//                 children: [
//                   Text(
//                     '리뷰많은순',
//                     style: TextStyle(
//                       color: Color(0xff283137),
//                       fontSize: 12,
//                       fontFamily: 'NotoSansCJKKR',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       InkWell(
//         onTap: () {},
//         child: SvgPicture.asset(
//           'assets/images_svg/ic_filter.svg',
//           width: 30.w,
//           height: 30.h,
//         ),
//       ),
//     ],
//   ),
// ),

}
