import 'dart:convert';

class ShopRegistrationModel {
  late int code;
  late String description;
  late bool result;

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
        'latitude': input['location'][0],
        'longitude': input['location'][1],
      },
      'name': input['name'],
      'registrationNumber': input['registrationNumber']
    };
    body = json.encode(sendData);
    return body;
  }
}

class ShopGetDetailModel {
  late int code;
  late String content;
  late String dataDescription;
  late int id;
  late var images;
  late double latitude;
  late double longitude;
  late String mainImage;
  late String name;
  late dynamic options;
  late double rating;
  late int reviewCount;
  late String description;
  late bool result;

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
      description,
      result});

  String toJson(String id) {
    return id;
  }

  ShopGetDetailModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    content = json['data'][0];
    dataDescription = json['data'][1];
    id = json['data'][2];
    images = json['data'][3];
    latitude = json['data'][4][0];
    longitude = json['data'][4][1];
    mainImage = json['data'][5];
    name = json['data'][6];
    options = json['data'][7];
    rating = json['data'][8];
    reviewCount = json['data'][9];
    description = json['description'];
    result = json['result'];
  }
}

class ShopImageRegistrationModel {
  late int code;
  late List<String> imageUrlList;
  late String description;
  late bool result;

  ShopImageRegistrationModel({code, imageUrlList, description, result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {};
    body = json.encode(sendData);
    return body;
  }

  ShopImageRegistrationModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    imageUrlList = json['data'][0];
    description = json['description'];
    result = json['true'];
  }
}

class ShopImageDeleteModel {
  late int code;
  late String description;
  late bool result;

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
  late int code;
  late String imageUrl;
  late String description;
  late bool result;

  ShopChangeMainImageModel({code, imageUrl, description, result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {};
    body = json.encode(sendData);
    return body;
  }

  ShopChangeMainImageModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    imageUrl = json['data'][0];
    description = json['description'];
    result = json['result'];
  }
}

class ShopGetMeModel {
  late int code;
  late String content;
  late String dataDescription;
  late int id;
  late var images;
  late double latitude;
  late double longitude;
  late var mainImage;
  late String name;
  late dynamic options;
  late double rating;
  late int reviewCount;
  late String description;
  late bool result;

  ShopGetMeModel(
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
      description,
      result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {};
    body = json.encode(sendData);
    return body;
  }

  ShopGetMeModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    content = json['data'][0];
    dataDescription = json['data'][1];
    id = json['data'][2];
    images = json['data'][3];
    latitude = json['data'][4][0];
    longitude = json['data'][4][1];
    mainImage = json['data'][5];
    name = json['data'][6];
    options = json['data'][7];
    rating = json['data'][8];
    reviewCount = json['data'][9];
    description = json['description'];
    result = json['result'];
  }
}

class ShopOptionRegistration {
  late int code;
  late String description;
  late bool result;

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