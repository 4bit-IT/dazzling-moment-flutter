import 'dart:convert';

class OwnerGetDetailBusinessHourModel {
  int? code;
  Map<String, dynamic> data = {};
  String? description;
  bool? result;

  OwnerGetDetailBusinessHourModel(
      {this.code, required this.data, this.description, this.result});

  OwnerGetDetailBusinessHourModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
    description = json['description'];
    result = json['result'];
  }
}

class OwnerGetDefaultBusinessHourModel {
  int? code;
  bool? result;
  Map<String, dynamic> data = {};

  OwnerGetDefaultBusinessHourModel(
      {this.code, this.result, required this.data});

  OwnerGetDefaultBusinessHourModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    result = json['result'];
    data = json['data'];
  }
}

class OwnerPostDefaultBusinessHour {
  int? code;
  String? description;
  bool? result;

  OwnerPostDefaultBusinessHour({this.code, this.description, this.result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {
      'businessHourList': input['businessHourList'],
      'minNeedDate': input['minNeedDate'],
    };
    body = json.encode(sendData);
    return body;
  }

  OwnerPostDefaultBusinessHour.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    result = json['result'];
  }
}

class OwnerPostDetailBusinessHourModel {
  int? code;
  String? description;
  bool? result;

  OwnerPostDetailBusinessHourModel({this.code, this.description, this.result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {
      'businessHour': input['businessHour'],
      'date': input['date']
    };
    body = json.encode(sendData);
    return body;
  }

  OwnerPostDetailBusinessHourModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    result = json['result'];
  }
}

class OwnerPutDetailBusinessHourModel {
  int? code;
  String? description;
  bool? result;

  OwnerPutDetailBusinessHourModel({this.code, this.description, this.result});

  String toJson(Map<String, dynamic> input) {
    String body;
    Map sendData = {
      'businessHour': input['businessHour'],
      'date': input['date']
    };
    body = json.encode(sendData);
    return body;
  }

  OwnerPutDetailBusinessHourModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    result = json['result'];
  }
}