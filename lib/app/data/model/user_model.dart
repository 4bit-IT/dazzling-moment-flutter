import 'dart:convert';
import 'package:get/get.dart';

class GetUserInfoModel {
  int? code;
  String? addr1;
  String? addr2;
  String? zipcode;
  String? ageRange;
  String? lastAgreeDateOfMarketing;
  String? lastAgreeDateOfPushNotification;
  String? lastAgreeDateOfServiceAndPersonalData;
  bool? marketing;
  bool? pushNotification;
  bool? serviceAndPersonalData;
  String? birth;
  String? createdAt;
  String? email;
  int? id;
  bool? isOwner;
  String? name;
  String? nickname;
  String? phoneNumber;
  String? profileImage;
  String? sex;
  String? description;
  bool? result;

  GetUserInfoModel(
      {code,
      addr1,
      addr2,
      zipcode,
      ageRange,
      lastAgreeDateOfMarketing,
      lastAgreeDateOfPushNotification,
      lateAgreeDateOfServiceAndPersonalData,
      marketing,
      pushNotification,
      serviceAndPersonalData,
      birth,
      createdAt,
      email,
      id,
        isOwner,
      name,
      nickname,
      phoneNumber,
      profileImage,
      sex,
      description,
      result});

  GetUserInfoModel.fromJson(Map<String, dynamic> json) {
    print(json);
    code = json['code'];
    addr1 = json['data']['address']['addr1'];
    addr2 = json['data']['address']['addr2'];
    zipcode = json['data']['address']['zipcode'];
    ageRange = json['data']['ageRange'];
    lastAgreeDateOfMarketing =
        json['data']['agreements']['lastAgreeDateOfMarketing'];
    lastAgreeDateOfPushNotification =
        json['data']['agreements']['lastAgreeDateOfPushNotification'];
    lastAgreeDateOfServiceAndPersonalData =
        json['data']['agreements']['lastAgreeDateOfServiceAndPersonalData'];
    marketing = json['data']['agreements']['marketing'];
    pushNotification = json['data']['agreements']['pushNotification'];
    serviceAndPersonalData =
        json['data']['agreements']['serviceAndPersonalData'];
    birth = json['data']['birth'];
    createdAt = json['data']['createdAt'];
    email = json['data']['email'];
    id = json['data']['id'];
    isOwner = json['data']['isOwner'];
    name = json['data']['name'];
    nickname = json['data']['nickname'];
    phoneNumber = json['data']['phoneNumber'];
    profileImage = json['data']['profileImage'];
    sex = json['data']['sex'];
    description = json['description'];
    result = json['result'];
  }
}

class AccessTokenAvailableCheckModel {
  int? code;
  bool? data;
  String? description;
  bool? result;

  AccessTokenAvailableCheckModel({code, data, description, result});

  AccessTokenAvailableCheckModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
    description = json['description'];
    result = json['result'];
  }
}

class ChangeAddressModel {
  int? code;
  String? description;
  bool? result;

  ChangeAddressModel({code, description, result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {
      'addr1': input['addr1'].toString(),
      'addr2': input['addr2'].toString(),
      'zipcode': int.parse(input['zipcode'])
    };
    body = json.encode(sendData);
    return body;
  }

  ChangeAddressModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    result = json['result'];
  }
}

class NicknameDoubleCheckModel {
  int? code;
  bool? data;
  String? description;
  bool? result;

  NicknameDoubleCheckModel({code, data, description, result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {'nickname': input['nickname']};
    body = json.encode(sendData);
    return body;
  }

  NicknameDoubleCheckModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
    description = json['description'];
    result = json['result'];
  }
}

class CheckOwnerModel {
  int? code;
  bool? data;
  String? description;
  bool? result;

  CheckOwnerModel({code, data, description, result});

  CheckOwnerModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
    description = json['description'];
    result = json['result'];
  }
}

class UserPhoneNumberModel {
  int? code;
  String? description;
  bool? result;

  UserPhoneNumberModel({code, description, result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {'phoneNumber': input['phoneNumber'].toString()};
    body = json.encode(sendData);
    return body;
  }

  UserPhoneNumberModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    result = json['result'];
  }
}

class ChangeProfileImageModel {
  int? code;
  String? imageUrl;
  String? description;
  bool? result;

  ChangeProfileImageModel({code, imageUrl, description, result});

  //String toJson

  ChangeProfileImageModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    imageUrl = json['data']['imageUrl'];
    description = json['description'];
    result = json['result'];
  }
}

class ChangeDefaultProfileImageModel {
  int? code;
  String? imageUrl;
  String? description;
  bool? result;

  ChangeDefaultProfileImageModel({code, imageUrl, description, result});

  ChangeDefaultProfileImageModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    imageUrl = json['data']['imageUrl'];
    description = json['description'];
    result = json['result'];
  }
}

class RefreshAccessTokenModel {
  int? code;
  String? data;
  String? description;
  bool? result;

  RefreshAccessTokenModel({code, data, description, result});

  RefreshAccessTokenModel.fromJson(Map<String, dynamic> json) {
    print(json);
    code = json['code'];
    data = json['data'];
    description = json['description'];
    result = json['result'];
  }
}
