import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/app/data/model/owner/owner_order_model.dart';
import 'package:damo/app/data/provider/order_api.dart';
import 'package:damo/viewmodel/get_dialog.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OwnerOrderController extends GetxController {
  TokenController tokenController = Get.find();
  Rx<OwnerGetOrderModel> ownerGetOrderModel = OwnerGetOrderModel().obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  RxMap<DateTime, List<Map<String, dynamic>>> event =
      <DateTime, List<Map<String, dynamic>>>{}.obs;
  Map<String, dynamic> toJsonInput = {};
  RxBool isLoadingOrderData = false.obs;
  RxInt currentFilterIndex = 0.obs;
  RxInt maxStatusSize = 5.obs;
  RxList<Map<String, dynamic>> currentFilterList = <Map<String, dynamic>>[].obs;
  Rx<ScrollController> scrollController = ScrollController().obs;

  String sendData = '';
  var jsonResponse;
  var model;

  @override
  Future<void> onInit() async {
    super.onInit();
    // TODO: implement onInit
    await fetchShopOrderData();
  }

  Future<void> fetchShopOrderData() async {
    jsonResponse = await OrderNetwork().getOrdersOwner();
    model = OwnerGetOrderModel.fromJson(jsonResponse);

    if (model.code == 1) {
      isLoadingOrderData.value = true;
      ownerGetOrderModel.update((val) {
        val!.code = model.code;
        val.orderList = model.orderList;
        val.description = model.description;
        val.result = model.result;
      });
      for (var val in ownerGetOrderModel.value.orderList) {
        if (event[DateTime.utc(
            int.parse(val['pickUpReservation'].split('-')[0]),
            int.parse(val['pickUpReservation'].split('-')[1]),
            int.parse(
                val['pickUpReservation'].split('-')[2].split('T')[0]))] ==
            null) {
          event[DateTime.utc(
              int.parse(val['pickUpReservation'].split('-')[0]),
              int.parse(val['pickUpReservation'].split('-')[1]),
              int.parse(
                  val['pickUpReservation'].split('-')[2].split('T')[0]))] = [];
        }
        event[DateTime.utc(
            int.parse(val['pickUpReservation'].split('-')[0]),
            int.parse(val['pickUpReservation'].split('-')[1]),
            int.parse(
                val['pickUpReservation'].split('-')[2].split('T')[0]))]!
            .add(val);
      }
      isLoadingOrderData.value = false;
    } else if (model.code == 2) {
    } else {
      //토큰 만료
      await tokenController.refreshGetAccessToken();
      await fetchShopOrderData();
    }
  }

  void changeOrderStatusClicked(int index, String status) {
    if (status == 'PENDING') {
      Get.bottomSheet(
          Wrap(
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
                  GetDialog().alternativeDialog(
                      '해당 주문의 주문상태를 \n\'주문수락\'으로 변경하시겠습니까?',
                          () async => await changeOrderStatus(index, 'ALLOW'));
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
                  GetDialog().alternativeDialog(
                      '해당 주문의 주문상태를 \n\'주문거절\'로 변경하시겠습니까?',
                          () async => await changeOrderStatus(index, 'REFUSE'));
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
          backgroundColor: Colors.white);
    } else if (status == 'ALLOW') {
      Get.bottomSheet(
          Wrap(
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
                  GetDialog().alternativeDialog(
                      '해당 주문의 주문상태를 \n\'제작완료\'로 변경하시겠습니까?',
                          () async => await changeOrderStatus(index, 'COMPLETE'));
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
          backgroundColor: Colors.white);
    } else if (status == 'COMPLETE') {
      Get.bottomSheet(
          Wrap(
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
                  GetDialog().alternativeDialog(
                      '해당 주문의 주문상태를 \'거래완료\'로 변경하시겠습니까?',
                          () async => await changeOrderStatus(index, 'FINISHED'));
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
          backgroundColor: Colors.white);
    }
  }

  Future<void> changeOrderStatus(int index, String status) async {
    toJsonInput.clear();
    toJsonInput['orderNumber'] = currentFilterList[index]['orderNumber'];
    toJsonInput['orderStatus'] = status;
    sendData = OwnerChangeOrderStatusModel().toJson(toJsonInput);
    jsonResponse = await OrderNetwork().postOrdersStatus(sendData);
    model = OwnerChangeOrderStatusModel.fromJson(jsonResponse);

    if (model.code == 1) {
      ownerGetOrderModel.update((val) {
        val!.orderList[index]['status'] = status;
      });
      event[focusedDay.value]![index]['status'] = status;
      currentFilterList.removeAt(index);
      event[focusedDay.value]!.sort((a, b) {
        return a['orderNumber'].compareTo(b['orderNumber']);
      });
      event.refresh();
      currentFilterList.refresh();
      Get.back();
    } else if (model.code == 2) {
    } else {
      await tokenController.refreshGetAccessToken();
      await changeOrderStatus(index, status);
    }
  }

  void filterStatus(int index, String status) {
    currentFilterIndex.value = index;
    if (index == 0) {
      currentFilterList.value = event[focusedDay.value]!;
    } else {
      currentFilterList.value = event[focusedDay.value]!
          .where((element) => element['status'] == status)
          .toList();
    }
    currentFilterList.refresh();
    currentFilterIndex.refresh();
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      scrollController.value.animateTo(
          scrollController.value.position.minScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastLinearToSlowEaseIn);
    });
  }
}

class OwnerOrderBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<OwnerOrderController>(OwnerOrderController());
  }
}
