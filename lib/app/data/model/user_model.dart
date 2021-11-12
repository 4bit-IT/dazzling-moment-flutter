import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/app/data/model/user_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

class GetUserInfoModel {
  late String code;
  late String addr1;
  late String addr2;
  late String zipcode;
  late String lastAgreeDateOfMarketing;
  late String lastAgreeDateOfPushNotification;
  late String lastAgreeDateOfServiceAndPersonalData;
  late String marketing;
  late String pushNotification;
  late String serviceAndPersonalData;
  late String ageRange;
  late String agreements;
  late String birth;
  late String createdAt;
  late String email;
  late String id;
  late String name;
  late String nickname;
  late String phoneNumber;
  late String profileImage;
  late String sex;
  late String description;
  late String result;

  GetUserInfoModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    addr1 = json['data']['address'][0];
    addr2 = json['data']['address'][1];
    zipcode = json['data']['address'][2];
    ageRange = json['data']['ageRange'];
    lastAgreeDateOfMarketing = json['data']['agreements'][0];
    lastAgreeDateOfPushNotification = json['data']['agreements'][1];
    lastAgreeDateOfServiceAndPersonalData = json['data']['agreements'][2];
    marketing = json['data']['agreements'][3];
    pushNotification = json['data']['agreements'][4];
    serviceAndPersonalData = json['data']['agreements'][5];
    birth = json['data']['birth'];
    createdAt = json['data']['createdAt'];
    email = json['data']['email'];
    id = json['data']['id'];
    name = json['data']['name'];
    nickname = json['data']['nickname'];
    phoneNumber = json['data']['phoneNumber'];
    profileImage = json['data']['profileImages'];
    sex = json['data']['sex'];
    description = json['description'];
    result = json['result'];
  }
}

class UserChangeAddress {
  late String addr1;
  late String addr2;
  late String zipcode;
  UserChangeAddress({addr1, addr2, zipcode});

  String toJson() {
    String body;
    Map sendData = {'addr1': addr1, 'addr2': addr2, 'zipcode': zipcode};
    body = json.encode(sendData);
    return body;
  }
}
