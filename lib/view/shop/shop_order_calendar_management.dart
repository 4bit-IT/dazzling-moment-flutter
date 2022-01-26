import 'package:damo/app/controller/owner/owner_order_day_controller.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
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
      body: TableCalendar(
        pageAnimationEnabled: true,
        daysOfWeekHeight: 30.h,
        rowHeight: 80.h,
        firstDay: DateTime.now().add(Duration(days: 2)),
        lastDay: DateTime.now().add(Duration(days: 365)),
        /*selectedDayPredicate: (day) {

                        }, */
        focusedDay: DateTime.now().add(Duration(days: 2)),
        onCalendarCreated: (f) {
          print(DateTime.now().add(Duration(days: 2)));
          print(ownerOrderDayController.minimumPickUpDate.value.value.text);
        },
        locale: 'ko_KR',
        calendarFormat: CalendarFormat.month,
        availableCalendarFormats: const {
          CalendarFormat.month: '한달',
        },
        onDaySelected: (selected, focused) {
          //ownerOrderDayController.focusedDay.value = focused;
        },
        onPageChanged: (focusedDay) {
          //ownerOrderDayController.focusedDay.value = focusedDay;
        },
        enabledDayPredicate: (date) {
          return date.microsecondsSinceEpoch >
              DateTime.now()
                  .add(Duration(
                      days: int.parse(ownerOrderDayController
                              .minimumPickUpDate.value.value.text) -
                          1))
                  .microsecondsSinceEpoch;
          /* ||
              (date.year == DateTime.now().year &&
                  date.month == DateTime.now().month &&
                  date.day == DateTime.now().day)*/
          ;
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
      ),
    );
  }
}
