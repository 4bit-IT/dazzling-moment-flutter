import 'package:damo/app/controller/owner/owner_order_controller.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShopOrderManagement extends StatelessWidget {
  ScrollController scrollController = ScrollController();
  OwnerOrderController orderController = Get.find();

  Map orderStatus = <String, String>{
    'PENDING': '판매자 확인 중',
    'ALLOW': '주문 수락',
    'REFUSE': '주문 거절',
    'COMPLETE': '제작 완료',
    'FINISHED': '거래 완료',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamoAppBar().textAppBar(context, '주문 관리'),
      body: Scrollbar(
        thickness: 8.w,
        radius: Radius.circular(8.r),
        child: Obx(
          () => ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            controller: scrollController,
            itemCount:
                orderController.ownerGetOrderModel.value.orderList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.fromLTRB(24.w, 16.h, 12.w, 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${orderStatus[orderController.ownerGetOrderModel.value.orderList[index]['status']]}',
                          style: TextStyle(
                            color: Color(0xfff93f5b),
                            fontSize: 12.sp,
                            height: 1,
                            fontFamily: 'NotoSansCJKKR',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        /*orderStatus[orderController.ownerGetOrderModel.value.orderList[index]['status']] == '주문 거절'||
                              orderStatus[orderController.ownerGetOrderModel.value.orderList[index]['status']] == '거래 완료'
                              ? Container()
                              : */
                        InkWell(
                          onTap: () {
                            if (!(orderController.ownerGetOrderModel.value
                                        .orderList[index]['status'] ==
                                    'REFUSE' ||
                                orderController.ownerGetOrderModel.value
                                        .orderList[index]['status'] ==
                                    'FINISHED'))
                              orderController.changeOrderStatusClicked(index);
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 8.h),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xfff1f3f5),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(56.r),
                            ),
                            child: Text(
                              '주문 상태 변경',
                              style: TextStyle(
                                fontSize: 12.sp,
                                height: 1,
                                decoration: orderController
                                                .ownerGetOrderModel
                                                .value
                                                .orderList[index]['status'] ==
                                            'REFUSE' ||
                                        orderController.ownerGetOrderModel.value
                                                .orderList[index]['status'] ==
                                            'FINISHED'
                                    ? TextDecoration.lineThrough
                                    : null,
                                fontFamily: 'NotoSansCJKKR',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      '주문 번호: ${orderController.ownerGetOrderModel.value.orderList[index]['orderNumber']}',
                      style: TextStyle(
                        color: Color(0xff8e97a0),
                        fontSize: 12.sp,
                        height: 1,
                        fontFamily: 'NotoSansCJKKR',
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      '주문자 닉네임: ${orderController.ownerGetOrderModel.value.orderList[index]['nickname']}',
                      style: TextStyle(
                        color: Color(0xff283137),
                        fontSize: 14.sp,
                        height: 1,
                        fontFamily: 'NotoSansCJKKR',
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    ListView.builder(
                      controller: scrollController,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: orderController.ownerGetOrderModel.value
                          .orderList[index]['options']['optionList'].length,
                      itemBuilder: (context, optionIndex) => Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${orderController.ownerGetOrderModel.value.orderList[index]['options']['optionList'][optionIndex]['title']}',
                              style: TextStyle(
                                color: Color(0xff283137),
                                fontSize: 14.sp,
                                height: 1,
                                fontFamily: 'NotoSansCJKKR',
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Container(
                              child: ListView.separated(
                                controller: scrollController,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: orderController
                                    .ownerGetOrderModel
                                    .value
                                    .orderList[index]['options']['optionList']
                                        [optionIndex]['optionDetailList']
                                    .length,
                                itemBuilder: (context, optionDetailIndex) =>
                                    Container(
                                  child: Text(
                                    '- ${orderController.ownerGetOrderModel.value.orderList[index]['options']['optionList'][optionIndex]['optionDetailList'][optionDetailIndex]['content']}',
                                    style: TextStyle(
                                      color: Color(0xff283137),
                                      fontSize: 13.sp,
                                      height: 1,
                                      fontFamily: 'NotoSansCJKKR',
                                    ),
                                  ),
                                ),
                                separatorBuilder:
                                    (BuildContext context, int index) {
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
                      '픽업 예약 시간: ${orderController.ownerGetOrderModel.value.orderList[index]['pickUpReservation'].toString().split('T')[0]}  ${orderController.ownerGetOrderModel.value.orderList[index]['pickUpReservation'].toString().split('T')[1]}'
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      '가격: ${orderController.ownerGetOrderModel.value.orderList[index]['price']}',
                      style: TextStyle(
                        color: Color(0xff283137),
                        fontSize: 18.sp,
                        fontFamily: 'NotoSansCJKKR',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Color(0xfff1f3f5),
                thickness: 1.h,
                height: 0,
              );
            },
          ),
        ),
      ),
    );
  }
}
