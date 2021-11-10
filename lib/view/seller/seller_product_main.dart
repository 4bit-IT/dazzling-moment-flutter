import 'package:cached_network_image/cached_network_image.dart';
import 'package:damo/app/controller/seller_controller.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SellerProductMain extends StatelessWidget {
  final controller = Get.put(SellerController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamoAppBar().textAppBar(context, '내 상품 관리'),
      body: Obx(
        () {
          return SingleChildScrollView(
            child: Column(
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
                            child: controller.shopGetMeModel.mainImage == ''
                                ? SvgPicture.asset(
                                    'assets/images_svg/ic_상품이미지추가.svg',
                                    width: 100.w,
                                    height: 100.h,
                                  )
                                : CachedNetworkImage(
                                    imageUrl:
                                        controller.shopGetMeModel.mainImage,
                                    width: 100.w,
                                    height: 100.h,
                                    fadeInDuration: Duration(milliseconds: 100),
                                    fadeOutDuration:
                                        Duration(milliseconds: 100),
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                  ),
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
                                  controller: TextEditingController(
                                      text: controller.shopGetMeModel.name),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText:
                                        controller.shopGetMeModel.name == ''
                                            ? '스토어 이름을 입력하세요'
                                            : null,
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
                                onTap: () {},
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
                            controller: TextEditingController(
                                text:
                                    controller.shopGetMeModel.dataDescription),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                  controller.shopGetMeModel.dataDescription ==
                                          ''
                                      ? '최대 100 글자'
                                      : null,
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
                          height: 16.h,
                        ),
                        ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return InkWell(
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
                                  index >= controller.shopImageCount
                                      ? Container(
                                          width: 100.w,
                                          height: 100.h,
                                        )
                                      : CachedNetworkImage(
                                          imageUrl:
                                              '${controller.shopGetMeModel.images}',
                                          width: 100.w,
                                          height: 100.h,
                                          fit: BoxFit.fill,
                                          fadeInDuration:
                                              Duration(milliseconds: 100),
                                          fadeOutDuration:
                                              Duration(milliseconds: 100),
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(),
                                        ),
                                  Positioned(
                                    left: 35.w,
                                    top: 35.h,
                                    child: index >= controller.shopImageCount
                                        ? SvgPicture.asset(
                                            'assets/images_svg/ic_상품이미지추가.svg',
                                            height: 30.h,
                                            width: 30.w,
                                          )
                                        : SvgPicture.asset(
                                            'assets/images_svg/ic_상품이미지교체.svg',
                                            height: 30.h,
                                            width: 30.w,
                                          ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 8.w,
                            );
                          },
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
        },
      ),
    );
  }
}
