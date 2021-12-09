class OwnerReviewModel {
  int? code; //"성공은 1 or 실패는 2 or 토큰 만료는 3",
  bool? hasNextPage; //true
  List<dynamic> reviewList = [];
  String? description; //"성공 or 에러 메세지 or 토큰이 만료되었습니다.",
  bool? result; //true

  OwnerReviewModel({code, hasNextPage, reviewList, description, result});

  OwnerReviewModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    hasNextPage = json['data']['hasNextPage'];
    reviewList = json['data']['reviewList'];
    description = json['description'];
    result = json['result'];
  }

  
}
