import 'package:damo/app/data/model/owner/owner_business_hour_model.dart';
import 'package:damo/app/data/provider/owner/owner_business_hour_api.dart';
import 'package:damo/viewmodel/get_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../view/shop/shop_order/shop_order_calendar_management.dart';

class OwnerOrderDayController extends GetxController {
  Rx<bool> isLoadingData = false.obs;
  Rx<bool> isLoadingDetailData = false.obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<TextEditingController> minimumPickUpDate =
      TextEditingController(text: '0').obs;
  RxList<List<AvailablePickupTimeModel>> dayTime =
      <List<AvailablePickupTimeModel>>[].obs;
  RxList<DetailTimeModel> detailTime = <DetailTimeModel>[].obs;
  Map<DateTime, List<DetailTimeModel>> event =
      <DateTime, List<DetailTimeModel>>{}.obs;
  RxInt selectedStartTime = 0.obs;
  RxInt selectedEndTime = 0.obs;
  RxBool selectedHoliday = false.obs;
  RxList<Map<DateTime, DetailTimeModel>> changedTimes =
      <Map<DateTime, DetailTimeModel>>[].obs;
  List<int> timeList = [for (var i = 0; i <= 23; i++) i];
  RxList<bool> isClickedDayTime = <bool>[for (int i = 0; i < 7; i++) false].obs;
  RxInt firstStart = (-1).obs;
  RxInt firstEnd = (-1).obs;
  RxInt secondStart = (-1).obs;
  RxInt secondEnd = (-1).obs;

  String sendData = '';
  var jsonResponse;
  var model;
  Map<String, dynamic> toJsonInput = {};

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await fetchBusinessHourData();
  }

  Future<void> fetchBusinessHourData() async {
    isLoadingData.value = true;
    jsonResponse = await OwnerBusinessHourNetwork().getBusinessHourDefault();
    model = OwnerGetDefaultBusinessHourModel.fromJson(jsonResponse);
    if (model.code == 1) {
      minimumPickUpDate.value.text = model.data['minNeedDate'].toString();
      for (int i = 0; i < 7; i++) {
        dayTime.add([]);
        for (int j = 0; j < model.data['businessHourList'][i].length; j++) {
          dayTime[i].add(AvailablePickupTimeModel(
              startTime: model.data['businessHourList'][i]['startTime'],
              endTime: model.data['businessHourList'][i]['endTime'],
              isHoliday: model.data['businessHourList'][i]['isHoliday']));
        }
      }
    } else if (model.code == 2) {
    } else {
      print('토큰 만료, 재발급');
      await tokenController.refreshGetAccessToken();
      await fetchBusinessHourData();
    }
    isLoadingData.value = false;
  }

  Future<void> setBusinessHourDefault() async {
    /*for (int i = 0; i < 7; i++) {
      if (checkAvailableTime(dayTime[i].startTime!, dayTime[i].endTime!, dayTime[i].isHoliday!)) {
        GetDialog().simpleDialog('종료시간을 시간시간 이후로 설정해주세요. 단, 종료시간만 0시 인 경우 제외');
        return;
      }
    }*/
    toJsonInput.clear();
    toJsonInput['minNeedDate'] = int.parse(minimumPickUpDate.value.value.text);
    List temp = [];
    /*for (int i = 0; i < 7; i++) {
      temp.add({'endTime': dayTime[i].endTime, 'startTime': dayTime[i].startTime, 'isHoliday': dayTime[i].isHoliday});
    }*/
    toJsonInput['businessHourList'] = temp;
    print('tojsoninput $toJsonInput');
    jsonResponse = await OwnerBusinessHourNetwork().postBusinesshourDefault(
        OwnerPostDefaultBusinessHour().toJson(toJsonInput));
    model = OwnerPostDefaultBusinessHour.fromJson(jsonResponse);
    if (model.code == 1) {
      await loadingDetailBusinessHour(
          DateTime.now().year, DateTime.now().month);
      Get.to(() => ShopOrderCalendarManagement());
    } else if (model.code == 2) {
    } else {
      print("토큰 만료, 재발급");
      await tokenController.refreshGetAccessToken();
      await setBusinessHourDefault();
    }
  }

  bool checkAvailableTime(int startTime, int endTime, bool isHoliday) {
    if (isHoliday)
      return true;
    else if (startTime == 0 && endTime == 0 && !isHoliday)
      return false;
    else
      return !(endTime != 0 && endTime <= startTime);
  }

  Future<void> loadingDetailBusinessHour(int year, int month) async {
    isLoadingDetailData.value = true;
    jsonResponse =
    await OwnerBusinessHourNetwork().getBusinessHour(year, month);
    model = OwnerGetDetailBusinessHourModel.fromJson(jsonResponse);
    if (model.code == 1) {
      event.clear();
      for (Map<String, dynamic> i
      in model.data['specificDayBusinessHourList']) {
        event.addAll({
          DateTime.utc(
              int.parse(i['date'].split('-')[0]),
              int.parse(i['date'].split('-')[1]),
              int.parse(i['date'].split('-')[2])): [
            DetailTimeModel(
                dateTime: DateTime.parse(i['date']),
                startTime: i['businessHour']['startTime'],
                endTime: i['businessHour']['endTime'],
                isHoliday: i['businessHour']['isHoliday'])
          ]
        });
      }
      isLoadingDetailData.value = false;
    } else if (model.code == 2) {
    } else {
      print('토큰 만료, 재발급');
      await tokenController.refreshGetAccessToken();
      await loadingDetailBusinessHour(year, month);
    }
  }

  Future<void> setDetailBusinessHour() async {
    toJsonInput.clear();
    toJsonInput['businessHour'] = {
      'startTime': selectedStartTime.value,
      'endTime': selectedEndTime.value,
      'isHoliday': selectedHoliday.value,
    };
    toJsonInput['date'] = focusedDay.value.toString().split(' ')[0];
    jsonResponse = await OwnerBusinessHourNetwork().postBusinesshourDetails(
        OwnerPostDetailBusinessHourModel().toJson(toJsonInput));
    model = OwnerPostDetailBusinessHourModel.fromJson(jsonResponse);
    if (model.code == 1) {
      event.addAll({
        focusedDay.value: [
          DetailTimeModel(
              dateTime: focusedDay.value,
              startTime: selectedStartTime.value,
              endTime: selectedEndTime.value,
              isHoliday: selectedHoliday.value)
        ]
      });
      event.update(
          focusedDay.value,
              (value) => [
            DetailTimeModel(
                dateTime: focusedDay.value,
                startTime: selectedStartTime.value,
                endTime: selectedEndTime.value,
                isHoliday: selectedHoliday.value)
          ]);
    } else if (model.code == 2) {
    } else {
      await tokenController.refreshGetAccessToken();
      await setDetailBusinessHour();
    }
  }

  Future<void> updateDetailBusinessHour() async {
    toJsonInput.clear();
    toJsonInput['businessHour'] = {
      'startTime': selectedStartTime.value,
      'endTime': selectedEndTime.value,
      'isHoliday': selectedHoliday.value,
    };
    toJsonInput['date'] = focusedDay.value.toString().split(' ')[0];
    jsonResponse = await OwnerBusinessHourNetwork().putBusinesshourDetails(
        OwnerPutDetailBusinessHourModel().toJson(toJsonInput));
    model = OwnerPutDetailBusinessHourModel.fromJson(jsonResponse);
    if (model.code == 1) {
      event.update(
          focusedDay.value,
              (value) => [
            DetailTimeModel(
                dateTime: focusedDay.value,
                startTime: selectedStartTime.value,
                endTime: selectedEndTime.value,
                isHoliday: selectedHoliday.value)
          ]);
    } else if (model.code == 2) {
    } else {
      await tokenController.refreshGetAccessToken();
      await updateDetailBusinessHour();
    }
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
