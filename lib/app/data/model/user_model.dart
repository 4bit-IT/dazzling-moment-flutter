import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:kakao_flutter_sdk/all.dart';

class GetUserInfoModel {
  int? code; //example: 성공은 1 or 실패는 2 or 토큰 만료는 3
  String? addr1; //example: 서울특별시 금천구 가산디지털1로 5
  String? addr2; //example: 807호
  String? zipcode; //example: 12345
  String? ageRange; //example: 20~29
  String? lastAgreeDateOfMarketing; //$date
  String? lastAgreeDateOfPushNotification; //$date
  String? lastAgreeDateOfServiceAndPersonalData; //date
  bool? marketing; //example: true
  bool? pushNotification; //example: true
  bool? serviceAndPersonalData; //example: true
  String? birth; //example: MMDD
  String? createdAt; //example: 2021-10-28
  String? email; //example: example@damo.com
  bool? hasAdditionalInformation;
  int? id; //example: 1
  bool? isOwner; //example: false
  String? name; //example: 황진성
  String? nickname; //example: jeeensong
  String? phoneNumber; //example: 010-0000-0000
  String?
      profileImage; //example: https://damo-s3.s3.ap-northeast-2.amazonaws.com/~~~
  String? sex; //example: MALE
  String? provider; // example: "APPLE"
  String? description; //example: 성공 or 에러 메세지 or 토큰이 만료되었습니다.
  bool? result; //example: true

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
      hasAdditionalInformation,
      id,
      isOwner,
      name,
      nickname,
      phoneNumber,
      profileImage,
      sex,
      provider,
      description,
      result});

  GetUserInfoModel.fromJson(Map<String, dynamic> json) {
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
    hasAdditionalInformation = json['data']['hasAdditionalInformation'];
    id = json['data']['id'];
    isOwner = json['data']['isOwner'];
    name = json['data']['name'];
    nickname = json['data']['nickname'];
    phoneNumber = json['data']['phoneNumber'];
    profileImage = json['data']['profileImage'];
    sex = json['data']['sex'];
    provider = json['data']['provider'];
    description = json['description'];
    result = json['result'];
  }
}

class AccessTokenAvailableCheckModel {
  int? code; //example: 성공은 1 or 실패는 2 or 토큰 만료는 3
  bool? data; //boolean
  String? description; //example: 성공 or 에러 메세지 or 토큰이 만료되었습니다.
  bool? result; //example: true

  AccessTokenAvailableCheckModel({code, data, description, result});

  AccessTokenAvailableCheckModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
    description = json['description'];
    result = json['result'];
  }
}

class ChangeAddressModel {
  int? code; //example: 성공은 1 or 실패는 2 or 토큰 만료는 3
  String? description; //example: 성공 or 에러 메세지 or 토큰이 만료되었습니다.
  bool? result; //example: true

  ChangeAddressModel({code, description, result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {
      'addr1': input['addr1'].toString(),
      'addr2': input['addr2'].toString(),
      'zipcode': input['zipcode']
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
  int? code; //example: 성공은 1 or 실패는 2 or 토큰 만료는 3
  String? imageUrl; //example: https://damo-s3.exmaple.amazonaws.com/12345.png
  String? description; //example: 성공 or 에러 메세지 or 토큰이 만료되었습니다.
  bool? result; //example: true

  ChangeProfileImageModel({code, imageUrl, description, result});

  dynamic toJson(dynamic input) async {
    var formData = FormData.fromMap(
      {'image': await MultipartFile.fromFile(input)},
    );
    return formData;
  }

  ChangeProfileImageModel.fromJson(dynamic json) {
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

  ChangeDefaultProfileImageModel.fromJson(var json) {
    code = json['code'];
    imageUrl = json['data']['imageUrl'];
    description = json['description'];
    result = json['result'];
  }
}

class RefreshAccessTokenModel {
  int? code; //example: 성공은 1 or 실패는 2 or 토큰 만료는
  String? data;
  String? description; //example: 성공 or 에러 메세지 or 토큰이 만료되었습니다.
  bool? result; //example: true

  RefreshAccessTokenModel({code, data, description, result});

  RefreshAccessTokenModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
    description = json['description'];
    result = json['result'];
  }
}

class UpdateAppleUserInfo {
  String? ageRange;
  String? birth;
  String? name;
  String? nickname;
  String? phoneNumber;
  String? sex;
  int? code;
  String? description;
  bool? result;

  UpdateAppleUserInfo({ageRange, birth, name, nickname, phoneNumber, sex});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {
      'ageRange': input['ageRange'],
      'birth': input['birth'].toString(),
      'name': input['name'].toString(),
      'nickname': input['nickname'].toString(),
      'phoneNumber': input['phoneNumber'].toString(),
      'sex': input['sex'],
    };
    body = json.encode(sendData);
    return body;
  }

  UpdateAppleUserInfo.fromJson(dynamic json) {
    code = json['code'];
    description = json['description'];
    result = json['result'];
  }
}
