import 'dart:convert';
import 'package:kakao_flutter_sdk/all.dart';

class AuthSignModel {
  late int code;
  late String accessToken;
  late bool isFirst;
  late String refreshToken;
  late String description;
  late bool result;

  AuthSignModel(
      {code, accessToken, isFirst, refreshToken, description, result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map signUpData = {
      'agreements': {
        'marketing': input['agreements']['marketing'],
        'pushNotification': input['agreements']['pushNotification']
      },
      'fcmToken': '',
      'nickname': input['nickname'],
      'oauthAccessToken': input['oauthAccessToken'],
      'phoneNumber': input['phoneNumber']
    };
    body = json.encode(signUpData);
    return body;
  }

  AuthSignModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    accessToken = json['data']['accessToken'];
    isFirst = json['data']['isFirst'];
    refreshToken = json['data']['refreshToken'];
    description = json['description'];
    result = json['result'];
  }
}

class AuthLoginModel {
  late int code;
  late String accessToken;
  late bool isFirst;
  late String refreshToken;
  late String description;
  late bool result;

  AuthLoginModel(
      {code, accessToken, isFirst, refreshToken, description, result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {
      'fcmToken': '',
      'oauthAccessToken': input['oauthAccessToken'],
    };
    body = json.encode(sendData);
    return body;
  }

  AuthLoginModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    accessToken = json['data']['accessToken'];
    isFirst = json['data']['isFirst'];
    refreshToken = json['data']['refreshToken'];
    description = json['description'];
    result = json['result'];
  }
}
