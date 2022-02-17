import 'package:damo/app/controller/shop_controller.dart';
import 'package:damo/view/product/product_reservation.dart';
import 'package:damo/viewmodel/get_dialog.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final ShopController shopController = Get.find<ShopController>();
  Rx<DateTime> focusedDay = DateTime.now().obs;
  List<ShopOptionModel> option = <ShopOptionModel>[].obs;
  RxInt price = 0.obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await fetchOrderData();
  }

  Future<void> fetchOrderData() async {
    List<DetailModel> temp = <DetailModel>[];
    for (int i = 0;
        i < shopController.shopGetDetailModel.value.optionList.length;
        i++) {
      temp = <DetailModel>[];
      for (int j = 0;
          j <
              shopController.shopGetDetailModel.value
                  .optionList[i]['optionDetailList'].length;
          j++) {
        if (shopController.shopGetDetailModel.value.optionList[i]
                ['optionDetailList'][j]['allowMultipleChoices'] ==
            true) {
          temp.add(DetailModel(check: false, count: 0));
        } else {
          temp.add(DetailModel(check: false, count: 0));
        }
      }
      option.add(ShopOptionModel(detail: temp));
    }
  }

  void optionAddClicked(int index, int detailIndex) {
    if (option[index].detail![detailIndex].count! <
        shopController.shopGetDetailModel.value.optionList[index]
            ['optionDetailList'][detailIndex]['count']) {
      if (shopController.shopGetDetailModel.value.optionList[index]
              ['allowMultipleChoices'] ==
          false) {
        for (int i = 0;
            i <
                shopController.shopGetDetailModel.value
                    .optionList[index]['optionDetailList'].length;
            i++) {
          if (i != detailIndex) {
            if (option[index].detail![i].check == true) {
              option[index].detail![i].check = false;
              price.value -= shopController.shopGetDetailModel.value
                  .optionList[index]['optionDetailList'][i]['price'] as int;
              break;
            } else if (option[index].detail![i].count != 0 &&
                option[index].detail![i].count! > 0) {
              price.value -= shopController.shopGetDetailModel.value
                      .optionList[index]['optionDetailList'][i]['price'] *
                  option[index].detail![i].count as int;
              option[index].detail![i].count = 0;
              break;
            }
          }
        }
      }
      option[index].detail![detailIndex].count =
          option[index].detail![detailIndex].count! + 1;
      price.value += shopController.shopGetDetailModel.value.optionList[index]
          ['optionDetailList'][detailIndex]['price'] as int;
    }
  }

  void optionSubtractClicked(int index, int detailIndex) {
    if (option[index].detail![detailIndex].count! > 0) {
      option[index].detail![detailIndex].count =
          option[index].detail![detailIndex].count! - 1;
      price.value -= shopController.shopGetDetailModel.value.optionList[index]
          ['optionDetailList'][detailIndex]['price'] as int;
    }
  }

  void optionCheck(int index, int detailIndex, bool value) {
    if (shopController.shopGetDetailModel.value.optionList[index]
                ['allowMultipleChoices'] ==
            false &&
        option[index].detail![detailIndex].check == false) {
      for (int i = 0;
          i <
              shopController.shopGetDetailModel.value
                  .optionList[index]['optionDetailList'].length;
          i++) {
        if (i != detailIndex) {
          if (option[index].detail![i].check == true) {
            option[index].detail![i].check = false;
            price.value -= shopController.shopGetDetailModel.value
                .optionList[index]['optionDetailList'][i]['price'] as int;
            break;
          } else if (option[index].detail![i].count != 0) {
            print(shopController.shopGetDetailModel.value.optionList[index]
                    ['optionDetailList'][i]['price'] *
                option[index].detail![i].count);
            price.value -= shopController.shopGetDetailModel.value
                    .optionList[index]['optionDetailList'][i]['price'] *
                option[index].detail![i].count as int;
            option[index].detail![i].count = 0;
            break;
          }
        }
      }
    }
    option[index].detail![detailIndex].check = value;
    price.value += shopController.shopGetDetailModel.value.optionList[index]
        ['optionDetailList'][detailIndex]['price'] as int;
  }

  bool? selectDateClicked() {
    for (int i = 0; i < option.length; i++) {
      bool brk = true;
      for (int j = 0; j < option[i].detail!.length; j++) {
        if (option[i].detail![j].count != 0 ||
            option[i].detail![j].check == true) {
          brk = false;
          break;
        }
      }
      if (brk) {
        return brk;
      }
    }
    return false;
  }
}

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<OrderController>(OrderController());
  }
}

class ShopOptionModel {
  List<DetailModel>? detail;

  ShopOptionModel({this.detail});
}

class DetailModel {
  bool? check;
  int? count;

  DetailModel({this.check, this.count});
}
