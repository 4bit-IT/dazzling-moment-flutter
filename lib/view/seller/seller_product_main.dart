import 'package:damo/app/controller/seller_controller.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/view/seller/seller_product_modify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class SellerProductMain extends StatefulWidget {
  const SellerProductMain({Key? key}) : super(key: key);

  @override
  _SellerProductMainState createState() => _SellerProductMainState();
}

class _SellerProductMainState extends State<SellerProductMain> {
  final controller = Get.put(SellerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamoAppBar().textAppBar(context, '내 상품 관리'),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    '스토어 대표 사진',
                    style: TextStyle(
                      color: Color(0xff283137),
                      fontSize: 16.sp,
                      fontFamily: 'NotoSansCJKKR',
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.bottomSheet(
                        Container(
                          height: 136.h,
                          color: Colors.white,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 6.h,
                              ),
                              Container(
                                height: 4.h,
                                width: 39.w,
                                decoration: BoxDecoration(
                                  color: Color(0xffc7c7cc),
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              ),
                              SizedBox(
                                height: 29.h,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  '이미지 변경',
                                  style: TextStyle(
                                    color: Color(0xfff93f5b),
                                    fontSize: 16.sp,
                                    height: 1,
                                    fontFamily: 'NotoSansCJKKR',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 28.h,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  '이미지 삭제',
                                  style: TextStyle(
                                    color: Color(0xff283137),
                                    fontSize: 16.sp,
                                    height: 1,
                                    fontFamily: 'NotoSansCJKKR',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffd1d1d6),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(Icons.add),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    '스토어명',
                    style: TextStyle(
                      color: Color(0xff283137),
                      fontSize: 16.sp,
                      height: 1,
                      fontFamily: 'NotoSansCJKKR',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    height: 52.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xffd1d1d6),
                        width: 1.h,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '스토어 이름을 입력하세요',
                              hintStyle: TextStyle(
                                color: Color(0xffd1d1d6),
                                fontFamily: 'NotoSansCJKKR',
                                fontSize: 14.sp,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.bottomSheet(
                              Container(
                                height: 136.h,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    Container(
                                      height: 4.h,
                                      width: 39.w,
                                      decoration: BoxDecoration(
                                        color: Color(0xffc7c7cc),
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 29.h,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        '이미지 변경',
                                        style: TextStyle(
                                          color: Color(0xfff93f5b),
                                          fontSize: 16.sp,
                                          height: 1,
                                          fontFamily: 'NotoSansCJKKR',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 28.h,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        '이미지 삭제',
                                        style: TextStyle(
                                          color: Color(0xff283137),
                                          fontSize: 16.sp,
                                          height: 1,
                                          fontFamily: 'NotoSansCJKKR',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: SvgPicture.asset(
                            'assets/images_svg/btn_중복확인.svg',
                            width: 92.w,
                            height: 52.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    '스토어 설명',
                    style: TextStyle(
                      color: Color(0xff283137),
                      fontSize: 16.sp,
                      height: 1,
                      fontFamily: 'NotoSansCJKKR',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    height: 150.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xffd1d1d6),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '최대 100 글자',
                        hintStyle: TextStyle(
                          color: Color(0xffd1d1d6),
                          fontFamily: 'NotoSansCJKKR',
                          fontSize: 14.sp,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      Text(
                        '상품 이미지',
                        style: TextStyle(
                          color: Color(0xff283137),
                          fontSize: 16.sp,
                          height: 1,
                          fontFamily: 'NotoSansCJKKR',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.add_a_photo,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    height: 100.h,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.bottomSheet(
                              Container(
                                height: 136.h,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    Container(
                                      height: 4.h,
                                      width: 39.w,
                                      decoration: BoxDecoration(
                                        color: Color(0xffc7c7cc),
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 29.h,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        '이미지 변경',
                                        style: TextStyle(
                                          color: Color(0xfff93f5b),
                                          fontSize: 16.sp,
                                          height: 1,
                                          fontFamily: 'NotoSansCJKKR',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 28.h,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        '이미지 삭제',
                                        style: TextStyle(
                                          color: Color(0xff283137),
                                          fontSize: 16.sp,
                                          height: 1,
                                          fontFamily: 'NotoSansCJKKR',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/상품사진1@3x.png',
                                width: 100.w,
                                height: 100.h,
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                left: 35.w,
                                top: 35.h,
                                child: SvgPicture.asset(
                                  'assets/images_svg/ic_상품이미지교체.svg',
                                  height: 30.h,
                                  width: 30.w,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        InkWell(
                          onTap: () {
                            Get.bottomSheet(
                              Container(
                                height: 136.h,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    Container(
                                      height: 4.h,
                                      width: 39.w,
                                      decoration: BoxDecoration(
                                        color: Color(0xffc7c7cc),
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 29.h,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        '이미지 변경',
                                        style: TextStyle(
                                          color: Color(0xfff93f5b),
                                          fontSize: 16.sp,
                                          height: 1,
                                          fontFamily: 'NotoSansCJKKR',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 28.h,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        '이미지 삭제',
                                        style: TextStyle(
                                          color: Color(0xff283137),
                                          fontSize: 16.sp,
                                          height: 1,
                                          fontFamily: 'NotoSansCJKKR',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/상품사진2@3x.png',
                                width: 100.w,
                                height: 100.h,
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                left: 35.w,
                                top: 35.h,
                                child: SvgPicture.asset(
                                  'assets/images_svg/ic_상품이미지교체.svg',
                                  height: 30.h,
                                  width: 30.w,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        InkWell(
                          onTap: () {
                            Get.bottomSheet(
                              Container(
                                height: 136.h,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    Container(
                                      height: 4.h,
                                      width: 39.w,
                                      decoration: BoxDecoration(
                                        color: Color(0xffc7c7cc),
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 29.h,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        '이미지 변경',
                                        style: TextStyle(
                                          color: Color(0xfff93f5b),
                                          fontSize: 16.sp,
                                          height: 1,
                                          fontFamily: 'NotoSansCJKKR',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 28.h,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        '이미지 삭제',
                                        style: TextStyle(
                                          color: Color(0xff283137),
                                          fontSize: 16.sp,
                                          height: 1,
                                          fontFamily: 'NotoSansCJKKR',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/상품사진3@3x.png',
                                width: 100.w,
                                height: 100.h,
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                left: 35.w,
                                top: 35.h,
                                child: SvgPicture.asset(
                                  'assets/images_svg/ic_상품이미지교체.svg',
                                  height: 30.h,
                                  width: 30.w,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        InkWell(
                          onTap: () {
                            Get.bottomSheet(
                              Container(
                                height: 136.h,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    Container(
                                      height: 4.h,
                                      width: 39.w,
                                      decoration: BoxDecoration(
                                        color: Color(0xffc7c7cc),
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 29.h,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        '이미지 변경',
                                        style: TextStyle(
                                          color: Color(0xfff93f5b),
                                          fontSize: 16.sp,
                                          height: 1,
                                          fontFamily: 'NotoSansCJKKR',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 28.h,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        '이미지 삭제',
                                        style: TextStyle(
                                          color: Color(0xff283137),
                                          fontSize: 16.sp,
                                          height: 1,
                                          fontFamily: 'NotoSansCJKKR',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/상품사진2@3x.png',
                                width: 100.w,
                                height: 100.h,
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                left: 35.w,
                                top: 35.h,
                                child: SvgPicture.asset(
                                  'assets/images_svg/ic_상품이미지교체.svg',
                                  height: 30.h,
                                  width: 30.w,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SvgPicture.asset(
            'assets/images_svg/btn_수정하기_off.svg',
            width: 375.w,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
