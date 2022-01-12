import 'package:cached_network_image/cached_network_image.dart';
import 'package:damo/app/controller/owner/owner_shop_controller.dart';
import 'package:damo/view/shop/shop_product_modify.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ShopProductMain extends StatelessWidget {
  final OwnerShopController ownerShopController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamoAppBar().textAppBar(context, '내 상품 관리'),
      body: ownerShopController.isLoadingModifyData.value
          ? CircularProgressIndicator(
              color: Color(
                0xfff93f5b,
              ),
            )
          : Column(
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
                            Container(
                              height: 100.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffd1d1d6),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: ownerShopController.shopGetMeModel.value
                                          .shopProfileImage ==
                                      null
                                  ? null
                                  : ExtendedImage.network(
                                      ownerShopController.shopGetMeModel.value
                                          .shopProfileImage!,
                                      width: 100.w,
                                      height: 100.h,
                                      fit: BoxFit.cover,
                                      cache: false,
                                      // border: Border.all(color: Colors.red, width: 1.0),
                                      // borderRadius: BorderRadius.all(Radius.circular(30.0)),
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
                                readOnly: true,
                                controller: TextEditingController(text: ownerShopController.shopGetMeModel.value.name),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: ownerShopController
                                              .shopGetMeModel.value.name ==
                                          null
                                      ? '스토어 이름'
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
                                readOnly: true,
                                controller: TextEditingController(text: ownerShopController.shopGetMeModel.value.content),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: ownerShopController
                                              .shopGetMeModel.value.content ==
                                          null
                                      ? '스토어 설명'
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
                                readOnly: true,
                                maxLines: 23,
                                textAlign: TextAlign.center,
                                controller: TextEditingController(text: ownerShopController.shopGetMeModel.value.dataDescription),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: ownerShopController.shopGetMeModel
                                              .value.dataDescription ==
                                          null
                                      ? '스토어 상세 설명'
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
                                itemBuilder: (context, imageIndex) {
                                  return ownerShopController
                                              .shopGetMeModel.value.images ==
                                          null
                                      ? Container(
                                          width: 100.w,
                                          height: 100.h,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black12),
                                              borderRadius:
                                                  BorderRadius.circular(8.r)),
                                        )
                                      : imageIndex >=
                                              ownerShopController.shopGetMeModel
                                                  .value.images.length
                                          ? Container(
                                              width: 100.w,
                                              height: 100.h,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black12),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r)),
                                            )
                                          : CachedNetworkImage(
                                              imageUrl:
                                                  '${ownerShopController.shopGetMeModel.value.images[imageIndex]}',
                                              width: 100.w,
                                              height: 100.h,
                                              fit: BoxFit.fill,
                                              fadeInDuration:
                                                  Duration(milliseconds: 100),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 100),
                                              placeholder: (context, url) =>
                                                  CircularProgressIndicator(),
                                            );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
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
                                      readOnly: true,
                                      controller: ownerShopController
                                          .shopBasePriceController.value,
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
                              itemCount:
                                  ownerShopController.mainOptionList.length,
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
                                        borderRadius:
                                            BorderRadius.circular(8.r)),
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          10.w, 10.h, 10.w, 10.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            child: TextFormField(
                                              readOnly: true,
                                              maxLines: 3,
                                              controller: ownerShopController
                                                  .mainOptionList[index]
                                                  .mainOptionTitleController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(18.h),
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
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            child: TextFormField(
                                              readOnly: true,
                                              maxLines: 5,
                                              controller: ownerShopController
                                                  .mainOptionList[index]
                                                  .mainOptionDescriptionController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(18.h),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                                value: ownerShopController
                                                    .mainOptionList[index]
                                                    .mainOptionAllowMultipleChoices!,
                                                onChanged: (value) {
                                                  //ownerShopController.allowMultipleChoicesChanged(index);
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
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: ownerShopController
                                                  .mainOptionList[index]
                                                  .shopDetailOptionList
                                                  .length,
                                              itemBuilder:
                                                  (context, detailIndex) =>
                                                      Visibility(
                                                visible: true,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 16.h,
                                                    ),
                                                    Text(
                                                      '선택지 ${detailIndex + 1}',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff283137),
                                                        fontSize: 16.sp,
                                                        height: 1,
                                                        fontFamily:
                                                            'NotoSansCJKKR',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              8.w,
                                                              8.h,
                                                              8.w,
                                                              8.h),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          8.r,
                                                        ),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xffd1d1d6),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          TextFormField(
                                                            readOnly: true,
                                                            maxLines: 2,
                                                            controller: ownerShopController
                                                                .mainOptionList[
                                                                    index]
                                                                .shopDetailOptionList[
                                                                    detailIndex]
                                                                .detailOptionContentController,
                                                            decoration:
                                                                InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              hintText: ownerShopController
                                                                          .mainOptionList[
                                                                              index]
                                                                          .shopDetailOptionList[
                                                                              detailIndex]
                                                                          .detailOptionContentController!
                                                                          .value
                                                                          .text ==
                                                                      ''
                                                                  ? '해당 선택지의 내용을 입력해 주세요(ex. 오레오 토핑)'
                                                                  : null,
                                                              hintStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                    0xffd1d1d6),
                                                                fontFamily:
                                                                    'NotoSansCJKKR',
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
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xfff93f5b),
                                                                  fontSize:
                                                                      16.sp,
                                                                  height: 1,
                                                                  fontFamily:
                                                                      'NotoSansCJKKR',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 70.w,
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0xffd1d1d6),
                                                                      width:
                                                                          1.h,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.r),
                                                                  ),
                                                                  child:
                                                                      TextFormField(
                                                                    readOnly:
                                                                        true,
                                                                    inputFormatters: [
                                                                      MaskTextInputFormatter(
                                                                        mask:
                                                                            '#######',
                                                                      )
                                                                    ],
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                    maxLines: 1,
                                                                    controller: ownerShopController
                                                                        .mainOptionList[
                                                                            index]
                                                                        .shopDetailOptionList[
                                                                            detailIndex]
                                                                        .detailOptionPriceController,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      contentPadding:
                                                                          EdgeInsets.all(
                                                                              18.h),
                                                                      border: InputBorder
                                                                          .none,
                                                                      hintStyle:
                                                                          TextStyle(
                                                                        color: Color(
                                                                            0xffd1d1d6),
                                                                        fontFamily:
                                                                            'NotoSansCJKKR',
                                                                        fontSize:
                                                                            14.sp,
                                                                        height:
                                                                            1,
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
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              SizedBox(
                                                                height: 8.h,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    '  해당 선택지의 최대 선택 개수',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xff283137),
                                                                      fontSize:
                                                                          16.sp,
                                                                      height: 1,
                                                                      fontFamily:
                                                                          'NotoSansCJKKR',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                            border:
                                                                                Border.all(color: Color(0xffd1d1d6)),
                                                                            borderRadius: BorderRadius.circular(20.r),
                                                                            color: Colors.white),
                                                                        child:
                                                                            Container(
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              10.w,
                                                                              10.h,
                                                                              10.w,
                                                                              10.h),
                                                                          child:
                                                                              Text(
                                                                            '-',
                                                                            style:
                                                                                TextStyle(
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
                                                                        width:
                                                                            10.w,
                                                                      ),
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          border:
                                                                              Border.all(color: Color(0xffd1d1d6)),
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.r),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              10.w,
                                                                              10.h,
                                                                              10.w,
                                                                              10.h),
                                                                          child:
                                                                              Text(
                                                                            '${ownerShopController.mainOptionList[index].shopDetailOptionList[detailIndex].detailOptionCount}',
                                                                            style:
                                                                                TextStyle(
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
                                                                        width:
                                                                            10.w,
                                                                      ),
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          border:
                                                                              Border.all(color: Color(0xffd1d1d6)),
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.r),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              10.w,
                                                                              10.h,
                                                                              10.w,
                                                                              10.h),
                                                                          child:
                                                                              Text(
                                                                            '+',
                                                                            style:
                                                                                TextStyle(
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 24.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    ownerShopController.fetchModifyData();
                    Get.to(() => ShopProductModify());
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
