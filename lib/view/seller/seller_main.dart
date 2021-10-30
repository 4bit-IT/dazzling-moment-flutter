import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/view/seller/seller_chat_management.dart';
import 'package:damo/view/seller/seller_order_management.dart';
import 'package:damo/view/seller/seller_preview.dart';
import 'package:damo/view/seller/seller_product_main.dart';
import 'package:damo/view/seller/seller_review_management.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'seller_faq_management.dart';

class SellerMain extends StatefulWidget {
  @override
  _SellerMainState createState() => _SellerMainState();
}

class _SellerMainState extends State<SellerMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamoAppBar().textAppBar(context, '김다모 스토어'),
      body: Container(
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
                    Get.to(() => SellerProductMain());
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
                          '107',
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
                Container(
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
                Get.to(() => SellerChatManagement());
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
              onTap: () {
                Get.to(() => SellerReviewManagement());
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
                Get.to(() => SellerPreview());
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
              onTap: () {
                Get.to(() => SellerFAQManagement());
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
    );
  }
}
