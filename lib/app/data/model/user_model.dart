// class GetUserInfoModel {
//   late String code;
//   late String addr1;
//   late String addr2;
//   late String zipcode;
//   late String lastAgreeDateOfMarketing;
//   late String lastAgreeDateOfPushNotification;
//   late String lastAgreeDateOfServiceAndPersonalData;
//   late String marketing;
//   late String pushNotification;
//   late String serviceAndPersonalData;
//   late String ageRange;
//   late String agreements;
//   late String birth;
//   late String createdAt;
//   late String email;
//   late String id;
//   late String name;
//   late String nickname;
//   late String phoneNumber;
//   late String profileImage;
//   late String sex;
//   late String description;
//   late String result;
// }

import 'dart:convert';

class NicknameDoubleCheckModel {
  late int code;
  late bool data;
  late String description;
  late bool result;

  NicknameDoubleCheckModel({code, data, description, result});

  String toJson(Map<String, dynamic> input) {
    print(input);
    String body;
    Map sendData = {
      'nickname': input['nickname']
    };
    body = json.encode(sendData);
    return body;
  }

  NicknameDoubleCheckModel.fromJson(Map<String, dynamic> json) {
    print(json);
    print((json['code']).runtimeType);
    print(1);
    code = json['code'];
    print(code.runtimeType);
    data = json['data'];
    description = json['description'];
    result = json['result'];
  }
}