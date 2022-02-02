import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OwnerOrderDayController extends GetxController {
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<TextEditingController> minimumPickUpDate =
      TextEditingController(text: '0').obs;
  RxList<AvailablePickupTimeModel> dayTime = <AvailablePickupTimeModel>[].obs;
  RxList<DetailTimeModel> detailTime = <DetailTimeModel>[].obs;
  RxMap<DateTime, List<DetailTimeModel>> event = <DateTime, List<DetailTimeModel>>{}.obs;
  RxInt selectedStartTime = 0.obs;
  RxInt selectedEndTime = 0.obs;
  RxBool selectedHoliday = false.obs;
  RxList<Map<DateTime, DetailTimeModel>> changedTimes =
      <Map<DateTime, DetailTimeModel>>[].obs;
  List<int> timeList = [for (var i = 0; i <= 23; i++) i];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    for (int i = 0; i < 7; i++) //api 호출부
      dayTime.add(AvailablePickupTimeModel(startTime: 0, endTime: 0, isHoliday: false));
  }
}

class AvailablePickupTimeModel {
  int? startTime;
  int? endTime;
  bool? isHoliday;

  AvailablePickupTimeModel({this.startTime, this.endTime, this.isHoliday});
}

class DetailTimeModel {
  DateTime? dateTime;
  int? startTime;
  int? endTime;
  bool? isHoliday;

  DetailTimeModel(
      {this.dateTime, this.startTime, this.endTime, this.isHoliday});
}

class OwnerOrderDayBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<OwnerOrderDayController>(OwnerOrderDayController());
  }
}
