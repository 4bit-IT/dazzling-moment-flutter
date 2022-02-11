import 'package:damo/app/controller/owner/owner_order_day_controller.dart';
import 'package:damo/view/shop/shop_order/shop_order_calendar_management.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/custom_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
                            ],''),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text('${dayOfWeek[index]}: '),
                                  Obx(
                                    () => DropdownButton(
                                      value: ownerOrderDayController
                                          .dayTime[index].startTime,
                                      items: ownerOrderDayController.timeList
                                          .map((value) => DropdownMenuItem(
                                              value: value,
                                              child: Text(value.toString())))
                                          .toList(),
                                      onChanged: ownerOrderDayController
                                          .dayTime[index].isHoliday!
                                          ? null
                                          : (value) {
                                        ownerOrderDayController
                                                .dayTime[index].startTime =
                                            int.parse(value.toString());
                                        ownerOrderDayController.dayTime.refresh();
                                      },
                                    ),
                                  ),
                                  Text('  시 부터  '),
                                  Obx(
                                    () => DropdownButton(
                                      value: ownerOrderDayController
                                          .dayTime[index].endTime,
                                      items: ownerOrderDayController.timeList
                                          .map((value) => DropdownMenuItem(
                                              value: value,
                                              child: Text(value.toString())))
                                          .toList(),
                                      onChanged: ownerOrderDayController
                                              .dayTime[index].isHoliday!
                                          ? null
                                          : (value) {
                                              ownerOrderDayController
                                                      .dayTime[index].endTime =
                                                  int.parse(value.toString());
                                              ownerOrderDayController.dayTime
                                                  .refresh();
                                            },
                                    ),
                                  ),
                                  Text(' 시 까지'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('휴무일 여부'),
                                  Obx(
                                    () => Checkbox(
                                      value: ownerOrderDayController
                                          .dayTime[index].isHoliday,
                                      onChanged: (value) {
                                        ownerOrderDayController
                                            .dayTime[index].isHoliday = value!;
                                        ownerOrderDayController
                                            .dayTime[index].startTime = 0;
                                        ownerOrderDayController
                                            .dayTime[index].endTime = 0;
                                        ownerOrderDayController.dayTime.refresh();
                                      },
                                      checkColor: Colors.red,
                                      activeColor: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
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
                ownerOrderDayController.focusedDay.value = DateTime.now().add(
                    Duration(
                        days: int.parse(ownerOrderDayController
                            .minimumPickUpDate.value.value.text)));
                for (int i = 1; i <= 25; i++) {
                  ownerOrderDayController.detailTime.add(DetailTimeModel(
                      dateTime: DateTime.utc(2022, 02, i),
                      startTime:
                          ownerOrderDayController.dayTime[i % 7].startTime,
                      endTime: ownerOrderDayController.dayTime[i % 7].endTime,
                      isHoliday: i % 5 == 0 ? true : false));
                }
                for (var val in ownerOrderDayController.detailTime) {
                  if (ownerOrderDayController.event[val.dateTime] == null) {
                    ownerOrderDayController.event[val.dateTime!] = [];
                    ownerOrderDayController.event[val.dateTime]!.add(val);
                  } else {
                    ownerOrderDayController.event[val.dateTime!] = [val];
                  }
                }
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
