import 'dart:convert';

class FavoriteModel {
  int? code;
  String? description;
  bool? result;

  FavoriteModel(code, description, result);

  String toJson(dynamic toJsonInput) {
    String body = json.encode(toJsonInput);
    return body;
  }

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    result = json['result'];
  }
}
