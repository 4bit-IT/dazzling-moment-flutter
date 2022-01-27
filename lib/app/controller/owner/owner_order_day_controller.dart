import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OwnerOrderDayController extends GetxController {
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<TextEditingController> minimumPickUpDate = TextEditingController(text: '0').obs;
  RxList<AvailablePickupTimeModel> availablePickupTime = <AvailablePickupTimeModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    for (int i = 0; i < 7; i++) availablePickupTime.add(AvailablePickupTimeModel(startTime: 0, endTime: 0));
  }
}

class AvailablePickupTimeModel {
  int? startTime;
  int? endTime;

  AvailablePickupTimeModel({this.startTime, this.endTime});
}

class OwnerOrderDayBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<OwnerOrderDayController>(OwnerOrderDayController());
  }
}
