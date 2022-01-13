import 'package:damo/app/controller/owner/owner_order_controller.dart';
import 'package:damo/app/controller/owner/owner_review_comment_controller.dart';
import 'package:damo/app/controller/owner/owner_review_controller.dart';
import 'package:damo/app/controller/owner/owner_shop_controller.dart';
import 'package:damo/app/controller/owner/owner_shop_faq_controller.dart';
import 'package:damo/view/shop/shop_chat_management.dart';
import 'package:damo/view/shop/shop_faq/shop_faq_management.dart';
import 'package:damo/view/shop/shop_order_management.dart';
import 'package:damo/view/shop/shop_product_list.dart';
import 'package:damo/view/shop/shop_product_main.dart';
import 'package:damo/view/shop/shop_product_modify.dart';
import 'package:damo/view/shop/shop_review_management.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShopMain extends StatelessWidget {
  final OwnerShopController ownerShopController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamoAppBar().textAppBar(context, '내 스토어'),
      body: Obx(
        () => ownerShopController.isLoadingModifyData.value
            ? Center(
                child: CircularProgressIndicator(
                  color: Color(0xfff93f5b),
                ),
              )
            : Container(
                padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Divider(
                      height: 1.h,
                      color: Color(0xfff1f3f5),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => ShopProductModify());
                          },
                          child: Container(
                            width: 164.w,
                            height: 75.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xfff1f3f5),
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 14.h,
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Color(0xfff93f5b),
                                      fontSize: 20.sp,
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w700,
                                      height: 1),
                                ),
                                SizedBox(
                                  height: 11.h,
                                ),
                                Text(
                                  '내 상품',
                                  style: TextStyle(
                                      color: Color(0xff283137),
                                      fontSize: 14.sp,
                                      fontFamily: 'NotoSansCJKKR',
                                      height: 1),
                                ),
                                SizedBox(
                                  height: 13.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        InkWell(
                          onTap: () async {
                            Get.to(() => ShopOrderManagement(),
                                binding: OwnerOrderBinding());
                          },
                          child: Container(
                            width: 163.w,
                            height: 75.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xfff1f3f5),
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 14.h,
                                ),
                                Text(
                                  '21',
                                  style: TextStyle(
                                      color: Color(0xfff93f5b),
                                      fontSize: 20.sp,
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w700,
                                      height: 1),
                                ),
                                SizedBox(
                                  height: 11.h,
                                ),
                                Text(
                                  '주문 관리',
                                  style: TextStyle(
                                      color: Color(0xff283137),
                                      fontSize: 14.sp,
                                      fontFamily: 'NotoSansCJKKR',
                                      height: 1),
                                ),
                                SizedBox(
                                  height: 13.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Divider(
                      color: Color(0xfff1f3f5),
                      height: 1.h,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images_svg/ic_mystore_mysalelist.svg',
                                width: 30.w,
                                height: 30.h,
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Expanded(
                                child: Text(
                                  '판매 내역 보기',
                                  style: TextStyle(
                                    color: Color(0xff283137),
                                    fontFamily: 'NotoSansCJKKR',
                                  ),
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/images_svg/ic_바로가기.svg',
                                width: 20.w,
                                height: 20.h,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xfff1f3f5),
                      height: 1.h,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => ShopChatManagement());
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images_svg/ic_mystore_note.svg',
                                width: 30.w,
                                height: 30.h,
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Expanded(
                                child: Text(
                                  '쪽지 관리하기',
                                  style: TextStyle(
                                    color: Color(0xff283137),
                                    fontFamily: 'NotoSansCJKKR',
                                  ),
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/images_svg/ic_바로가기.svg',
                                height: 20.h,
                                width: 20.w,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xfff1f3f5),
                      height: 1.h,
                    ),
                    InkWell(
                      onTap: () async {
                        await OwnerReviewBinding().dependencies();
                        await OwnerReviewCommentBinding().dependencies();
                        Get.to(() => ShopReviewManagement());
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images_svg/ic_mystore_review.svg',
                                width: 30.w,
                                height: 30.h,
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Expanded(
                                child: Text(
                                  '리뷰 관리하기',
                                  style: TextStyle(
                                    color: Color(0xff283137),
                                    fontFamily: 'NotoSansCJKKR',
                                  ),
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/images_svg/ic_바로가기.svg',
                                height: 20.h,
                                width: 20.w,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xfff1f3f5),
                      height: 1.h,
                    ),
                    InkWell(
                      onTap: () {
                        // Get.to(() => ShopPreview());
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images_svg/ic_mystore_salepreview.svg',
                                width: 30.w,
                                height: 30.h,
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Expanded(
                                child: Text(
                                  '내 판매 페이지 미리보기',
                                  style: TextStyle(
                                    color: Color(0xff283137),
                                    fontFamily: 'NotoSansCJKKR',
                                  ),
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/images_svg/ic_바로가기.svg',
                                height: 20.h,
                                width: 20.w,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xfff1f3f5),
                      height: 1.h,
                    ),
                    InkWell(
                      onTap: () async {
                        await OwnerShopFAQBinding().dependencies();
                        Get.to(() => ShopFAQManagement());
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images_svg/ic_mystore_faq.svg',
                                width: 30.w,
                                height: 30.h,
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Expanded(
                                child: Text(
                                  'FAQ 관리하기',
                                  style: TextStyle(
                                    color: Color(0xff283137),
                                    fontFamily: 'NotoSansCJKKR',
                                  ),
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/images_svg/ic_바로가기.svg',
                                height: 20.h,
                                width: 20.w,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xfff1f3f5),
                      height: 1.h,
                      thickness: 1.h,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
