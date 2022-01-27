import 'package:damo/app/controller/owner/owner_order_day_controller.dart';
import 'package:damo/view/shop/shop_order_calendar_management.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/custom_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:table_calendar/table_calendar.dart';

class ShopOrderDayManagement extends StatelessWidget {
  final OwnerOrderDayController ownerOrderDayController =
      Get.find<OwnerOrderDayController>();
  final dayOfWeek = ['월', '화', '수', '목', '금', '토', '일'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().textAppBar(context, '예약시간관리'),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                ownerOrderDayController.minimumPickUpDate.value,
                                false,
                                TextInputType.number,
                                TextAlign.start,
                                null,
                                1,
                                1,
                                () {}, [
                              MaskTextInputFormatter(
                                mask: '##',
                                filter: {'#': RegExp(r'^[0-9]')},
                              ),
                            ]),
                          ),
                          SizedBox(width: 8.w),
                          Text('일 이후')
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Text('각 요일 픽업 가능 시간 설정',
                          style: TextStyle(color: Color(0xfff93f5b))),
                      SizedBox(height: 16.h),
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Text('${dayOfWeek[index]}: '),
                              InkWell(
                                onTap: () {
                                  var time = 0.0;
                                  Get.dialog(StatefulBuilder(
                                      builder: (BuildContext context,
                                              StateSetter setState) =>
                                          Dialog(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                              ),
                                              padding: EdgeInsets.fromLTRB(
                                                  16.w, 16.h, 16.w, 16.h),
                                              child: Wrap(
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text('${time.round()}'),
                                                  Slider(
                                                    activeColor: Color(0xfff93f5b),
                                                    inactiveColor: Colors.black26,
                                                    value: time,
                                                    max: 23,
                                                    min: 0,
                                                    divisions: 23,
                                                    onChanged: (double value) {
                                                      setState(() {
                                                        time = value;
                                                      });
                                                    },
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Get.back();
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.fromLTRB(
                                                                  12.w,
                                                                  12.h,
                                                                  12.w,
                                                                  12.h),
                                                          child: Text('취소'),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          ownerOrderDayController
                                                                  .availablePickupTime[
                                                                      index]
                                                                  .startTime =
                                                              time.toInt();
                                                          ownerOrderDayController
                                                              .availablePickupTime
                                                              .refresh();
                                                          Get.back();
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.fromLTRB(
                                                                  12.w,
                                                                  12.h,
                                                                  12.w,
                                                                  12.h),
                                                          child: Text('확인'),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )));
                                },
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 8.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(color: Color(0xfff93f5b)),
                                  ),
                                  child: Obx(() => Text(
                                      '${ownerOrderDayController.availablePickupTime[index].startTime}')),
                                ),
                              ),
                              Text(' 시 부터'),
                              InkWell(
                                onTap: () {
                                  var time = 0.0;
                                  Get.dialog(StatefulBuilder(
                                      builder: (BuildContext context,
                                              StateSetter setState) =>
                                          Dialog(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                              ),
                                              padding: EdgeInsets.fromLTRB(
                                                  16.w, 16.h, 16.w, 16.h),
                                              child: Wrap(
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  Text('${time.round()}'),
                                                  Slider(
                                                    activeColor: Color(0xfff93f5b),
                                                    inactiveColor: Colors.black26,
                                                    value: time,
                                                    max: 23,
                                                    min: 0,
                                                    divisions: 23,
                                                    onChanged: (double value) {
                                                      setState(() {
                                                        time = value;
                                                      });
                                                    },
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Get.back();
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.fromLTRB(
                                                                  12.w,
                                                                  12.h,
                                                                  12.w,
                                                                  12.h),
                                                          child: Text('취소'),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          ownerOrderDayController
                                                              .availablePickupTime[
                                                                  index]
                                                              .endTime = time.toInt();
                                                          ownerOrderDayController
                                                              .availablePickupTime
                                                              .refresh();
                                                          Get.back();
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.fromLTRB(
                                                                  12.w,
                                                                  12.h,
                                                                  12.w,
                                                                  12.h),
                                                          child: Text('확인'),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )));
                                },
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 8.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(color: Color(0xfff93f5b)),
                                  ),
                                  child: Obx(
                                    () => Text(
                                        '${ownerOrderDayController.availablePickupTime[index].endTime}'),
                                  ),
                                ),
                              ),
                              Text(' 시 까지'),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 16.h);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                FocusScope.of(context).unfocus();
                Get.to(() => ShopOrderCalendarManagement());
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
    );
  }
}
