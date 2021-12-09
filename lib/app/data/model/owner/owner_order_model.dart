import 'dart:convert';
import 'package:damo/app/controller/owner/owner_order_controller.dart';
import 'package:get/get.dart';

OwnerOrderController orderController = Get.find();

class OwnerGetOrderModel {
  int? code;
  List<dynamic> orderList = [];
  String? description;
  bool? result;

  OwnerGetOrderModel({code, orderList, description, result});

  OwnerGetOrderModel.fromJson(Map<String, dynamic> json) {
    print(json);
    code = json['code'];
    orderList = json['data']['orderList'];
    description = json['description'];
    result = json['result'];
  }
}

class OwnerChangeOrderStatusModel {
  int? code;
  String? description;
  bool? result;

  OwnerChangeOrderStatusModel({code, description, result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {
      'orderNumber': input['orderNumber'],
      'orderStatus': input['orderStatus'],
    };
    body = json.encode(sendData);
    return body;
  }

  OwnerChangeOrderStatusModel.fromJson(Map<String, dynamic> json) {
    print(json);
    code = json['code'];
    description = json['description'];
    result = json['result'];
  }
}