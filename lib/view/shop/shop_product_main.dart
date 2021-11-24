import 'package:cached_network_image/cached_network_image.dart';
import 'package:damo/app/controller/shop_controller.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ShopProductMain extends StatelessWidget {
  final ShopController shopController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamoAppBar().textAppBar(context, '내 상품 관리'),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                        child: shopController
                            .shopGetMeModel.value.shopProfileImage ==
                            'null'
                            ? SvgPicture.asset(
                          'assets/images_svg/ic_상품이미지추가.svg',
                          width: 100.w,
                          height: 100.h,
                        )
                            : CachedNetworkImage(
                          imageUrl: shopController
                              .shopGetMeModel.value.shopProfileImage!,
                          width: 100.w,
                          height: 100.h,
                          fadeInDuration: Duration(milliseconds: 100),
                          fadeOutDuration: Duration(milliseconds: 100),
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
                      child: TextFormField(
                        controller: shopController.shopNameController!.value,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: shopController.shopGetMeModel.value.name ==
                              'null'
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
                      height: 52.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xffd1d1d6),
                          width: 1.h,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: TextFormField(
                        controller: shopController.shopContentController!.value,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText:
                          shopController.shopGetMeModel.value.content ==
                              'null'
                              ? '메인페이지에 보일 간략한 설명을 적어주세요'
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
                      '스토어 상세 설명',
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
                      height: 500.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xffd1d1d6),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: TextFormField(
                        maxLines: 23,
                        textAlign: TextAlign.center,
                        controller:
                        shopController.shopDescriptionController!.value,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: shopController
                              .shopGetMeModel.value.dataDescription ==
                              'null'
                              ? '상세페이지에 적힐 스토어 설명을 적어주세요'
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
                    Container(
                      height: 100.h,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
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
                            child: Container(
                              child: Stack(
                                children: [
                                  index >=
                                      shopController.shopGetMeModel.value
                                          .images.length
                                      ? Container(
                                    width: 100.w,
                                    height: 100.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black12),
                                        borderRadius:
                                        BorderRadius.circular(8.r)),
                                  )
                                      : CachedNetworkImage(
                                    imageUrl:
                                    '${shopController.shopGetMeModel.value.images[index]}',
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
                                    child: index >=
                                        shopController.shopGetMeModel.value
                                            .images.length
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
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 8.w,
                            height: 100.h,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      '상품 옵션',
                      style: TextStyle(
                        color: Color(0xff283137),
                        fontSize: 16.sp,
                        height: 1,
                        fontFamily: 'NotoSansCJKKR',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '상품 기본금액',
                          style: TextStyle(
                            color: Color(0xfff93f5b),
                            fontSize: 16.sp,
                            height: 1,
                            fontFamily: 'NotoSansCJKKR',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xffd1d1d6),
                                width: 1.h,
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: TextFormField(
                              inputFormatters: [
                                MaskTextInputFormatter(
                                  mask: '#######',
                                )
                              ],
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              //controller: ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(18.h),
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Color(0xffd1d1d6),
                                  fontFamily: 'NotoSansCJKKR',
                                  fontSize: 14.sp,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) => Column(
                        children: [
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            '옵션 ${index + 1}',
                            style: TextStyle(
                              color: Color(0xff283137),
                              fontSize: 24.sp,
                              height: 1,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffd1d1d6),
                                ),
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '옵션 제목',
                                    style: TextStyle(
                                      color: Color(0xfff93f5b),
                                      fontSize: 16.sp,
                                      height: 1,
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Container(
                                    height: 110.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Color(0xffd1d1d6),
                                        width: 1.h,
                                      ),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: TextFormField(
                                      maxLines: 3,
                                      controller: shopController.mainOptionList![index].optionTitleController,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(18.h),
                                        border: InputBorder.none,
                                        //hintText: '옵션의 제목을 입력하세요(ex, 케이크 맛, 토핑)',
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
                                    height: 16.h,
                                  ),
                                  Text(
                                    '옵션 설명',
                                    style: TextStyle(
                                      color: Color(0xfff93f5b),
                                      fontSize: 16.sp,
                                      height: 1,
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Container(
                                    height: 150.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Color(0xffd1d1d6),
                                        width: 1.h,
                                      ),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: TextFormField(
                                      maxLines: 5,
                                      controller: shopController.mainOptionList![index].optionDescriptionController,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(18.h),
                                        border: InputBorder.none,
                                        hintText:
                                        '옵션의 설명을 입력하세요(ex, 반드시 1개 이상 선택해주세요)',
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
                                    height: 16.h,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '옵션 기본금액',
                                        style: TextStyle(
                                          color: Color(0xfff93f5b),
                                          fontSize: 16.sp,
                                          height: 1,
                                          fontFamily: 'NotoSansCJKKR',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Color(0xffd1d1d6),
                                              width: 1.h,
                                            ),
                                            borderRadius: BorderRadius.circular(8.r),
                                          ),
                                          child: TextFormField(
                                            inputFormatters: [
                                              MaskTextInputFormatter(
                                                mask: '#######',
                                              )
                                            ],
                                            keyboardType: TextInputType.number,
                                            maxLines: 1,
                                            controller: shopController.mainOptionList![index].optionPriceController,
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(18.h),
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                color: Color(0xffd1d1d6),
                                                fontFamily: 'NotoSansCJKKR',
                                                fontSize: 14.sp,
                                                height: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '옵션의 중복 선택 가능유무',
                                        style: TextStyle(
                                          color: Color(0xfff93f5b),
                                          fontSize: 16.sp,
                                          height: 1,
                                          fontFamily: 'NotoSansCJKKR',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border:
                                            Border.all(color: Color(0xffd1d1d6)),
                                            borderRadius: BorderRadius.circular(20.r),
                                            color: Colors.white),
                                        child: Container(
                                          padding: EdgeInsets.all(10.w),
                                          child: Text(
                                            '예',
                                            style: TextStyle(
                                              color: Color(0xff283137),
                                              fontSize: 14.sp,
                                              height: 1,
                                              fontFamily: 'NotoSansCJKKR',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border:
                                            Border.all(color: Color(0xffd1d1d6)),
                                            borderRadius: BorderRadius.circular(20.r),
                                            color: Colors.redAccent[100]),
                                        child: Container(
                                          padding: EdgeInsets.all(10.w),
                                          child: Text(
                                            '아니오',
                                            style: TextStyle(
                                              color: Color(0xff283137),
                                              fontSize: 14.sp,
                                              height: 1,
                                              fontFamily: 'NotoSansCJKKR',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Divider(
                                    thickness: 15.h,
                                    color: Colors.black12,
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  ListView.builder(
                                    itemBuilder: (context, detailIndex) =>
                                        Visibility(
                                          visible: true,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '옵션의 선택지를 설정해주세요',
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
                                              Text(
                                                '선택지 1',
                                                style: TextStyle(
                                                  color: Color(0xff283137),
                                                  fontSize: 16.sp,
                                                  height: 1,
                                                  fontFamily: 'NotoSansCJKKR',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(
                                                    8.r,
                                                  ),
                                                  border: Border.all(
                                                    color: Color(0xffd1d1d6),
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    TextFormField(
                                                      maxLines: 2,
                                                      controller: shopController.mainOptionList![index].optionDetailTitleController![detailIndex],
                                                      decoration: InputDecoration(
                                                        contentPadding:
                                                        EdgeInsets.all(18.h),
                                                        border: InputBorder.none,
                                                        /*hintText:
                                                    '선택지의 제목을 입력하세요(ex, 초코맛 (+ 1000원))',*/
                                                        hintStyle: TextStyle(
                                                          color: Color(0xffd1d1d6),
                                                          fontFamily: 'NotoSansCJKKR',
                                                          fontSize: 14.sp,
                                                          height: 1,
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      height: 1.h,
                                                      color: Colors.black,
                                                    ),
                                                    TextFormField(
                                                      maxLines: 1,
                                                      keyboardType: TextInputType.number,
                                                      controller: shopController.mainOptionList![index].optionDetailPriceController![detailIndex],
                                                      decoration: InputDecoration(
                                                        contentPadding:
                                                        EdgeInsets.all(18.h),
                                                        border: InputBorder.none,
                                                        /*hintText:
                                                    '선택지의 가격을 입력하세요(ex, 1000))',*/
                                                        hintStyle: TextStyle(
                                                          color: Color(0xffd1d1d6),
                                                          fontFamily: 'NotoSansCJKKR',
                                                          fontSize: 14.sp,
                                                          height: 1,
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      color: Colors.black,
                                                    ),
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          '  해당 선택지의 최대 선택 개수',
                                                          style: TextStyle(
                                                            color: Color(0xff283137),
                                                            fontSize: 16.sp,
                                                            height: 1,
                                                            fontFamily: 'NotoSansCJKKR',
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Color(
                                                                          0xffd1d1d6)),
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      20.r),
                                                                  color: Colors.white),
                                                              child: Container(
                                                                padding:
                                                                EdgeInsets.fromLTRB(
                                                                    10.w,
                                                                    10.h,
                                                                    10.w,
                                                                    10.h),
                                                                child: Text(
                                                                  '-',
                                                                  style: TextStyle(
                                                                    color:
                                                                    Color(0xff283137),
                                                                    fontSize: 14.sp,
                                                                    height: 1,
                                                                    fontFamily:
                                                                    'NotoSansCJKKR',
                                                                    fontWeight:
                                                                    FontWeight.w500,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10.w,
                                                            ),
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color:
                                                                    Color(0xffd1d1d6)),
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    20.r),
                                                              ),
                                                              child: Container(
                                                                padding:
                                                                EdgeInsets.fromLTRB(
                                                                    10.w,
                                                                    10.h,
                                                                    10.w,
                                                                    10.h),
                                                                child: Text(
                                                                  '1',
                                                                  style: TextStyle(
                                                                    color:
                                                                    Color(0xff283137),
                                                                    fontSize: 14.sp,
                                                                    height: 1,
                                                                    fontFamily:
                                                                    'NotoSansCJKKR',
                                                                    fontWeight:
                                                                    FontWeight.w500,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10.w,
                                                            ),
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color:
                                                                    Color(0xffd1d1d6)),
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    20.r),
                                                              ),
                                                              child: Container(
                                                                padding:
                                                                EdgeInsets.fromLTRB(
                                                                    10.w,
                                                                    10.h,
                                                                    10.w,
                                                                    10.h),
                                                                child: Text(
                                                                  '+',
                                                                  style: TextStyle(
                                                                    color:
                                                                    Color(0xff283137),
                                                                    fontSize: 14.sp,
                                                                    height: 1,
                                                                    fontFamily:
                                                                    'NotoSansCJKKR',
                                                                    fontWeight:
                                                                    FontWeight.w500,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                    Divider(
                                                      thickness: 15.h,
                                                      color: Colors.black12,
                                                    ),
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        //onDetailOptionAdd();
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors.black),
                                                        ),
                                                        child: Text(
                                                          '선택지 추가',
                                                          style: TextStyle(
                                                            color: Color(0xff283137),
                                                            fontSize: 14.sp,
                                                            height: 1,
                                                            fontFamily: 'NotoSansCJKKR',
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              /*InkWell(
                                      onTap: () {},
                                      child: Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            border: Border.all(
                                              color: Color(0xffd1d1d6),
                                            ),
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10.w, 10.h, 10.w, 10.h),
                                            child: Wrap(
                                              alignment: WrapAlignment.center,
                                              children: [
                                                Text(
                                                  '선택지 추가',
                                                  style: TextStyle(
                                                    color: Color(0xff283137),
                                                    fontSize: 20.sp,
                                                    height: 1,
                                                    fontFamily: 'NotoSansCJKKR',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                SvgPicture.asset(
                                                  'assets/images_svg/ic_상품이미지추가.svg',
                                                  height: 20.h,
                                                  width: 20.w,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),*/
                                            ],
                                          ),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    InkWell(
                      onTap: () {
                        //onMainOptionAdd();
                      },
                      child: Text(
                        '옵션 추가',
                        style: TextStyle(
                          color: Color(0xff283137),
                          fontSize: 30.sp,
                          height: 1,
                          fontFamily: 'NotoSansCJKKR',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SvgPicture.asset(
            'assets/images_svg/btn_수정하기_on.svg',
            width: 375.w,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}