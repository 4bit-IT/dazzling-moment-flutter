import 'package:damo/app/controller/owner/owner_order_controller.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/get_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get.dart';

class ShopOrderTest extends StatelessWidget {
  OwnerOrderController ownerOrderController = Get.find();
  Map<DateTime, List<String>> event = {
    DateTime.now(): ['1'],
    DateTime.utc(2022, 1, 20): ['2'],
    DateTime.utc(2022, 1, 22): ['3'],
    DateTime.utc(2022, 1, 24): [
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '87',
      '8',
      '9',
      '0',
      '1',
      '2',
      '3',
    ],
    DateTime.utc(2022, 1, 26): ['5'],
    DateTime.utc(2022, 1, 27): ['6'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().textAppBar(context, '주문관리(테스트)'),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => TableCalendar(
                pageAnimationEnabled: false,
                daysOfWeekHeight: 30.h,
                rowHeight: 80.h,
                firstDay: DateTime.utc(
                  DateTime.now().subtract(Duration(days: 30)).year,
                  DateTime.now().subtract(Duration(days: 30)).month,
                  DateTime.now().subtract(Duration(days: 30)).day,
                ),
                lastDay: DateTime.utc(
                  DateTime.now().add(Duration(days: 365)).year,
                  DateTime.now().add(Duration(days: 365)).month,
                  DateTime.now().add(Duration(days: 365)).day,
                ),
                selectedDayPredicate: (day) {
                  return isSameDay(ownerOrderController.focusedDay.value, day);
                },
                focusedDay: ownerOrderController.focusedDay.value,
                locale: 'ko_KR',
                calendarFormat: CalendarFormat.month,
                availableCalendarFormats: const {
                  CalendarFormat.month: '한달',
                },
                onDaySelected: (val, val2) {
                  if (!isSameDay(val, ownerOrderController.focusedDay.value)) {
                    ownerOrderController.focusedDay.value = val2;
                  }
                  if (event[ownerOrderController.focusedDay.value] != null) {
                    Get.dialog(
                      Dialog(
                        child: Container(
                          width: 375.w,
                          height: 700.h,
                          padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 0),
                          child: Obx(
                            () => ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: event[ownerOrderController
                                            .focusedDay.value] ==
                                        null
                                    ? 0
                                    : event[ownerOrderController.focusedDay.value]!
                                        .length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Text(
                                      '${event[ownerOrderController.focusedDay.value]![index]}');
                                }),
                          ),
                        ),
                      ),
                    );
                  }
                },
                onPageChanged: (focusedDay) {
                  print(focusedDay);
                  ownerOrderController.focusedDay.value = focusedDay;
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
                eventLoader: (day) => event[day] ?? [],
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (BuildContext context, DateTime d, List a) {
                    return a.length != 0
                        ? Container(
                            width: double.infinity,
                            child: Text(
                              '${a.length}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xfff93f5b),
                              ),
                            ),
                          )
                        : null;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
