// import 'dart:convert';
// import 'package:kakao_flutter_sdk/all.dart';

// class AuthSignModel {
//   late int code;
//   late String accessToken;
//   late String isFirst;
//   late String refreshToken;
//   late String description;
//   late String result;

//   AuthSignModel(
//       {code, accessToken, isFirst, refreshToken, description, result});

//   String toJson(AccessTokenResponse token) {
//     String body;
//     Map signUpData = {
//       'fcmToken': '',
//       'nickname': '안주형',
//       'oauthAccessToken': token.accessToken,
//       'phoneNumber': '010-5784-0360',
//       'pushNotificationAllowed': false,
//     };
//     body = json.encode(signUpData);
//     return body;
//   }

//   AuthSignModel.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     accessToken = json['data'][0];
//     isFirst = json['data'][1];
//     refreshToken = json['data'][2];
//     description = json['description'];
//     result = json['result'];
//   }
// }

// class AuthLoginModel {
//   late int code;
//   late String accessToken;
//   late String isFirst;
//   late String refreshToken;
//   late String description;
//   late String result;

//   AuthLoginModel({fcmToken, oauthAccessToken});
//   String toJson(AccessTokenResponse token) {
//     String body;
//     Map loginData = {
//       'fcmToken': '',
//       'oauthAccessToken': token.accessToken,
//     };
//     body = json.encode(loginData);
//     return body;
//   }

//   AuthLoginModel.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     accessToken = json['data'][0].toString();
//     isFirst = json['data'][1].toString();
//     refreshToken = json['data'][2].toString();
//     description = json['description'].toString();
//     result = json['result'].toString();
//   }
// }
