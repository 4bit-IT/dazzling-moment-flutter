import 'package:damo/app/controller/owner/owner_order_day_controller.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/get_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class ShopOrderCalendarManagement extends StatelessWidget {
  final OwnerOrderDayController ownerOrderDayController =
      Get.find<OwnerOrderDayController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().textAppBar(context, '세부 시간 관리'),
      backgroundColor: Colors.white,
      body: Obx(
        () => TableCalendar(
          daysOfWeekHeight: 30.h,
          rowHeight: 80.h,
          firstDay: DateTime.now().add(Duration(
              days: int.parse(
                  ownerOrderDayController.minimumPickUpDate.value.value.text))),
          lastDay: _lastDayOfMonth(DateTime.utc(DateTime.now().year + 1,
              DateTime.now().month, DateTime.now().day)),
          selectedDayPredicate: (day) =>
              isSameDay(ownerOrderDayController.focusedDay.value, day),
          focusedDay: ownerOrderDayController.focusedDay.value,
          //ownerOrderDayController.focusedDay.value,
          locale: 'ko_KR',
          calendarFormat: CalendarFormat.month,
          availableCalendarFormats: const {
            CalendarFormat.month: '한달',
          },
          onDaySelected: (selected, focused) {
            ownerOrderDayController.focusedDay.value = focused;
            daySelected(focused);
          },
          onPageChanged: (focusedDay) {
            ownerOrderDayController.focusedDay.value = focusedDay;
          },
          calendarStyle: CalendarStyle(
            cellMargin: EdgeInsets.zero,
            weekendTextStyle: TextStyle(color: Colors.redAccent),
            selectedDecoration: BoxDecoration(
              color: Color(0xFF9FA8DA),
            ),
            selectedTextStyle: TextStyle(color: Colors.white),
            todayDecoration: BoxDecoration(),
            todayTextStyle: TextStyle(),
          ),
          eventLoader: (day) => ownerOrderDayController.event[day] ?? [],
          calendarBuilders:
              CalendarBuilders(markerBuilder: (context, dateTime, List event) {
            if (ownerOrderDayController.event[dateTime] != null) {
              return Obx(
                () => ownerOrderDayController.event[dateTime]![0].isHoliday!
                    ? Text(
                        '휴일',
                        style: TextStyle(color: Colors.lightBlue),
                      )
                    : Text(
                        '${ownerOrderDayController.event[dateTime]![0].startTime} - ${ownerOrderDayController.event[dateTime]![0].endTime}'),
              );
            }
          }),
        ),
      ),
    );
  }

  DateTime _lastDayOfMonth(DateTime month) {
    final date = month.month < 12
        ? DateTime.utc(month.year, month.month + 1, 1)
        : DateTime.utc(month.year + 1, 1, 1);
    return date.subtract(const Duration(days: 1));
  }

  void daySelected(DateTime date) {
    ownerOrderDayController.selectedStartTime.value = 0;
    ownerOrderDayController.selectedEndTime.value = 0;
    ownerOrderDayController.selectedHoliday.value = false;
    Get.dialog(Dialog(
        child: Container(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
      child: Wrap(
        children: [
          Text('${date.year}-${date.month}-${date.day} 픽업 가능 시간 변경'),
          Row(
            children: [
              Obx(
                () => DropdownButton(
                    value: ownerOrderDayController.selectedStartTime.value,
                    items: ownerOrderDayController.timeList
                        .map((value) => DropdownMenuItem(
                            value: value, child: Text(value.toString())))
                        .toList(),
                    onChanged: !ownerOrderDayController.selectedHoliday.value
                        ? (value) => ownerOrderDayController.selectedStartTime
                            .value = int.parse(value.toString())
                        : null),
              ),
              Text(' 시 부터 '),
              Obx(
                () => DropdownButton(
                  value: ownerOrderDayController.selectedEndTime.value,
                  items: ownerOrderDayController.timeList
                      .map((value) => DropdownMenuItem(
                          value: value, child: Text(value.toString())))
                      .toList(),
                  onChanged: !ownerOrderDayController.selectedHoliday.value
                      ? (value) => ownerOrderDayController
                          .selectedEndTime.value = int.parse(value.toString())
                      : null,
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
                  value: ownerOrderDayController.selectedHoliday.value,
                  onChanged: (value) {
                    ownerOrderDayController.selectedHoliday.value = value!;
                    ownerOrderDayController.selectedStartTime.value = 0;
                    ownerOrderDayController.selectedEndTime.value = 0;
                  },
                  checkColor: Colors.red,
                  activeColor: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                  child: Text('취소'),
                ),
              ),
              InkWell(
                onTap: () async {
                  Get.back();
                  changeDateTime();
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                  child: Text('확인'),
                ),
              )
            ],
          ),
        ],
      ),
    )));
  }

  void changeDateTime() {
    if (ownerOrderDayController.selectedHoliday.value) {
      ownerOrderDayController.changedTimes.add({
        ownerOrderDayController.focusedDay.value: DetailTimeModel(
            dateTime: ownerOrderDayController.focusedDay.value,
            startTime: 0,
            endTime: 0,
            isHoliday: true)
      });

      ownerOrderDayController.event
          .update(ownerOrderDayController.focusedDay.value, (value) {
        value[0].startTime = 0;
        value[0].endTime = 0;
        value[0].dateTime = ownerOrderDayController.focusedDay.value;
        value[0].isHoliday = true;
        return value;
      });
    } else {
      ownerOrderDayController.changedTimes.add({
        ownerOrderDayController.focusedDay.value: DetailTimeModel(
            dateTime: ownerOrderDayController.focusedDay.value,
            startTime: ownerOrderDayController.selectedStartTime.value,
            endTime: ownerOrderDayController.selectedEndTime.value,
            isHoliday: false)
      });
      ownerOrderDayController.event
          .update(ownerOrderDayController.focusedDay.value, (value) {
        return [
          DetailTimeModel(
              dateTime: ownerOrderDayController.focusedDay.value,
              startTime: ownerOrderDayController.selectedStartTime.value,
              endTime: ownerOrderDayController.selectedEndTime.value,
              isHoliday: false)
        ];
      });
    }
    print(ownerOrderDayController.changedTimes);
  }
}
