import 'package:custom_check_box/custom_check_box.dart';
import 'package:damo/app/controller/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

var formatter = NumberFormat('#,##,000');
ShopController shopController = Get.find();

class ProductController extends GetxController {
  RxList<dynamic> selectCheckBoxList = RxList.generate(
      shopController.shopGetDetailModel.value.optionList.length,
      (i) => RxList.generate(1000, (_) => false.obs, growable: false),
      growable: false);
  RxInt price = 0.obs;
  Future<void> onClickedOptionSelect() async {
    return Get.bottomSheet(
      Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount:
                    shopController.shopGetDetailModel.value.optionList.length,
                itemBuilder: (BuildContext context, int optionListIndex) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 15.h, 0, 10.h),
                        child: Center(
                          child: Text(
                            shopController.shopGetDetailModel.value
                                .optionList[optionListIndex]['title'],
                            style: TextStyle(
                              color: Color(0xff283137),
                              fontSize: 18.sp,
                              height: 1,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        shopController.shopGetDetailModel.value
                            .optionList[optionListIndex]['description'],
                        style: TextStyle(
                          color: Color(0xfff93f5b),
                          fontSize: 12.sp,
                          height: 1,
                          fontFamily: 'NotoSansCJKKR',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 7.h),
                      Container(
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: Color(0xfff1f3f5),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(5.w, 10.h, 0, 10.h),
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: shopController
                                  .shopGetDetailModel
                                  .value
                                  .optionList[optionListIndex]
                                      ['optionDetailList']
                                  .length,
                              itemBuilder: (BuildContext context,
                                  int optionDetailListIndex) {
                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setState) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 12.w),
                                          Obx(
                                            () => CustomCheckBox(
                                              value: selectCheckBoxList[
                                                          optionListIndex]
                                                      [optionDetailListIndex]
                                                  .value,
                                              // shouldShowBorder: true,
                                              borderColor: Color(0xff283137),
                                              checkedFillColor:
                                                  Color(0xfff93f5b),
                                              borderRadius: 0,
                                              borderWidth: 0,
                                              checkBoxSize: 15.w,

                                              onChanged: (val) {
                                                if (isAllowMultipleChoices(
                                                        optionListIndex,
                                                        optionDetailListIndex) ==
                                                    true) {
                                                  setState(
                                                    () {
                                                      selectCheckBoxList[
                                                                  optionListIndex]
                                                              [
                                                              optionDetailListIndex]
                                                          .value = val;
                                                      onClickedCheckBox(
                                                          optionListIndex,
                                                          optionDetailListIndex);
                                                    },
                                                  );
                                                }

                                                if (isAllowMultipleChoices(
                                                        optionListIndex,
                                                        optionDetailListIndex) ==
                                                    false) {
                                                  if (isPossibleClickedOption(
                                                          optionListIndex,
                                                          optionDetailListIndex) ==
                                                      true) {
                                                    setState(
                                                      () {
                                                        selectCheckBoxList[
                                                                    optionListIndex]
                                                                [
                                                                optionDetailListIndex]
                                                            .value = val;
                                                        onClickedCheckBox(
                                                            optionListIndex,
                                                            optionDetailListIndex);
                                                      },
                                                    );
                                                  }
                                                }
                                              },
                                            ),
                                          ),
                                          SizedBox(width: 11.w),
                                          Text(
                                            shopController.shopGetDetailModel
                                                                .value.optionList[
                                                            optionListIndex]
                                                        ['optionDetailList']
                                                    [optionDetailListIndex]
                                                ['content'],
                                            style: TextStyle(
                                              color: Color(0xff283137),
                                              fontSize: 15.sp,
                                              fontFamily: 'NotoSansCJKKR',
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '+' +
                                            formatter
                                                .format(shopController
                                                                    .shopGetDetailModel
                                                                    .value
                                                                    .optionList[
                                                                optionListIndex]
                                                            ['optionDetailList']
                                                        [optionDetailListIndex]
                                                    ['price'])
                                                .toString() +
                                            '원  ',
                                        style: TextStyle(
                                          color: Color(0xff283137),
                                          fontSize: 15.sp,
                                          fontFamily: 'NotoSansCJKKR',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  );
                                });
                              })),
                    ],
                  );
                },
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    '구매하기 ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontFamily: 'NotoSansCJKKR',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Obx(
                  () => Text(
                    '($price 원)',
                    style: TextStyle(
                      color: Color(0xfff93f5b),
                      fontSize: 16.sp,
                      fontFamily: 'NotoSansCJKKR',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            height: 90.h,
            width: 375.w,
            decoration: BoxDecoration(
              color: Color(0xff283137),
            ),
          ),
        ],
      ),
      elevation: 20.0,
      enableDrag: true,
      backgroundColor: Colors.white,
    );
  }

  bool isAllowMultipleChoices(int optionListIndex, int optionDetailListIndex) {
    return shopController.shopGetDetailModel.value.optionList[optionListIndex]
            ['allowMultipleChoices']
        ? true
        : false;
  }

  void onClickedCheckBox(int optionListIndex, int optionDetailListIndex) {
    currentCheckBoxStatus(optionListIndex, optionDetailListIndex) == true
        ? addPrice(optionListIndex, optionDetailListIndex)
        : subPrice(optionListIndex, optionDetailListIndex);
  }

  bool isPossibleClickedOption(int optionListIndex, int optionDetailListIndex) {
    for (int i = 0; i < selectCheckBoxList[optionListIndex].length; i++) {
      if (selectCheckBoxList[optionListIndex][i] == true &&
          i != optionDetailListIndex) {
        snackBar();
        return false;
      }
    }
    return true;
  }

  void snackBar() {
    Get.snackbar('이미 고르셨습니다.', '하나의 선택지만 골라주세요',
        icon: Icon(Icons.sentiment_satisfied_alt),
        backgroundColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        animationDuration: Duration(milliseconds: 500),
        duration: Duration(milliseconds: 800));
  }

  bool currentCheckBoxStatus(int optionListIndex, int optionDetailListIndex) {
    return selectCheckBoxList[optionListIndex][optionDetailListIndex].value
        ? true
        : false;
  }

  void addPrice(int optionListIndex, int optionDetailListIndex) {
    price += shopController.shopGetDetailModel.value.optionList[optionListIndex]
        ['optionDetailList'][optionDetailListIndex]['price'];
  }

  void subPrice(int optionListIndex, int optionDetailListIndex) {
    price -= shopController.shopGetDetailModel.value.optionList[optionListIndex]
        ['optionDetailList'][optionDetailListIndex]['price'];
  }
}
