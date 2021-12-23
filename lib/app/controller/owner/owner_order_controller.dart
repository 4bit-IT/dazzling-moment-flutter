import 'package:damo/app/data/model/owner/owner_order_model.dart';
import 'package:damo/app/data/provider/order_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OwnerOrderController extends GetxController {
  Rx<OwnerGetOrderModel> ownerGetOrderModel = OwnerGetOrderModel().obs;

  Map<String, dynamic> toJsonInput = {};
  String sendData = '';
  var jsonResponse;
  var model;

  Future<void> fetchShopOrderData() async {
    jsonResponse = await OrderNetwork().getOrdersOwner();
    model = OwnerGetOrderModel.fromJson(jsonResponse);

    if (model.code == 1) {
      ownerGetOrderModel.update((val) {
        val!.code = model.code;
        val.orderList = model.orderList;
        val.description = model.description;
        val.result = model.result;
      });
      print(ownerGetOrderModel.value.orderList.length);
    } else if (model.code == 2) {
    } else {
      //토큰 만료
    }
  }

  void changeOrderStatusClicked(int index) {
    String status = ownerGetOrderModel.value.orderList[index]['status'];
    if (status == 'PENDING') {
      Get.bottomSheet(
        Container(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Color(0xfff93f5b),
                padding: EdgeInsets.fromLTRB(0, 20.h, 0, 20.h),
                child: Text(
                  '주문 상태 변경',
                  style: TextStyle(
                    fontFamily: 'NotoSansCJKKR',
                    fontSize: 28.sp,
                    height: 1,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
              ),
              InkWell(
                onTap: () async {
                  await Get.dialog(
                    Dialog(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                        alignment: Alignment.center,
                        height: 210.h,
                        width: 130.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                              child: Text(
                                '해당 주문의 주문상태를 \'주문수락\'으로 변경하시겠습니까?',
                                style: TextStyle(
                                    color: Color(0xff283137),
                                    fontFamily: 'NotoSansCJKKR',
                                    fontSize: 22.sp,
                                    height: 1,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              height: 32.h,
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
                                    child: Text(
                                      '아니오',
                                      style: TextStyle(
                                          color: Color(0xff283137),
                                          fontFamily: 'NotoSansCJKKR',
                                          fontSize: 16.sp,
                                          height: 1,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    await changeOrderStatus(index, 'ALLOW');
                                    Get.back();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                                    child: Text(
                                      '예',
                                      style: TextStyle(
                                          color: Color(0xff283137),
                                          fontFamily: 'NotoSansCJKKR',
                                          fontSize: 16.sp,
                                          height: 1,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(0, 19.h, 0, 19.h),
                  child: Text(
                    '주문 수락',
                    style: TextStyle(
                      color: Color(0xff283137),
                      fontFamily: 'NotoSansCJKKR',
                      fontSize: 20.sp,
                      height: 1,
                    ),
                  ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
              ),
              InkWell(
                onTap: () async {
                  await Get.dialog(
                    Dialog(
                      child: Container(
                        height: 210.h,
                        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                              child: Text(
                                '해당 주문의 주문상태를 \n주문거절\n로 변경하시겠습니까?',
                                style: TextStyle(
                                    color: Color(0xff283137),
                                    fontFamily: 'NotoSansCJKKR',
                                    fontSize: 22.sp,
                                    height: 1,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              height: 32.h,
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
                                    child: Text(
                                      '아니오',
                                      style: TextStyle(
                                          color: Color(0xff283137),
                                          fontFamily: 'NotoSansCJKKR',
                                          fontSize: 16.sp,
                                          height: 1,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    await changeOrderStatus(index, 'REFUSE');
                                    Get.back();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                                    child: Text(
                                      '예',
                                      style: TextStyle(
                                          color: Color(0xff283137),
                                          fontFamily: 'NotoSansCJKKR',
                                          fontSize: 16.sp,
                                          height: 1,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(0, 19.h, 0, 19.h),
                  child: Text(
                    '주문 거절',
                    style: TextStyle(
                      color: Color(0xff283137),
                      fontFamily: 'NotoSansCJKKR',
                      fontSize: 20.sp,
                      height: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      );
    } else if (status == 'ALLOW') {
      Get.bottomSheet(
        Container(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Color(0xfff93f5b),
                padding: EdgeInsets.fromLTRB(0, 20.h, 0, 20.h),
                child: Text(
                  '주문 상태 변경',
                  style: TextStyle(
                    fontFamily: 'NotoSansCJKKR',
                    fontSize: 28.sp,
                    height: 1,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
              ),
              InkWell(
                onTap: () async {
                  await Get.dialog(
                    Dialog(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                        alignment: Alignment.center,
                        height: 210.h,
                        width: 130.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                              child: Text(
                                '해당 주문의 주문상태를 \'제작완료\'로 변경하시겠습니까?',
                                style: TextStyle(
                                    color: Color(0xff283137),
                                    fontFamily: 'NotoSansCJKKR',
                                    fontSize: 22.sp,
                                    height: 1,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              height: 32.h,
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
                                    child: Text(
                                      '아니오',
                                      style: TextStyle(
                                          color: Color(0xff283137),
                                          fontFamily: 'NotoSansCJKKR',
                                          fontSize: 16.sp,
                                          height: 1,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    await changeOrderStatus(index, 'COMPLETE');
                                    Get.back();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                                    child: Text(
                                      '예',
                                      style: TextStyle(
                                          color: Color(0xff283137),
                                          fontFamily: 'NotoSansCJKKR',
                                          fontSize: 16.sp,
                                          height: 1,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(0, 19.h, 0, 19.h),
                  child: Text(
                    '제작 완료',
                    style: TextStyle(
                      color: Color(0xff283137),
                      fontFamily: 'NotoSansCJKKR',
                      fontSize: 20.sp,
                      height: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      );
    } else if (status == 'COMPLETE') {
      Get.bottomSheet(
        Container(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Color(0xfff93f5b),
                padding: EdgeInsets.fromLTRB(0, 20.h, 0, 20.h),
                child: Text(
                  '주문 상태 변경',
                  style: TextStyle(
                    fontFamily: 'NotoSansCJKKR',
                    fontSize: 28.sp,
                    height: 1,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
              ),
              InkWell(
                onTap: () async {
                  await Get.dialog(
                    Dialog(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                        alignment: Alignment.center,
                        height: 210.h,
                        width: 130.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                              child: Text(
                                '해당 주문의 주문상태를 \'거래완료\'로 변경하시겠습니까?',
                                style: TextStyle(
                                    color: Color(0xff283137),
                                    fontFamily: 'NotoSansCJKKR',
                                    fontSize: 22.sp,
                                    height: 1,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              height: 32.h,
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
                                    child: Text(
                                      '아니오',
                                      style: TextStyle(
                                          color: Color(0xff283137),
                                          fontFamily: 'NotoSansCJKKR',
                                          fontSize: 16.sp,
                                          height: 1,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    await changeOrderStatus(index, 'FINISHED');
                                    Get.back();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                                    child: Text(
                                      '예',
                                      style: TextStyle(
                                          color: Color(0xff283137),
                                          fontFamily: 'NotoSansCJKKR',
                                          fontSize: 16.sp,
                                          height: 1,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(0, 19.h, 0, 19.h),
                  child: Text(
                    '거래 완료',
                    style: TextStyle(
                      color: Color(0xff283137),
                      fontFamily: 'NotoSansCJKKR',
                      fontSize: 20.sp,
                      height: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      );
    }
  }

  Future<void> changeOrderStatus(int index, String status) async {
    toJsonInput.clear();
    toJsonInput['orderNumber'] = ownerGetOrderModel.value.orderList[index]['orderNumber'];
    toJsonInput['orderStatus'] = status;
    sendData = OwnerChangeOrderStatusModel().toJson(toJsonInput);
    jsonResponse = await OrderNetwork().postOrdersStatus(sendData);
    model = OwnerChangeOrderStatusModel.fromJson(jsonResponse);

    if(model.code == 1) {
      ownerGetOrderModel.update((val) {
        val!.orderList[index]['status'] = status;
      });
      Get.back();
    }
  }
}

class OrderBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    // TODO: implement dependencies
    Get.put<OwnerOrderController>(OwnerOrderController(), permanent: true);
  }
}
