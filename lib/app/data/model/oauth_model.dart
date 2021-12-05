import 'dart:convert';

class AuthSignModel {
  int? code;
  String? accessToken;
  bool? isFirst;
  String? refreshToken;
  String? description;
  bool? result;

  AuthSignModel(
      {code, accessToken, isFirst, refreshToken, description, result});

  String toJson(Map<String, dynamic> toJsonInput) {
    String body;
    Map signUpData = {
      'agreements': {
        'marketing': toJsonInput['marketing'],
        'pushNotification': toJsonInput['pushNotification']
      },
      'fcmToken': '',
      'nickname': toJsonInput['nickname'],
      'oauthAccessToken': toJsonInput['oauthAccessToken'],
      'phoneNumber': toJsonInput['phoneNumber']
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
  int? code;
  String? accessToken;
  bool? isFirst;
  String? refreshToken;
  String? description;
  bool? result;

  AuthLoginModel(
      {code, accessToken, isFirst, refreshToken, description, result});

  String toJson(Map<String, dynamic> toJsonInput) {
    String body;
    Map sendData = {
      'fcmToken': '',
      'oauthAccessToken': toJsonInput['oauthAccessToken'],
    };
    body = json.encode(sendData);
    return body;
  }

  AuthLoginModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    accessToken = json['data']['accessToken'].toString();
    isFirst = json['data']['isFirst'];
    refreshToken = json['data']['refreshToken'].toString();
    description = json['description'];
    result = json['result'];
  }
}
