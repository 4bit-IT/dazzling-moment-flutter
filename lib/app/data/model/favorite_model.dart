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

class FavoritesProductListModel {
  int? code;
  bool? hasNextPage;
  dynamic snippetList;
  String? description;
  bool? result;

  FavoritesProductListModel(
      {code, hasNextPage, snipperList, description, result});

  FavoritesProductListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    hasNextPage = json['data']['hasNextPage'];
    snippetList = json['data']['snippetList'];
    description = json['description'];
    result = json['result'];
  }
}
