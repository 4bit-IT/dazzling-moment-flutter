import 'dart:convert';

class NicknameDoubleCheckModel {
  late int code; // example: 성공은 1 or 실패는 2 or 토큰 만료는 3
  late bool data; // boolean
  late String description; //example: 성공 or 에러 메세지 or 토큰이 만료되었습니다.
  late bool result; // example: true

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
