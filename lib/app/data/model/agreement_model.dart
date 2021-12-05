class AgreementModel {
  int? code; //"성공은 1 or 실패는 2 or 토큰 만료는 3"
  String? description; //"성공 or 에러 메세지 or 토큰이 만료되었습니다."
  dynamic data;
  bool? result; //true

  AgreementModel(code, description, result);

  AgreementModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    data = json['data'] ?? '';
    result = json['result'];
  }
}
