import 'dart:convert';
import 'package:damo/app/controller/shop_controller.dart';
import 'package:damo/app/controller/shop_faq_controller.dart';
import 'package:get/get.dart';

ShopFAQController shopFAQController = Get.find();
ShopController shopController = Get.find();

class ShopGetFAQtoUserModel {
  int? code; //"성공은 1 or 실패는 2 or 토큰 만료는 3",
  dynamic faqList;
  String? description; //"성공 or 에러 메세지 or 토큰이 만료되었습니다.",
  bool? result; //true

  ShopGetFAQtoUserModel({code, faqList, description, result});

  ShopGetFAQtoUserModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    faqList = json['data']['faqList'];
    description = json['description'];
    result = json['result'];
  }
}