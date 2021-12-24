import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';
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
List<dynamic> selectCheckBoxList = [];
List saveOptionDeatilCheckBoxIndex = List.filled(100, false, growable: false);

class ProductController extends GetxController {
  ShopController shopController = Get.find();

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
                                .optionList[optionListIndex]['optionDetailList']
                                .length,
                            itemBuilder: (BuildContext context,
                                int optionDetailListIndex) {
                              selectCheckBoxList = List.generate(
                                  shopController.shopGetDetailModel.value
                                      .optionList.length,
                                  (i) => List.filled(
                                      shopController
                                          .shopGetDetailModel
                                          .value
                                          .optionList[optionListIndex]
                                              ['optionDetailList']
                                          .length,
                                      false,
                                      growable: false),
                                  growable: false);
                              if (shopController.shopGetDetailModel.value
                                                  .optionList[optionListIndex]
                                              ['optionDetailList']
                                          [optionDetailListIndex]
                                      ['allowMultipleChoices'] ==
                                  true) {
                                // 콘텐츠 다수 선택 가능할 때 (카운터 박스사용)
                                return Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(0, 10.h, 0, 10.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CustomNumberPicker(
                                            shape: Border.all(
                                              color: Colors.black,
                                              style: BorderStyle.none,
                                            ),
                                            valueTextStyle: TextStyle(
                                              color: Color(0xff283137),
                                              fontSize: 15.sp,
                                              fontFamily: 'NotoSansCJKKR',
                                            ),
                                            initialValue: 0,
                                            maxValue: int.parse(shopController
                                                .shopGetDetailModel
                                                .value
                                                .optionList[optionListIndex]
                                                    ['optionDetailList']
                                                    [optionDetailListIndex]
                                                    ['count']
                                                .toString()),
                                            minValue: 0,
                                            step: 1,
                                            onValue: (value) {},
                                          ),
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
                                  ),
                                );
                              } else {
                                //콘텐츠 다수 선택 가능하지 않을 때 (체크박스 사용)
                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setState) {
                                  return InkWell(
                                    onTap: () {
                                      // setState(
                                      //   () {
                                      //     isCheckedBoxAllowMultipleChoices(
                                      //         optionListIndex,
                                      //         optionDetailListIndex);
                                      //     clickedCheckedBox(optionListIndex,
                                      //         optionDetailListIndex);
                                      //   },
                                      // );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: 12.w),
                                            CustomCheckBox(
                                              value: selectCheckBoxList[
                                                      optionListIndex]
                                                  [optionDetailListIndex],
                                              // shouldShowBorder: true,
                                              borderColor: Color(0xff283137),
                                              checkedFillColor:
                                                  Color(0xfff93f5b),
                                              borderRadius: 0,
                                              borderWidth: 0,
                                              checkBoxSize: 15.w,

                                              onChanged: (val) {
                                                setState(
                                                  () {
                                                    isCheckedBoxAllowMultipleChoices(
                                                        optionListIndex,
                                                        optionDetailListIndex);
                                                    clickedCheckedBox(
                                                        optionListIndex,
                                                        optionDetailListIndex);
                                                  },
                                                );
                                              },
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
                                                          ['optionDetailList'][
                                                      optionDetailListIndex]['price'])
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
                                    ),
                                  );
                                });
                              }
                            }),
                      ),
                      // Container(
                      //   height: 1.h,
                      //   decoration: BoxDecoration(
                      //     color: Color(0xfff1f3f5),
                      //   ),
                      // ),
                    ],
                  );
                },
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                '구매하기',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: 'NotoSansCJKKR',
                  fontWeight: FontWeight.w700,
                ),
              ),
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

  Future<void> isCheckedBoxAllowMultipleChoices(
      int optionListIndex, int optionDetailListIndex) async {
    if (shopController.shopGetDetailModel.value.optionList[optionListIndex]
            ['allowMultipleChoices'] ==
        false) {
      if (saveOptionDeatilCheckBoxIndex[optionListIndex] != null) {
        for (int i = 0; i < saveOptionDeatilCheckBoxIndex.length; i++) {
          if (saveOptionDeatilCheckBoxIndex[i] == true) print('이미 고ㅓ름');
        }
      }
    }

    print(selectCheckBoxList);
  }

  void clickedCheckedBox(int optionListIndex, int optionDetailListIndex) async {
    if (selectCheckBoxList[optionListIndex][optionDetailListIndex] == true) {
      selectCheckBoxList[optionListIndex][optionDetailListIndex] = false;
      if (saveOptionDeatilCheckBoxIndex[optionListIndex] != null)
        saveOptionDeatilCheckBoxIndex[optionListIndex] = false;
    } else if (selectCheckBoxList[optionListIndex][optionDetailListIndex] ==
        false) {
      selectCheckBoxList[optionListIndex][optionDetailListIndex] = true;
      if (saveOptionDeatilCheckBoxIndex[optionListIndex] != null)
        saveOptionDeatilCheckBoxIndex[optionListIndex] = true;
    }

    print(selectCheckBoxList);
  }
}
