import 'package:damo/app/controller/owner/owner_shop_controller.dart';
import 'package:damo/view/shop/shop_image_detail.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/custom_textfield.dart';
import 'package:damo/viewmodel/get_dialog.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ShopProductModify extends StatelessWidget {
  final OwnerShopController shopController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() {
          FocusScope.of(context).unfocus();
          return GetDialog().backButtonDialog(() => null);
        });
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: DamoAppBar().textAppBar(context, '내 상품 관리'),
        body: GestureDetector(
          onPanDown: (_) {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.h),
                      Container(
                        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '스토어 대표 사진',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 16.h),
                            InkWell(
                              onTap: () {
                                Get.bottomSheet(
                                  Wrap(
                                    children: [
                                      InkWell(
                                          onTap: () async {
                                            Get.back();
                                            Get.to(() => ShopImageDetail(), arguments: -1);
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 70.h,
                                            alignment: Alignment.center,
                                            child: Text('이미지 확대'),
                                          )),
                                      Divider(),
                                      InkWell(
                                        onTap: () async {
                                          await shopController.selectShopMainImage();
                                          Get.back();
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 70.h,
                                          alignment: Alignment.center,
                                          child: Text('이미지 변경'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  backgroundColor: Colors.white,
                                );
                              },
                              child: Stack(
                                children: [
                                  Obx(
                                    () => Container(
                                      height: 100.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0xffd1d1d6),
                                          width: 1,
                                        ),
                                      ),
                                      child: shopController.shopGetMeModel.value.shopProfileImage == null
                                          ? Container()
                                          : shopController.selectMainImage!.value.imageUrl != null
                                              ? ExtendedImage.network(shopController.selectMainImage!.value.imageUrl!,
                                                  cache: true, fit: BoxFit.fitHeight)
                                              : Image(
                                                  image: shopController.selectMainImage!.value.image,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 35.w,
                                    top: 35.h,
                                    child: SvgPicture.asset(
                                      'assets/images_svg/ic_상품이미지교체.svg',
                                      height: 30.h,
                                      width: 30.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              '스토어명',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField().simpleTextField(shopController.shopNameController.value, true, null,
                                TextAlign.start, null, 1, 1, null, [], ''),
                            SizedBox(height: 24.h),
                            Text(
                              '스토어 설명',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField().simpleTextField(
                                shopController.shopContentController.value,
                                false,
                                null,
                                TextAlign.start,
                                shopController.shopContentController.value.value.text == ''
                                    ? '메인페이지에 보일 간략한 스토어 설명을 입력해주세요'
                                    : null,
                                2,
                                1,
                                null,
                                [],
                                ''),
                            SizedBox(height: 24.h),
                            Text(
                              '스토어 상세 설명',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField().simpleTextField(
                                shopController.shopDescriptionController.value,
                                false,
                                null,
                                TextAlign.center,
                                shopController.shopDescriptionController.value.value.text == ''
                                    ? '스토어 상세설명을 입력해주세요'
                                    : null,
                                20,
                                20,
                                null,
                                [],
                                ''),
                            SizedBox(height: 24.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '상품 이미지',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '*최대 10개까지 업로드 가능합니다',
                                  style: TextStyle(
                                    color: Color(0xffd1d1d6),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 16.h),
                            Container(
                              height: 100.h,
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: shopController.maxImagesSize,
                                itemBuilder: (context, index) {
                                  return Obx(
                                    () => InkWell(
                                      onTap: () {
                                        Get.bottomSheet(
                                          Wrap(
                                            children: [
                                              index < shopController.imagesSize.value ||
                                                      index == shopController.imagesSize.value - 1
                                                  ? InkWell(
                                                      onTap: () async {
                                                        Get.back();
                                                        Get.to(() => ShopImageDetail(), arguments: index);
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 60.h,
                                                        alignment: Alignment.center,
                                                        child: Text('이미지 확대'),
                                                      ),
                                                    )
                                                  : Container(),
                                              InkWell(
                                                onTap: () async {
                                                  await shopController.selectShopImages(index);
                                                  Get.back();
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 60.h,
                                                  alignment: Alignment.center,
                                                  child: Text(index < shopController.imagesSize.value ||
                                                          index == shopController.imagesSize.value - 1
                                                      ? '이미지 변경'
                                                      : '이미지 추가'),
                                                ),
                                              ),
                                              Visibility(
                                                visible: index < shopController.imagesSize.value ||
                                                    index == shopController.imagesSize.value - 1,
                                                child: InkWell(
                                                  onTap: () async {
                                                    FocusScope.of(context).unfocus();
                                                    GetDialog().alternativeDialog('해당 사진을 삭제하시겠습니까?',
                                                        () async => await shopController.deleteShopImages(index));
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 60.h,
                                                    alignment: Alignment.center,
                                                    child: Text('이미지 삭제'),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          backgroundColor: Colors.white,
                                        );
                                      },
                                      child: index <= shopController.imagesSize.value
                                          ? Container(
                                              height: 100.h,
                                              child: Stack(
                                                children: [
                                                  index == shopController.imagesSize.value
                                                      ? Container(
                                                          width: 100.w,
                                                          height: 100.h,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(color: Colors.black12),
                                                              borderRadius: BorderRadius.circular(8.r)),
                                                        )
                                                      : shopController.selectImages![index].imageUrl == null
                                                          ? Container(
                                                              width: 100.w,
                                                              height: 100.h,
                                                              child: Image(
                                                                image: shopController.selectImages![index].image,
                                                                /*width: 100.w,
                                                                        height: 100.h,*/
                                                                fit: BoxFit.fitHeight,
                                                              ),
                                                            )
                                                          : ExtendedImage.network(
                                                              shopController.selectImages![index].imageUrl!,
                                                              width: 100.w,
                                                              height: 100.h,
                                                              fit: BoxFit.fitHeight,
                                                            ),
                                                  Positioned(
                                                    left: 35.w,
                                                    top: 35.h,
                                                    child: SvgPicture.asset(
                                                      index < shopController.imagesSize.value ||
                                                              index == shopController.imagesSize.value - 1
                                                          ? 'assets/images_svg/ic_상품이미지교체.svg'
                                                          : 'assets/images_svg/ic_상품이미지추가.svg',
                                                      height: 30.h,
                                                      width: 30.w,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Container(
                                              height: 100.h,
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
                            SizedBox(height: 24.h),
                            Text(
                              '상품 옵션',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 16.h),
                            Divider(),
                            SizedBox(height: 16.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('* 옵션은 옵션 제목, 옵션 설명, 선택지로 구성되어 있습니다.'),
                                Text('* 옵션의 선택지는 1개만 선택이 가능하도록 되어있습니다.'),
                                Text('그러므로 고객이 옵션의 선택지를 선택할 필요가 없는 경우,'),
                                Text(' \'선택지\' 란에 반드시 \'선택 안함\' 등과 같은 선택지를 추가해 주세요.'),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            Divider(),
                            SizedBox(height: 16.h),
                            Row(
                              children: [
                                Text('상품 기본금액'),
                                SizedBox(width: 100.w),
                                Expanded(
                                  child: CustomTextField().simpleTextField(
                                      shopController.shopBasePriceController.value,
                                      false,
                                      TextInputType.number,
                                      TextAlign.end,
                                      '',
                                      1,
                                      1,
                                      null,
                                      [
                                        MaskTextInputFormatter(mask: '#######'),
                                      ],
                                      '원'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Obx(
                        () => optionList(),
                      ),
                      InkWell(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          shopController.onMainOptionAdd();
                        },
                        child: Container(
                          width: double.infinity,
                          height: 64.h,
                          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                          decoration: BoxDecoration(
                            color: Color(0xff8e97a0),
                          ),
                          child: Text(
                            '옵션 추가 +',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 32.h),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await shopController.shopManagementModifyClicked(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60.h,
                  color: Color(0xff283137),
                  child: Text(
                    '저장하기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontFamily: 'NotoSansCJKKR',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget optionList() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      itemCount: shopController.mainOptionList.length,
      itemBuilder: (context, index) {
        if (shopController.mainOptionList.length > index || shopController.mainOptionList.length != 0)
          return Container(
            color: Color(0xff8e97a0),
            child: ExpansionTile(
              collapsedIconColor: Colors.white,
              iconColor: Colors.white,
              title: Row(
                children: [
                  Text(
                    '옵션 ${index + 1}',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'NotoSansCJKKR',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  InkWell(
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      GetDialog().alternativeDialog(
                          '해당 옵션을 삭제하시겠습니까?', () async => await shopController.onMainOptionDelete(index));
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 8.h),
                      child: Text(
                        '옵션 삭제',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp, decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ],
              ),
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8.h),
                            Text(
                              '옵션 제목',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 8.h),
                            CustomTextField().simpleTextField(
                                shopController.mainOptionList[index].mainOptionTitleController!,
                                false,
                                null,
                                TextAlign.start,
                                shopController.mainOptionList[index].mainOptionTitleController!.value.text == ''
                                    ? '1. 케이크 맛'
                                    : null,
                                1,
                                1,
                                null,
                                [],
                                ''),
                            SizedBox(height: 16.h),
                            Text(
                              '옵션 설명',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 8.h),
                            CustomTextField().simpleTextField(
                                shopController.mainOptionList[index].mainOptionDescriptionController!,
                                false,
                                null,
                                TextAlign.start,
                                shopController.mainOptionList[index].mainOptionDescriptionController!.value.text == ''
                                    ? '케이크 맛을 고르는 옵션입니다. 반드시 하나 이상 선택해 주세요.'
                                    : null,
                                1,
                                1,
                                null,
                                [],
                                ''),
                            SizedBox(height: 16.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('선택지의 중복 선택 가능유무'),
                                Switch(
                                  value: shopController.mainOptionList[index].mainOptionAllowMultipleChoices!,
                                  onChanged: (value) {
                                    shopController.allowMultipleChoicesChanged(index);
                                  },
                                  activeColor: Color(0xfff93f5b),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Color(0xfff1f3f5),
                        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                        child: Column(
                          children: [
                            Obx(() {
                              if (shopController.mainOptionList.length > index ||
                                  shopController.mainOptionList[index].shopDetailOptionList.length != 0)
                                return optionDetailList(index);
                              else
                                return Container();
                            }),
                            SizedBox(height: 16.h),
                            Divider(height: 0),
                            SizedBox(height: 20.h),
                            InkWell(
                              onTap: () {
                                shopController.onDetailOptionAdd(index);
                              },
                              child: Text(
                                '선택지 추가 +',
                                style: TextStyle(
                                  color: Color(0xff283137),
                                  fontSize: 20.sp,
                                  fontFamily: 'NotoSansCJKKR',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        else
          return Container();
      },
    );
  }

  Widget optionDetailList(int index) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      itemCount: shopController.mainOptionList[index].shopDetailOptionList.length,
      itemBuilder: (context, detailIndex) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '선택지 ${detailIndex + 1}',
                  style: TextStyle(
                    color: Color(0xff283137),
                    fontSize: 16.sp,
                    fontFamily: 'NotoSansCJKKR',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 8.w),
                InkWell(
                  onTap: () async {
                    FocusScope.of(context).unfocus();
                    GetDialog().alternativeDialog(
                        '해당 선택지를 삭제하시겠습니까?', () async => await shopController.onDetailOptionDelete(index, detailIndex));
                  },
                  child: SvgPicture.asset(
                    'assets/images_svg/icon_삭제_20.svg',
                    width: 20.w,
                    height: 20.h,
                  ),
                )
              ],
            ),
            SizedBox(height: 8.h),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  child: CustomTextField().simpleTextField(
                      shopController
                          .mainOptionList[index].shopDetailOptionList[detailIndex].detailOptionContentController!,
                      false,
                      null,
                      TextAlign.start,
                      shopController.mainOptionList[index].shopDetailOptionList[detailIndex]
                                  .detailOptionContentController!.value.text ==
                              ''
                          ? '해당 선택지의 내용을 입력해 주세요(ex. 오레오 토핑)'
                          : null,
                      1,
                      1,
                      null,
                      [],
                      ''),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Text('가격'),
                    SizedBox(width: 160.w),
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
                        child: CustomTextField().simpleTextField(
                            shopController
                                .mainOptionList[index].shopDetailOptionList[detailIndex].detailOptionPriceController!,
                            false,
                            TextInputType.number,
                            TextAlign.end,
                            '',
                            1,
                            1,
                            null,
                            [
                              MaskTextInputFormatter(
                                mask: '#######',
                              )
                            ],
                            '원'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('최대 선택 가능 개수'),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                shopController.decreaseDetailOptionCount(index, detailIndex);
                              },
                              child: Container(
                                height: 40.h,
                                width: 40.w,
                                alignment: Alignment.center,
                                padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                                decoration: BoxDecoration(
                                    border: Border(
                                      left: BorderSide(color: Color(0xffd1d1d6)),
                                      top: BorderSide(color: Color(0xffd1d1d6)),
                                      bottom: BorderSide(color: Color(0xffd1d1d6)),
                                    ),
                                    color: Colors.white),
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
                            Container(
                              height: 40.h,
                              alignment: Alignment.center,
                              padding: EdgeInsets.fromLTRB(30.w, 10.h, 30.w, 10.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Color(0xffd1d1d6)),
                              ),
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
                            InkWell(
                              onTap: () {
                                shopController.increaseDetailOptionCount(index, detailIndex);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 40.h,
                                width: 40.w,
                                padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                    right: BorderSide(color: Color(0xffd1d1d6)),
                                    top: BorderSide(color: Color(0xffd1d1d6)),
                                    bottom: BorderSide(color: Color(0xffd1d1d6)),
                                  ),
                                ),
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
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 20.h,
      ),
    );
  }
}
