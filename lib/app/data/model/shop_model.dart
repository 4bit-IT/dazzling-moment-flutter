import 'dart:convert';

import 'dart:io';

class ShopRegistrationModel {
  int? code;
  String? description;
  bool? result;

  ShopRegistrationModel({code, description, result});

  ShopRegistrationModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    result = json['result'];
  }

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {
      'content': input['content'],
      'description': input['description'],
      'location': {
        'latitude': input['location']['latitude'],
        'longitude': input['location']['longitude'],
      },
      'name': input['name'],
      'registrationNumber': input['registrationNumber']
    };
    body = json.encode(sendData);
    return body;
  }
}

class ShopGetDetailModel {
  int? code;
  String? content;
  String? dataDescription;
  int? id;
  List<String>? images;
  double? latitude;
  double? longitude;
  String? mainImage;
  String? name;
  dynamic? options;
  double? rating;
  int? reviewCount;
  String? shopProfileImage;
  String? description;
  bool? result;

  ShopGetDetailModel(
      {code,
      content,
      dataDescription,
      id,
      images,
      latitude,
      longitude,
      mainImage,
      name,
      options,
      rating,
      reviewCount,
      shopProfileImage,
      description,
      result});

  String toJson(String id) {
    return id;
  }

  ShopGetDetailModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    content = json['data']['content'];
    dataDescription = json['data']['description'];
    id = json['data']['id'];
    images = json['data']['images'];
    latitude = json['data']['location']['latitude'];
    longitude = json['data']['location']['longitude'];
    mainImage = json['data']['name'];
    name = json['data']['name'];
    options = json['data']['options'];
    rating = json['data']['rating'];
    reviewCount = json['data']['reviewCount'];
    shopProfileImage = json['data']['shopProfileImage'];
    description = json['description'];
    result = json['result'];
  }
}

class ShopImageRegistrationModel {
  int? code;
  List<String>? imageUrlList;
  String? description;
  bool? result;

  ShopImageRegistrationModel({code, imageUrlList, description, result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {};
    body = json.encode(sendData);
    return body;
  }

  ShopImageRegistrationModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    imageUrlList = json['data']['imageUrlList'];
    description = json['description'];
    result = json['true'];
  }
}

class ShopImageDeleteModel {
  int? code;
  String? description;
  bool? result;

  ShopImageDeleteModel({code, description, result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {};
    body = json.encode(sendData);
    return body;
  }

  ShopImageDeleteModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    result = json['result'];
  }
}

class ShopChangeMainImageModel {
  int? code;
  String? imageUrl;
  String? description;
  bool? result;

  ShopChangeMainImageModel({code, imageUrl, description, result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {};
    body = json.encode(sendData);
    return body;
  }

  ShopChangeMainImageModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    imageUrl = json['data']['imageUrl'];
    description = json['description'];
    result = json['result'];
  }
}

class ShopGetMeModel {
  int? code;
  String? content;
  String? dataDescription;
  int? id;
  dynamic images;
  var latitude;
  var longitude;
  String? name;
  int? basePrice;
  List<Map<String, dynamic>> optionList = [];
  var rating;
  int? reviewCount;
  String? shopProfileImage;
  String? description;
  bool? result;

  ShopGetMeModel(
      {code,
      content,
      dataDescription,
      id,
      images,
      latitude,
      longitude,
      name,
      basePrice,
      optionList,
      rating,
      reviewCount,
      shopProfileImage,
      description,
      result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {};
    body = json.encode(sendData);
    return body;
  }

  ShopGetMeModel.fromJson(Map<String, dynamic> json) {
    print(json);
    code = json['code'];
    content = json['data']['content'];
    dataDescription = json['data']['description'];
    id = json['data']['id'];
    images = json['data']['images'];
    latitude = json['data']['location']['latitude'];
    longitude = json['data']['location']['longitude'];
    name = json['data']['name'];
    basePrice = json['data']['options']['basePrice'];
    optionList = json['data']['options']['optionList'];
    rating = json['data']['rating'];
    reviewCount = json['data']['reviewCount'];
    shopProfileImage = json['data']['shopProfileImage'].toString();
    description = json['description'];
    result = json['result'];
  }
}

class ShopOptionRegistration {
  int? code;
  String? description;
  bool? result;

  ShopOptionRegistration({code, description, result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {};
    body = json.encode(sendData);
    return body;
  }

  ShopOptionRegistration.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    result = json['result'];
  }
}
