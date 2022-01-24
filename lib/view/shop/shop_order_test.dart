import 'package:damo/app/controller/owner/owner_order_controller.dart';
import 'package:damo/viewmodel/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get.dart';

class ShopOrderTest extends StatelessWidget {
  final OwnerOrderController ownerOrderController =
      Get.find<OwnerOrderController>();
  final Map orderStatus = <String, String>{
    'PENDING': '판매자 확인 중',
    'ALLOW': '주문 수락',
    'REFUSE': '주문 거절',
    'COMPLETE': '제작 완료',
    'FINISHED': '거래 완료',
  };

  final List statusList = ['판매자 확인 중', '주문 수락', '주문 거절', '제작 완료', '거래 완료'];
  final List statusList2 = [
    'PENDING',
    'ALLOW',
    'REFUSE',
    'COMPLETE',
    'FINISHED'
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          shape:
              Border(bottom: BorderSide(color: Color(0xfff1f3f5), width: 1.h)),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            '관리하기',
            style: TextStyle(
              color: Color(0xff283137),
              fontSize: 21.3.sp,
              fontFamily: 'NotoSansCJKKR',
              fontWeight: FontWeight.w700,
            ),
          ),
          bottom: TabBar(
            labelColor: Colors.black87,
            unselectedLabelColor: Colors.black45,
            tabs: [
              Tab(
                text: '주문관리',
              ),
              Tab(
                text: '일정관리',
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: Obx(
          () => ownerOrderController.isLoadingOrderData.value
              ? Loading().simpleLoading()
              : TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Obx(
                      () => TableCalendar(
                        pageAnimationEnabled: false,
                        daysOfWeekHeight: 30.h,
                        rowHeight: 80.h,
                        firstDay: DateTime.now().subtract(Duration(days: 365)),
                        lastDay: DateTime.now().add(Duration(days: 365)),
                        selectedDayPredicate: (day) {
                          return isSameDay(
                              ownerOrderController.focusedDay.value, day);
                        },
                        focusedDay: ownerOrderController.focusedDay.value,
                        locale: 'ko_KR',
                        calendarFormat: CalendarFormat.month,
                        availableCalendarFormats: const {
                          CalendarFormat.month: '한달',
                        },
                        onDaySelected: (selected, focused) {
                          daySelected(selected, focused);
                        },
                        onPageChanged: (focusedDay) {
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
                        eventLoader: (day) =>
                            ownerOrderController.event[day] ?? [],
                        calendarBuilders: CalendarBuilders(
                          markerBuilder: (BuildContext context,
                              DateTime dateTime, List event) {
                            return event.length != 0
                                ? Text(
                                    '${event.length}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xfff93f5b),
                                    ),
                                  )
                                : null;
                          },
                        ),
                      ),
                    ),
                    Obx(
                      () => TableCalendar(
                        pageAnimationEnabled: false,
                        daysOfWeekHeight: 30.h,
                        rowHeight: 80.h,
                        firstDay: DateTime.now().subtract(Duration(days: 365)),
                        lastDay: DateTime.now().add(Duration(days: 365)),
                        selectedDayPredicate: (day) {
                          return isSameDay(
                              ownerOrderController.focusedDay.value, day);
                        },
                        focusedDay: ownerOrderController.focusedDay.value,
                        locale: 'ko_KR',
                        calendarFormat: CalendarFormat.month,
                        availableCalendarFormats: const {
                          CalendarFormat.month: '한달',
                        },
                        onDaySelected: (selected, focused) {
                          daySelected(selected, focused);
                        },
                        onPageChanged: (focusedDay) {
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
                        eventLoader: (day) =>
                            ownerOrderController.event[day] ?? [],
                        calendarBuilders: CalendarBuilders(
                          markerBuilder: (BuildContext context,
                              DateTime dateTime, List event) {
                            return event.length != 0
                                ? Text(
                                    '${event.length}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xfff93f5b),
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
      ),
    );
  }

  void daySelected(DateTime selected, DateTime focused) {
    ownerOrderController.focusedDay.value = focused;
    if (ownerOrderController.event[ownerOrderController.focusedDay.value] !=
        null) {
      ownerOrderController.currentFilterList.value =
          ownerOrderController.event[focused]!;
      Get.dialog(
        WillPopScope(
          onWillPop: () {
            return Future(() {
              ownerOrderController.currentFilterIndex.value = 0;
              return true;
            });
          },
          child: Dialog(
            child: Container(
              padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
              child: Column(
                children: [
                  Container(
                    height: 70.h,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 16.h),
                    child: Obx(
                      () => ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: ownerOrderController.maxStatusSize.value + 1,
                        itemBuilder: (BuildContext context, int index) {
                          return index == 0
                              ? InkWell(
                                  onTap: () {
                                    ownerOrderController.filterStatus(
                                        index, 'default');
                                  },
                                  child: Obx(
                                    () => Container(
                                      padding: EdgeInsets.fromLTRB(
                                          16.w, 16.h, 16.w, 16.h),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: ownerOrderController
                                                      .currentFilterIndex
                                                      .value ==
                                                  index
                                              ? Colors.black54
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(40.r),
                                          border: Border.all(
                                              color: Colors.black26)),
                                      child: Text(
                                        '전체',
                                        style: TextStyle(
                                          color: ownerOrderController
                                                      .currentFilterIndex
                                                      .value ==
                                                  index
                                              ? Colors.white
                                              : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    ownerOrderController.filterStatus(
                                        index, statusList2[index - 1]);
                                  },
                                  child: Obx(
                                    () => Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.fromLTRB(
                                          16.w, 16.h, 16.w, 16.h),
                                      decoration: BoxDecoration(
                                          color: ownerOrderController
                                                      .currentFilterIndex
                                                      .value ==
                                                  index
                                              ? Colors.black54
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(40.r),
                                          border: Border.all(
                                              color: Colors.black26)),
                                      child: Text(
                                        statusList[index - 1],
                                        style: TextStyle(
                                          color: ownerOrderController
                                                      .currentFilterIndex
                                                      .value ==
                                                  index
                                              ? Colors.white
                                              : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 8.w);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => SingleChildScrollView(
                        controller: ownerOrderController.scrollController.value,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount:
                              ownerOrderController.currentFilterList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${orderStatus[ownerOrderController.currentFilterList[index]['status']]}',
                                      style: TextStyle(
                                        color: Color(0xfff93f5b),
                                        fontSize: 12.sp,
                                        fontFamily: 'NotoSansCJKKR',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    orderStatus[ownerOrderController
                                                        .currentFilterList[
                                                    index]['status']] ==
                                                '주문 거절' ||
                                            orderStatus[ownerOrderController
                                                        .currentFilterList[
                                                    index]['status']] ==
                                                '거래 완료'
                                        ? Container()
                                        : InkWell(
                                            onTap: () {
                                              print(ownerOrderController
                                                      .currentFilterList[index]
                                                  ['status']);
                                              if (!(ownerOrderController
                                                              .currentFilterList[
                                                          index]['status'] ==
                                                      'REFUSE' ||
                                                  ownerOrderController
                                                              .currentFilterList[
                                                          index]['status'] ==
                                                      'FINISHED'))
                                                ownerOrderController
                                                    .changeOrderStatusClicked(
                                                        index,
                                                        ownerOrderController
                                                                .currentFilterList[
                                                            index]['status']);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  8.w, 8.h, 8.w, 8.h),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0xfff1f3f5),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(56.r),
                                              ),
                                              child: Text(
                                                '주문 상태 변경',
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  decoration: ownerOrderController
                                                                          .currentFilterList[
                                                                      index]
                                                                  ['status'] ==
                                                              'REFUSE' ||
                                                          ownerOrderController
                                                                          .currentFilterList[
                                                                      index]
                                                                  ['status'] ==
                                                              'FINISHED'
                                                      ? TextDecoration
                                                          .lineThrough
                                                      : null,
                                                  fontFamily: 'NotoSansCJKKR',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  '주문 번호: ${ownerOrderController.currentFilterList[index]['orderNumber']}',
                                  style: TextStyle(
                                    color: Color(0xff8e97a0),
                                    fontSize: 12.sp,
                                    fontFamily: 'NotoSansCJKKR',
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  '주문자 닉네임: ${ownerOrderController.currentFilterList[index]['nickname']}',
                                  style: TextStyle(
                                    color: Color(0xff283137),
                                    fontSize: 14.sp,
                                    fontFamily: 'NotoSansCJKKR',
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Obx(
                                  () => ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: ownerOrderController
                                        .currentFilterList[index]['options']
                                            ['optionList']
                                        .length,
                                    itemBuilder: (context, optionIndex) =>
                                        Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${ownerOrderController.currentFilterList[index]['options']['optionList'][optionIndex]['title']}',
                                          style: TextStyle(
                                            color: Color(0xff283137),
                                            fontSize: 14.sp,
                                            fontFamily: 'NotoSansCJKKR',
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Obx(
                                          () => ListView.separated(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: ownerOrderController
                                                .currentFilterList[index]
                                                    ['options']['optionList']
                                                    [optionIndex]
                                                    ['optionDetailList']
                                                .length,
                                            itemBuilder:
                                                (context, optionDetailIndex) =>
                                                    Container(
                                              child: Text(
                                                '- ${ownerOrderController.currentFilterList[index]['options']['optionList'][optionIndex]['optionDetailList'][optionDetailIndex]['content']}',
                                                style: TextStyle(
                                                  color: Color(0xff283137),
                                                  fontSize: 13.sp,
                                                  fontFamily: 'NotoSansCJKKR',
                                                ),
                                              ),
                                            ),
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return SizedBox(
                                                height: 4.h,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Text(
                                    '픽업 예약 시간: ${ownerOrderController.currentFilterList[index]['pickUpReservation'].toString().split('T')[0]}  ${ownerOrderController.currentFilterList[index]['pickUpReservation'].toString().split('T')[1]}'),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  '가격: ${ownerOrderController.currentFilterList[index]['price']}',
                                  style: TextStyle(
                                    color: Color(0xff283137),
                                    fontSize: 18.sp,
                                    fontFamily: 'NotoSansCJKKR',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              color: Color(0xfff1f3f5),
                              thickness: 1.h,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
