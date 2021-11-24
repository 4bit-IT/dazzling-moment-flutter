import 'package:damo/app/controller/product_controller.dart';
import 'package:damo/view/product/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


ProductController productController = Get.find();

class WishListPage extends StatelessWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          '찜 목록',
          style: TextStyle(
            color: Color(0xff283137),
            fontSize: 16,
            fontFamily: 'NotoSansCJKKR',
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: InkWell(
              onTap: Get.back,
              child: SvgPicture.asset(
                'assets/images_svg/ic_back.svg',
                width: 30.w,
                height: 30.h,
              ),
            ),
          ),
        ),
      ),
      //아~~` 배고프다~~~
      backgroundColor: Colors.white,
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.all(0),
                  minSize: 0,
                  onPressed: () {
                    productController.index.value = 0;
                    Get.to(() => Product());
                  },
                  child: Column(
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
                            child: InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/images_svg/ic_wish_on.svg',
                                width: 30.w,
                                height: 30.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '  이로아케이크',
                            style: TextStyle(
                              color: Color(0xff283137),
                              fontSize: 15.sp,
                              height: 1,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text(
                            '  부산에서 입소문난 수제디저트 공방이에요~',
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
                          Container(
                            width: 180.w,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 4.w),
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
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.all(0),
                  minSize: 0,
                  onPressed: () {
                    productController.index.value = 1;
                    Get.to(() => Product());
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images_temp/1.jpg',
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
                            child: InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/images_svg/ic_wish_on.svg',
                                width: 30.w,
                                height: 30.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '  스노우케이크',
                            style: TextStyle(
                              color: Color(0xff283137),
                              fontSize: 15.sp,
                              height: 1,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text(
                            '  기억하고 싶은 오늘을 디자인 합니다',
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
                          Container(
                            width: 180.w,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 4.w),
                                    SvgPicture.asset(
                                      'assets/images_svg/ic_review_10.svg',
                                      width: 10.w,
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Text(
                                      '4.7',
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
                                      '(978)',
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
                                  '27,000',
                                  style: TextStyle(
                                      color: Color(0xff283137),
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.sp,
                                      height: 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.all(0),
                  minSize: 0,
                  onPressed: () {
                    productController.index.value = 2;
                    Get.to(() => Product());
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images_temp/2.jpg',
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
                            child: InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/images_svg/ic_wish_on.svg',
                                width: 30.w,
                                height: 30.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '  빈야드케이크',
                            style: TextStyle(
                              color: Color(0xff283137),
                              fontSize: 15.sp,
                              height: 1,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text(
                            '  추억으로의 여행, 매일 오늘같기를~',
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
                          Container(
                            width: 180.w,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 4.w),
                                    SvgPicture.asset(
                                      'assets/images_svg/ic_review_10.svg',
                                      width: 10.w,
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Text(
                                      '4.8',
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
                                      '(1,532)',
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
                                  '31,000',
                                  style: TextStyle(
                                      color: Color(0xff283137),
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.sp,
                                      height: 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.all(0),
                  minSize: 0,
                  onPressed: () {
                    productController.index.value = 3;
                    Get.to(() => Product());
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images_temp/3.jpg',
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
                            child: InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/images_svg/ic_wish_on.svg',
                                width: 30.w,
                                height: 30.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '  마법학교케이크',
                            style: TextStyle(
                              color: Color(0xff283137),
                              fontSize: 15.sp,
                              height: 1,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text(
                            '  감사한 분, 생일인 분, 사랑하는 분에게~',
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
                          Container(
                            width: 180.w,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 4.w),
                                    SvgPicture.asset(
                                      'assets/images_svg/ic_review_10.svg',
                                      width: 10.w,
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Text(
                                      '5.0',
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
                                      '(1,781)',
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
                                  '30,000',
                                  style: TextStyle(
                                      color: Color(0xff283137),
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.sp,
                                      height: 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.all(0),
                  minSize: 0,
                  onPressed: () {
                    productController.index.value = 4;
                    Get.to(() => Product());
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images_temp/5.jpg',
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
                            child: InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/images_svg/ic_wish_on.svg',
                                width: 30.w,
                                height: 30.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '  라플레아르띠',
                            style: TextStyle(
                              color: Color(0xff283137),
                              fontSize: 15.sp,
                              height: 1,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text(
                            '   프리미엄 플라워쿠키 입니다',
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
                          Container(
                            width: 180.w,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 4.w),
                                    SvgPicture.asset(
                                      'assets/images_svg/ic_review_10.svg',
                                      width: 10.w,
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Text(
                                      '4.6',
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
                                      '(512)',
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
                                  '26,000',
                                  style: TextStyle(
                                      color: Color(0xff283137),
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.sp,
                                      height: 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.all(0),
                  minSize: 0,
                  onPressed: () {
                    productController.index.value = 5;
                    Get.to(() => Product());
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images_temp/6.jpg',
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
                            child: InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/images_svg/ic_wish_on.svg',
                                width: 30.w,
                                height: 30.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '  앙플리케이크',
                            style: TextStyle(
                              color: Color(0xff283137),
                              fontSize: 15.sp,
                              height: 1,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text(
                            '  맛잇고남다른 케이크를 만나보세요',
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
                          Container(
                            width: 180.w,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 4.w),
                                    SvgPicture.asset(
                                      'assets/images_svg/ic_review_10.svg',
                                      width: 10.w,
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Text(
                                      '4.7',
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
                                      '(885)',
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
                                  '29,000',
                                  style: TextStyle(
                                      color: Color(0xff283137),
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.sp,
                                      height: 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h,),
          ],
        ),
      ),

      /*Column(
        children: [
          Container(
            height: 1.h,
            decoration: BoxDecoration(
              color: Color(0xfff1f3f5),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Stack(
            children: [
              Image.asset(
                'assets/images/img@3x.png',
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
                child: SvgPicture.asset(
                  'assets/images_svg/ic_wish_on.svg',
                  width: 30.w,
                  height: 30.h,
                ),
              ),
            ],
          )
        ],
      ),*/
    );
  }
}
