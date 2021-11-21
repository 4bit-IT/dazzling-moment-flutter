import 'dart:convert';

class GetUserInfoModel {
  late int code;
  late String addr1;
  late String addr2;
  late String zipcode;
  late String ageRange;
  late String lastAgreeDateOfMarketing;
  late String lastAgreeDateOfPushNotification;
  late String lastAgreeDateOfServiceAndPersonalData;
  late bool marketing;
  late bool pushNotification;
  late bool serviceAndPersonalData;
  late String birth;
  late String createdAt;
  late String email;
  late int id;
  late String name;
  late String nickname;
  late String phoneNumber;
  late String profileImage;
  late String sex;
  late String description;
  late bool result;

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
        name,
        nickname,
        phoneNumber,
        profileImage,
        sex,
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
    id = json['data']['id'];
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
  late int code;
  late bool data;
  late String description;
  late bool result;

  AccessTokenAvailableCheckModel({code, data, description, result});

  AccessTokenAvailableCheckModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
    description = json['description'];
    result = json['result'];
  }
}

class ChangeAddressModel {
  late int code;
  late String description;
  late bool result;

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
  late int code;
  late bool data;
  late String description;
  late bool result;

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
  late int code;
  late bool data;
  late String description;
  late bool result;

  CheckOwnerModel({code,data,description,result});

  CheckOwnerModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
    description = json['description'];
    result = json['result'];
  }
}

class UserPhoneNumberModel {
  late int code;
  late String description;
  late bool result;

  UserPhoneNumberModel({code, description, result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {
      'phoneNumber' : input['phoneNumber'].toString()
    };
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
  late int code;
  late String imageUrl;
  late String description;
  late bool result;

  ChangeProfileImageModel({code, imageUrl,description,result});

  //String toJson

  ChangeProfileImageModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    imageUrl = json['data']['imageUrl'];
    description = json['description'];
    result = json['result'];
  }
}

class ChangeDefaultProfileImageModel {
  late int code;
  late String imageUrl;
  late String description;
  late bool result;

  ChangeDefaultProfileImageModel({code,imageUrl,description,result});

  ChangeDefaultProfileImageModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    imageUrl = json['data']['imageUrl'];
    description = json['description'];
    result = json['result'];
  }
}

class RefreshAccessTokenModel {
  late int code;
  late String data;
  late String description;
  late bool result;

  RefreshAccessTokenModel({code,data,description,result});

  RefreshAccessTokenModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
    description = json['description'];
    result = json['result'];
  }
}