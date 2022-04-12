import 'package:damo/app/controller/owner/owner_order_day_controller.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/custom_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../viewmodel/loading.dart';

class ShopOrderDayManagement extends StatelessWidget {
  final OwnerOrderDayController ownerOrderDayController =
  Get.find<OwnerOrderDayController>();
  final dayOfWeek = ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().textAppBar(context, '픽업 시간 관리'),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Obx(
              () => ownerOrderDayController.isLoadingData.value
              ? Loading().simpleLoading()
              : Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '기본 픽업시간 설정',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Divider(
                          height: 16.h,
                          thickness: 1,
                        ),
                        Row(
                          children: [
                            Text(
                              '상품 최소 수령 날짜: ',
                              style: TextStyle(color: Color(0xfff93f5b)),
                            ),
                            Text('상품 예약 '),
                            SizedBox(width: 8.w),
                            Container(
                              width: 60.w,
                              child: CustomTextField().simpleTextField(
                                  ownerOrderDayController
                                      .minimumPickUpDate.value,
                                  false,
                                  TextInputType.number,
                                  TextAlign.start,
                                  null,
                                  1,
                                  1,
                                      () {},
                                  [
                                    MaskTextInputFormatter(
                                      mask: '##',
                                      filter: {'#': RegExp(r'^[0-9]')},
                                    ),
                                  ],
                                  ''),
                            ),
                            SizedBox(width: 8.w),
                            Text('일 이후')
                          ],
                        ),
                        SizedBox(height: 16.h),
                        /*Text('각 요일 픽업 가능 시간 설정',
                                    style: TextStyle(color: Color(0xfff93f5b))),*/
                        SizedBox(height: 16.h),
                        dayTimeView(context),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  ownerOrderDayController.focusedDay.value =
                      DateTime.now().add(Duration(
                          days: int.parse(ownerOrderDayController
                              .minimumPickUpDate.value.value.text)));
                  FocusScope.of(context).unfocus();
                  await ownerOrderDayController.setBusinessHourDefault();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60.h,
                  color: Color(0xfff93f5b),
                  child: Text(
                    '세부 날짜 설정',
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

  Widget dayTimeView(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 7,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            dayTimeRangeSelector(context, index);
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 10.h, 0, 10.h),
            height: 70.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${dayOfWeek[index]}',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                ownerOrderDayController //기본값이면
                    .dayTime[index][0]
                    .endTime ==
                    0 &&
                    ownerOrderDayController.dayTime[index][0].startTime ==
                        0 &&
                    ownerOrderDayController.dayTime[index][0].isHoliday ==
                        false
                    ? Text(
                  '시간설정',
                  style: TextStyle(color: Color(0xff8e97a0)),
                )
                    : ownerOrderDayController.dayTime[index][0].isHoliday ==
                    true
                    ? Text(
                  '휴무',
                  style: TextStyle(color: Color(0xfff93f5b)),
                )
                    : Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(10.w, 8.h, 10.w, 8.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      color: Color(0xfff93f5b)),
                  child: Row(
                    children: [
                      ListView.separated(
                        itemCount: ownerOrderDayController
                            .dayTime[index].length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, detailIndex) => Text(
                          '${ownerOrderDayController.dayTime[index][detailIndex].startTime}시~${ownerOrderDayController.dayTime[index][detailIndex].endTime}시',
                          style: TextStyle(color: Colors.white),
                        ),
                        separatorBuilder: (context, detailIndex) =>
                            Text(', ',
                                style:
                                TextStyle(color: Colors.white)),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/images_svg/btn_x.svg',
                          width: 25.w,
                          height: 25.h,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 18.h);
      },
    );
  }

  void dayTimeRangeSelector(BuildContext buildContext, int index) {
    Get.dialog(
      Dialog(
        child: Container(
          height: 350.h,
          padding: EdgeInsets.fromLTRB(16.h, 16.w, 16.h, 16.w),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${dayOfWeek[index]}',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 12.sp),
                    ),
                    ownerOrderDayController //기본값이면
                        .dayTime[index][0]
                        .endTime ==
                        0 &&
                        ownerOrderDayController
                            .dayTime[index][0].startTime ==
                            0 &&
                        ownerOrderDayController
                            .dayTime[index][0].isHoliday ==
                            false
                        ? Text(
                      '시간설정',
                      style: TextStyle(color: Color(0xff8e97a0)),
                    )
                        : ownerOrderDayController.dayTime[index][0].isHoliday ==
                        true
                        ? Text(
                      '휴무',
                      style: TextStyle(color: Color(0xfff93f5b)),
                    )
                        : Container(
                      alignment: Alignment.center,
                      padding:
                      EdgeInsets.fromLTRB(10.w, 8.h, 10.w, 8.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: Color(0xfff93f5b)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListView.separated(
                            itemCount: ownerOrderDayController
                                .dayTime[index].length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, detailIndex) =>
                                Text(
                                  '${ownerOrderDayController.dayTime[index][detailIndex].startTime}시~${ownerOrderDayController.dayTime[index][detailIndex].endTime}시',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp),
                                  textAlign: TextAlign.center,
                                ),
                            separatorBuilder:
                                (context, detailIndex) => Text(', ',
                                style: TextStyle(
                                    color: Colors.white)),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/images_svg/btn_x.svg',
                              width: 25.w,
                              height: 25.h,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                height: 100.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 25,
                  itemBuilder: (BuildContext buildContext, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => rangeCheck(index)
                            ? Text(
                          '$index',
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700),
                        )
                            : Text(
                          '$index',
                          style: TextStyle(
                              color: Color(0xffd1d1d6), fontSize: 13.sp),
                        )),
                        if (index < 24)
                          Obx(
                                () => InkWell(
                              onTap: () {
                                clickRange(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: rangeCheck(index)
                                      ? Color(0xfff93f5b)
                                      : Color(0xffd1d1d6),
                                ),
                                height: 50.h,
                                width: 50.w,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 10.h,
                        width: 10.w,
                        color: Color(0xffd1d1d6),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text('픽업불가'),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        height: 10.h,
                        width: 10.w,
                        color: Color(0xfff93f5b),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text('픽업가능'),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          ownerOrderDayController.firstStart.value = -1;
                          ownerOrderDayController.firstEnd.value = -1;
                          ownerOrderDayController.secondStart.value = -1;
                          ownerOrderDayController.secondEnd.value = -1;
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                          child: Text(
                            '휴무',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                        child: Text(
                          '확인',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xfff93f5b)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }

  bool rangeCheck(int index) {
    if ((index >= ownerOrderDayController.firstStart.value &&
        index <= ownerOrderDayController.firstEnd.value) ||
        (index >= ownerOrderDayController.secondStart.value &&
            index <= ownerOrderDayController.secondEnd.value) ||
        index == ownerOrderDayController.firstStart.value ||
        index == ownerOrderDayController.secondStart.value)
      return true;
    else
      return false;
  }

  void clickRange(int index) {
    if (rangeCheck(index)) {
      if (ownerOrderDayController.firstStart.value != -1 &&
          ownerOrderDayController.firstEnd.value != -1 &&
          ownerOrderDayController.secondStart.value != -1 &&
          ownerOrderDayController.secondEnd.value != -1) {
        ownerOrderDayController.firstStart.value = index;
        ownerOrderDayController.firstEnd.value = -1;
        ownerOrderDayController.secondStart.value = -1;
        ownerOrderDayController.secondEnd.value = -1;
      }
    } else {
      //이미 선택되지 않았을 때
      if (ownerOrderDayController.secondStart.value == -1) {
        if (ownerOrderDayController.firstStart.value == -1) {
          //아무것도 선택 안됐을 때
          ownerOrderDayController.firstStart.value = index;
        } else {
          //첫번째 시작만 선택됐을 때 첫번째 끝을 선택해야함
          if (ownerOrderDayController.firstEnd.value == -1) {
            ownerOrderDayController.firstEnd.value = index;
            if (ownerOrderDayController.firstEnd.value <
                ownerOrderDayController.firstStart.value) {
              int temp = ownerOrderDayController.firstStart.value;
              ownerOrderDayController.firstStart.value =
                  ownerOrderDayController.firstEnd.value;
              ownerOrderDayController.firstEnd.value = temp;
            }
          } else {
            ownerOrderDayController.secondStart.value = index;
          }
        }
      } else {
        if (ownerOrderDayController.secondEnd.value == -1) {
          ownerOrderDayController.secondEnd.value = index;
        } else {
          ownerOrderDayController.firstStart.value = index;
          ownerOrderDayController.firstEnd.value = -1;
          ownerOrderDayController.secondStart.value = -1;
          ownerOrderDayController.secondEnd.value = -1;
        }
      }
    }
  }
}
