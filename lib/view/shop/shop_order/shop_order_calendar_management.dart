import 'package:damo/app/controller/owner/owner_order_day_controller.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/loading.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import '../../../viewmodel/get_dialog.dart';

class ShopOrderCalendarManagement extends StatelessWidget {
  final OwnerOrderDayController ownerOrderDayController = Get.find<OwnerOrderDayController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().textAppBar(context, '세부 시간 관리'),
      backgroundColor: Colors.white,
      body: Obx(
        () => ownerOrderDayController.isLoadingDetailData.value
            ? Loading().simpleLoading()
            : Obx(
                () => TableCalendar(
                  daysOfWeekHeight: 30.h,
                  rowHeight: 80.h,
                  firstDay: DateTime.now()
                      .add(Duration(days: int.parse(ownerOrderDayController.minimumPickUpDate.value.value.text))),
                  lastDay:
                      _lastDayOfMonth(DateTime.utc(DateTime.now().year + 1, DateTime.now().month, DateTime.now().day)),
                  selectedDayPredicate: (day) => isSameDay(ownerOrderDayController.focusedDay.value, day),
                  focusedDay: ownerOrderDayController.focusedDay.value,
                  locale: 'ko_KR',
                  calendarFormat: CalendarFormat.month,
                  availableCalendarFormats: const {
                    CalendarFormat.month: '한달',
                  },
                  onDaySelected: (selected, focused) {
                    ownerOrderDayController.focusedDay.value = focused;
                    daySelected(focused);
                  },
                  onPageChanged: (focusedDay) async {
                    await ownerOrderDayController.loadingDetailBusinessHour(focusedDay.year, focusedDay.month);
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
                  calendarBuilders: CalendarBuilders(
                    markerBuilder: (context, dateTime, List event) {
                      if (dateTime.month != ownerOrderDayController.focusedDay.value.month) return null;
                      return Obx(() {
                        if (ownerOrderDayController.event[dateTime] != null) {
                          //디폴트 값 아님
                          return ownerOrderDayController.event[dateTime]![0].isHoliday!
                              ? Text(
                                  '휴일',
                                  style: TextStyle(color: Colors.lightBlue),
                                )
                              : Text(
                                  '${ownerOrderDayController.event[dateTime]![0].startTime} - ${ownerOrderDayController.event[dateTime]![0].endTime}');
                        } else {
                          //디폴트 값
                          int dayOfWeek = parseDayTimeToDayOfWeek(dateTime);
                          return ownerOrderDayController.dayTime[dayOfWeek].isHoliday!
                              ? Text(
                                  '휴일',
                                  style: TextStyle(color: Colors.lightBlue),
                                )
                              : Text(
                                  '${ownerOrderDayController.dayTime[dayOfWeek].startTime} - ${ownerOrderDayController.dayTime[dayOfWeek].endTime}');
                        }
                      });
                    },
                  ),
                ),
              ),
      ),
    );
  }

  int parseDayTimeToDayOfWeek(DateTime day) {
    if (DateFormat('EEEE').format(day) == 'Sunday')
      return 6;
    else if (DateFormat('EEEE').format(day) == 'Monday')
      return 0;
    else if (DateFormat('EEEE').format(day) == 'Tuesday')
      return 1;
    else if (DateFormat('EEEE').format(day) == 'Wednesday')
      return 2;
    else if (DateFormat('EEEE').format(day) == 'Thursday')
      return 3;
    else if (DateFormat('EEEE').format(day) == 'Friday')
      return 4;
    else
      return 5;
  }

  DateTime _lastDayOfMonth(DateTime month) {
    final date = month.month < 12 ? DateTime.utc(month.year, month.month + 1, 1) : DateTime.utc(month.year + 1, 1, 1);
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
                        .map((value) => DropdownMenuItem(value: value, child: Text(value.toString())))
                        .toList(),
                    onChanged: ownerOrderDayController.selectedHoliday.value == false
                        ? (value) => ownerOrderDayController.selectedStartTime.value = int.parse(value.toString())
                        : null),
              ),
              Text(' 시 부터 '),
              Obx(
                () => DropdownButton(
                  value: ownerOrderDayController.selectedEndTime.value,
                  items: ownerOrderDayController.timeList
                      .map((value) => DropdownMenuItem(value: value, child: Text(value.toString())))
                      .toList(),
                  onChanged: ownerOrderDayController.selectedHoliday.value == false
                      ? (value) => ownerOrderDayController.selectedEndTime.value = int.parse(value.toString())
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
    if (!ownerOrderDayController.checkAvailableTime(ownerOrderDayController.selectedStartTime.value,
        ownerOrderDayController.selectedEndTime.value, ownerOrderDayController.selectedHoliday.value)) {
      GetDialog().simpleDialog('종료시간을 시간시간 이후로 설정해주세요. 단, 종료시간만 0시 인 경우 제외');
      return;
    }
    if (ownerOrderDayController.event[ownerOrderDayController.focusedDay.value] == null) {
      //원래 디폴트 값이엇으면,
      ownerOrderDayController.setDetailBusinessHour();
      print('원래 디폴트');
    } else {
      ownerOrderDayController.updateDetailBusinessHour();
      print('디폴트 아님');
    }
    //else if(기본값 설정으로 바뀜을 눌렀으면)
    Get.back();
  }
}
