class ProductReviewModel {
  int? code; //"성공은 1 or 실패는 2 or 토큰 만료는 3"
  String? content; //"여기 맛집 인정~"
  String? createdAt; //"2021-10-28"
  int? id; //1
  String? nickname; //"jeeensong"
  String? options; //"플루트 딸기 케잌, 12호 / 오레오, 샤인머스캣, ..."
  String? profileImage; //"https://damo-s3.s3.ap-northeast-2.amazonaws.com/~~~"
  String? reviewImage; //"https://damo-s3.s3.ap-northeast-2.amazonaws.com/~~~"
  double? score; //4.5
  String? description; //"성공 or 에러 메세지 or 토큰이 만료되었습니다."
  bool? result; //true

  ProductReviewModel(
      {code,
      content,
      createdAt,
      id,
      nickname,
      options,
      profileImage,
      reviewImage,
      score,
      description,
      result});

  ProductReviewModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    content = json['data']['reviewList']['content'];
    createdAt = json['data']['reviewList']['createdAt'];
    id = json['data']['reviewList']['id'];
    nickname = json['data']['reviewList']['nickname'];
    options = json['data']['reviewList']['options'];
    profileImage = json['data']['reviewList']['profileImage'];
    reviewImage = json['data']['reviewList']['reviewImage'];
    score = json['data']['reviewList']['score'];
    description = json['description'];
    result = json['result'];
  }
}
