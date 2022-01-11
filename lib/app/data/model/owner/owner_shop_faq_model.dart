import 'dart:convert';
import 'package:damo/app/controller/owner/owner_shop_controller.dart';
import 'package:damo/app/controller/owner/owner_shop_faq_controller.dart';
import 'package:get/get.dart';

OwnerShopFAQController ownerShopFAQController = Get.find();
OwnerShopController ownerShopController = Get.find();

class OwnerShopGetFAQModel {
  int? code;
  List<dynamic>? faqList;
  String? description;
  bool? result;

  OwnerShopGetFAQModel({code, faqList, description, result});

  OwnerShopGetFAQModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    faqList = json['data']['faqList'];
    description = json['description'];
    result = json['result'];
  }
}

class OwnerShopModifyFAQAnswerModel {
  int? code;
  String? answer;
  int? faqId;
  String? question;
  String? description;
  bool? result;

  OwnerShopModifyFAQAnswerModel(
      {code, answer, faqId, question, description, result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {
      'answer': input['answer'],
      'faqId': input['faqId'],
    };
    body = json.encode(sendData);
    return body;
  }

  OwnerShopModifyFAQAnswerModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    answer = json['data']['answer'];
    faqId = json['data']['faqId'];
    question = json['data']['question'];
    description = json['description'];
    result = json['result'];
  }
}

class OwnerShopModifyFAQQuestionModel {
  int? code;
  String? answer;
  int? faqId;
  String? question;
  String? description;
  bool? result;

  OwnerShopModifyFAQQuestionModel(
      {code, answer, faqId, question, description, result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {
      'question': input['question'],
      'faqId': input['faqId'],
    };
    body = json.encode(sendData);
    return body;
  }

  OwnerShopModifyFAQQuestionModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    answer = json['data']['answer'];
    faqId = json['data']['faqId'];
    question = json['data']['question'];
    description = json['description'];
    result = json['result'];
  }
}

class OwnerShopAddFAQModel {
  int? code;
  String? answer;
  int? faqId;
  String? question;
  String? description;
  bool? result;

  OwnerShopAddFAQModel({code, answer, faqId, description, result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {
      'answer': input['answer'],
      'question': input['question'],
      'shopId': ownerShopController.shopGetMeModel.value.id,
    };
    body = json.encode(sendData);
    return body;
  }

  OwnerShopAddFAQModel.fromJson(Map<String, dynamic> json) {
    print(json);
    code = json['code'];
    answer = json['data']['answer'];
    faqId = json['data']['faqId'];
    question = json['data']['question'];
    description = json['description'];
    result = json['result'];
  }
}

class OwnerShopDeleteFAQModel {
  int? code;
  String? description;
  bool? result;

  OwnerShopDeleteFAQModel({code, description, result});

  OwnerShopDeleteFAQModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    result = json['result'];
  }
}
