import 'dart:convert';
import 'package:damo/app/controller/shop_controller.dart';
import 'package:damo/app/controller/shop_faq_controller.dart';
import 'package:get/get.dart';

ShopFAQController shopFAQController = Get.find();
ShopController shopController = Get.find();

class ShopGetFAQModel {
  int? code;
  List<dynamic>? faqList;
  String? description;
  bool? result;

  ShopGetFAQModel({code, faqList, description, result});

  ShopGetFAQModel.fromJson(Map<String, dynamic> json) {
    print(json);
    code = json['code'];
    faqList = json['data']['faqList'];
    description = json['description'];
    result = json['result'];
  }
}

class ShopModifyFAQAnswerModel {
  int? code;
  String? answer;
  int? faqId;
  String? question;
  String? description;
  bool? result;

  ShopModifyFAQAnswerModel({code, answer, faqId, question, description, result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {
      'answer' : input['answer'],
      'faqId' : input['faqId'],
    };
    body = json.encode(sendData);
    return body;
  }

  ShopModifyFAQAnswerModel.fromJson(Map<String, dynamic> json) {
    print(json);
    code = json['code'];
    answer = json['data']['answer'];
    faqId = json['data']['faqId'];
    question = json['data']['question'];
    description = json['description'];
    result = json['result'];
  }
}

class ShopModifyFAQQuestionModel {
  int? code;
  String? answer;
  int? faqId;
  String? question;
  String? description;
  bool? result;

  ShopModifyFAQQuestionModel({code, answer, faqId, question, description, result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {
      'question' : input['question'],
      'faqId' : input['faqId'],
    };
    body = json.encode(sendData);
    return body;
  }

  ShopModifyFAQQuestionModel.fromJson(Map<String, dynamic> json) {
    print(json);
    code = json['code'];
    answer = json['data']['answer'];
    faqId = json['data']['faqId'];
    question = json['data']['question'];
    description = json['description'];
    result = json['result'];
  }
}

class ShopAddFAQModel {
  int? code;
  String? answer;
  int? faqId;
  String? question;
  String? description;
  bool? result;

  ShopAddFAQModel({code, answer, faqId, description, result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {
      'answer' : input['answer'],
      'question' : input['question'],
      'shopId' : shopController.shopGetMeModel.value.id,
    };
    body = json.encode(sendData);
    return body;
  }

  ShopAddFAQModel.fromJson(Map<String, dynamic> json) {
    print(json);
    code = json['code'];
    answer = json['data']['answer'];
    faqId = json['data']['faqId'];
    question = json['data']['question'];
    description = json['description'];
    result = json['result'];
  }
}

class ShopDeleteFAQModel {
  int? code;
  String? description;
  bool? result;

  ShopDeleteFAQModel({code, description, result});

  ShopDeleteFAQModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    result = json['result'];
  }
}