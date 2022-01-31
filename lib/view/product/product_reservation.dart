import 'package:damo/app/controller/order_controller.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/get_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class ProductReservation extends StatelessWidget {
  var formatter = NumberFormat('#,##,000');
  final OrderController orderController = Get.find<OrderController>();
  ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().textAppBar(context, '예약하기'),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Obx(
                () => Column(
                  children: [
                    TableCalendar(
                      pageAnimationEnabled: true,
                      daysOfWeekHeight: 30.h,
                      rowHeight: 80.h,
                      firstDay: DateTime.now(),
                      lastDay: DateTime.now().add(Duration(days: 90)),
                      selectedDayPredicate: (day) {
                        return isSameDay(orderController.focusedDay.value, day);
                      },
                      focusedDay: orderController.focusedDay.value,
                      locale: 'ko_KR',
                      calendarFormat: CalendarFormat.month,
                      availableCalendarFormats: const {
                        CalendarFormat.month: '한달',
                      },
                      onDaySelected: (selected, focused) {
                        orderController.focusedDay.value = focused;
                      },
                      onPageChanged: (focusedDay) {
                        orderController.focusedDay.value = focusedDay;
                      },
                      enabledDayPredicate: (date) {
                        return date.microsecondsSinceEpoch >
                                DateTime.now().microsecondsSinceEpoch ||
                            (date.year == DateTime.now().year &&
                                date.month == DateTime.now().month &&
                                date.day == DateTime.now().day);
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
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              FocusScope.of(context).unfocus();
              /*GetDialog().alternativeDialog(
                  '${orderController.focusedDay.value.year}년 ${orderController.focusedDay.value.month}월 ${orderController.focusedDay.value.day}일에 예약을 하시겠습니까?',
                  () => Future(() => true));*/
            },
            child: Obx(
              () => Container(
                height: 60.h,
                alignment: Alignment.center,
                color: Color(0xfff93f5b),
                child: Text(
                  '${orderController.focusedDay.value.year}-${orderController.focusedDay.value.month}-${orderController.focusedDay.value.day} 예약하기 (${formatter.format(orderController.price.value)} 원)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontFamily: 'NotoSansCJKKR',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
