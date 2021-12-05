import 'package:cached_network_image/cached_network_image.dart';
import 'package:damo/app/controller/shop_controller.dart';
import 'package:damo/app/controller/shop_faq_controller.dart';
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
              child: Obx(
                    () => Container(
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
                          child: shopController.shopGetMeModel.value.shopProfileImage == 'null'
                              ? SvgPicture.asset(
                            'assets/images_svg/ic_상품이미지추가.svg',
                            width: 100.w,
                            height: 100.h,
                          )
                              : CachedNetworkImage(
                            imageUrl: shopController.shopGetMeModel.value.shopProfileImage!,
                            width: 100.w,
                            height: 100.h,
                            fadeInDuration: Duration(milliseconds: 100),
                            fadeOutDuration: Duration(milliseconds: 100),
                            placeholder: (context, url) => CircularProgressIndicator(),
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
                          controller: shopController.shopNameController.value,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: shopController.shopGetMeModel.value.name == 'null' ? '스토어 이름을 입력하세요' : null,
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
                          controller: shopController.shopContentController.value,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: shopController.shopGetMeModel.value.content == 'null'
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
                          controller: shopController.shopDescriptionController.value,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: shopController.shopGetMeModel.value.dataDescription == 'null'
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
                        '상품 이미지(최대 10개)',
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
                                child: Stack(
                                  children: [
                                    index >= shopController.shopGetMeModel.value.images.length
                                        ? Container(
                                      width: 100.w,
                                      height: 100.h,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black12),
                                          borderRadius: BorderRadius.circular(8.r)),
                                    )
                                        : CachedNetworkImage(
                                      imageUrl: '${shopController.shopGetMeModel.value.images[index]}',
                                      width: 100.w,
                                      height: 100.h,
                                      fit: BoxFit.fill,
                                      fadeInDuration: Duration(milliseconds: 100),
                                      fadeOutDuration: Duration(milliseconds: 100),
                                      placeholder: (context, url) => CircularProgressIndicator(),
                                    ),
                                    Positioned(
                                      left: 35.w,
                                      top: 35.h,
                                      child: index >= shopController.shopGetMeModel.value.images.length
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
                      SizedBox(height: 32.h),
                      Container(
                        padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 8.h),
                        color: Colors.black12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('* 옵션은 옵션 제목, 옵션 설명, 선택지로 구성되어 있습니다.\n'),
                            Text(
                                '* 옵션의 선택지는 최소 1개 선택이 가능하도록 되어있습니다. 그러므로 고객이 옵션의 선택지를 선택할 필요가 없는 경우, \'선택지\' 란에 반드시 \'선택 안함\' 등과 같은 선택지를 추가해 주세요.')
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 32.h,
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
                          SizedBox(
                            width: 100.w,
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
                                controller: shopController.shopBasePriceController.value,
                                inputFormatters: [
                                  MaskTextInputFormatter(
                                    mask: '#######',
                                  ),
                                ],
                                keyboardType: TextInputType.number,
                                maxLines: 1,
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
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: shopController.mainOptionList.length,
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
                                        controller: shopController.mainOptionList[index].mainOptionTitleController,
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
                                        controller:
                                        shopController.mainOptionList[index].mainOptionDescriptionController,
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
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '선택지의 중복 선택 가능유무',
                                          style: TextStyle(
                                            color: Color(0xfff93f5b),
                                            fontSize: 16.sp,
                                            height: 1,
                                            fontFamily: 'NotoSansCJKKR',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Switch(
                                          value: shopController.mainOptionList[index].mainOptionAllowMultipleChoices!,
                                          onChanged: (value) {
                                            shopController.allowMultipleChoicesChanged(index);
                                          },
                                          activeColor: Color(0xfff93f5b),
                                        ),
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
                                    Obx(
                                          () => ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: shopController.mainOptionList[index].shopDetailOptionList.length,
                                        itemBuilder: (context, detailIndex) => Visibility(
                                          visible: true,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 16.h,
                                              ),
                                              Text(
                                                '선택지 ${detailIndex + 1}',
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
                                                padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 8.h),
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
                                                      controller: shopController
                                                          .mainOptionList[index]
                                                          .shopDetailOptionList[detailIndex]
                                                          .detailOptionContentController,
                                                      decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        hintText: shopController
                                                            .mainOptionList[index]
                                                            .shopDetailOptionList[detailIndex]
                                                            .detailOptionContentController!
                                                            .value
                                                            .text ==
                                                            ''
                                                            ? '해당 선택지의 내용을 입력해 주세요(ex. 오레오 토핑)'
                                                            : null,
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
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '해당 선택지 기본금액',
                                                          style: TextStyle(
                                                            color: Color(0xfff93f5b),
                                                            fontSize: 16.sp,
                                                            height: 1,
                                                            fontFamily: 'NotoSansCJKKR',
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 70.w,
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
                                                              controller: shopController
                                                                  .mainOptionList[index]
                                                                  .shopDetailOptionList[detailIndex]
                                                                  .detailOptionPriceController,
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
                                                      height: 8.h,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Divider(
                                                          color: Colors.black,
                                                        ),
                                                        SizedBox(
                                                          height: 8.h,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                                InkWell(
                                                                  onTap: () {
                                                                    shopController.decreaseDetailOptionCount(
                                                                        index, detailIndex);
                                                                  },
                                                                  child: Container(
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(color: Color(0xffd1d1d6)),
                                                                        borderRadius: BorderRadius.circular(20.r),
                                                                        color: Colors.white),
                                                                    child: Container(
                                                                      padding:
                                                                      EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
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
                                                                ),
                                                                SizedBox(
                                                                  width: 10.w,
                                                                ),
                                                                Container(
                                                                  decoration: BoxDecoration(
                                                                    border: Border.all(color: Color(0xffd1d1d6)),
                                                                    borderRadius: BorderRadius.circular(20.r),
                                                                  ),
                                                                  child: Container(
                                                                    padding:
                                                                    EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                                                                    child: Text(
                                                                      '${shopController.mainOptionList[index].shopDetailOptionList[detailIndex].detailOptionCount}',
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
                                                                SizedBox(
                                                                  width: 10.w,
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    shopController.increaseDetailOptionCount(
                                                                        index, detailIndex);
                                                                  },
                                                                  child: Container(
                                                                    decoration: BoxDecoration(
                                                                      border: Border.all(color: Color(0xffd1d1d6)),
                                                                      borderRadius: BorderRadius.circular(20.r),
                                                                    ),
                                                                    child: Container(
                                                                      padding:
                                                                      EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
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
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        shopController.onDetailOptionAdd(index);
                                      },
                                      child: Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.r),
                                            border: Border.all(
                                              color: Color(0xffd1d1d6),
                                            ),
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                                            child: Visibility(
                                              visible: true,
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
                          shopController.onMainOptionAdd();
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
          ),
          InkWell(
            onTap: () {
              shopController.optionRegistrationModify();
            },
            child: SvgPicture.asset(
              'assets/images_svg/btn_수정하기_on.svg',
              width: 375.w,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
