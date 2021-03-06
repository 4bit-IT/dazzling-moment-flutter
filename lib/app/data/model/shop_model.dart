import 'dart:convert';

import 'package:dio/dio.dart';

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
  //업체 상세조회
  int? code; //"성공은 1 or 실패는 2 or 토큰 만료는 3",
  String? content; //"lorem ipsum blah blah",
  String? dataDescription; //"서울에서 입소문난 수제 디저트 공방 ..."
  int? id; //1
  dynamic images; //["string"],
  bool? isFavorite; //true
  double? latitude; //0
  double? longitude; //0
  String? name; // "다모 베이커리"
  int? basePrice; // 10000
  dynamic optionList;
  double? rating; //4.5
  int? reviewCount; //123
  String? shopProfileImage; //"https://damo-s3.exmaple.amazonaws.com/12345.png"
  String? description; //"성공 or 에러 메세지 or 토큰이 만료되었습니다."
  bool? result; //true

  ShopGetDetailModel(
      {code,
      content,
      dataDescription,
      id,
      images,
      isFavorite,
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

  String toJson(int id) {
    return id.toString();
  }

  ShopGetDetailModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    content = json['data']['content'];
    dataDescription = json['data']['description'];
    id = json['data']['id'];
    images = json['data']['images'];
    isFavorite = json['data']['isFavorite'];
    latitude = json['data']['location']['latitude'];
    longitude = json['data']['location']['longitude'];
    name = json['data']['name'];
    basePrice = json['data']['options']['basePrice'];
    optionList = json['data']['options']['optionList'];
    rating = json['data']['rating'];
    reviewCount = json['data']['reviewCount'];
    shopProfileImage = json['data']['shopProfileImage'];
    description = json['description'];
    result = json['result'];
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

  dynamic toJson(dynamic input) async {
    var formData = FormData.fromMap(
      {'image' : await MultipartFile.fromFile(input)},
    );
    return formData;
  }

  ShopChangeMainImageModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    imageUrl = json['data']['imageUrl'];
    description = json['description'];
    result = json['result'];
  }
}

class ShopImageRegistrationModel {
  int? code;
  List<dynamic> imageUrlList = [];
  String? description;
  bool? result;

  ShopImageRegistrationModel({code, imageUrlList, description, result});

  dynamic toJson(dynamic input) async {
    var temp = [];
    temp = input.map((img) => MultipartFile.fromFileSync(img.path)).toList();
    return temp;
  }

  ShopImageRegistrationModel.fromJson(Map<String, dynamic> json) {
    print(json);
    code = json['code'];
    imageUrlList = json['data']['imageUrlList'];
    description = json['description'];
    result = json['true'];
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
  String? basePrice;
  List<dynamic> optionList = [];
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
    basePrice = json['data']['options']['basePrice'].toString();
    optionList = json['data']['options']['optionList'];
    rating = json['data']['rating'];
    reviewCount = json['data']['reviewCount'];
    shopProfileImage = json['data']['shopProfileImage'];
    description = json['description'];
    result = json['result'];
  }
}

class ShopIntroModel {
  int? code;
  String? content;
  String? description;
  bool? result;

  ShopIntroModel({content, description});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {
      'content' : input['content'],
      'description' : input['description']
    };
    body = jsonEncode(sendData);
    return body;
  }

  ShopIntroModel.fromJson(Map<String, dynamic> json) {
    print(json);
    code = json['code'];
    result = json['result'];
  }
}

class ShopOptionRegistration {
  int? code;
  String? imageUrl;
  String? description;
  bool? result;

  ShopOptionRegistration({code, description, result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {
      "basePrice": input['basePrice'],
      "optionList": input['optionList'],
    };
    body = json.encode(sendData);
    return body;
  }

  ShopOptionRegistration.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    imageUrl = json['data']['imageUrl'];
    description = json['description'];
    result = json['result'];
  }
}

class LoadShopMainPageModel {
  int? code;
  bool? hasNextPage;
  dynamic snippetList;
  String? description;
  bool? result;

  LoadShopMainPageModel({code, hasNextPage, snippetList, description, result});

  LoadShopMainPageModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    hasNextPage = json['data']['hasNextPage'];
    snippetList = json['data']['snippetList'];
    description = json['description'];
    result = json['result'];
  }
}