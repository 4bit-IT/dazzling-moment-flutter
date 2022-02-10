class InsertReviewModel {
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

  InsertReviewModel(
      {code, content, createdAt, id, nickname, options, profileImage, reviewImage, score, description, result});

  InsertReviewModel.fromJson(Map<String, dynamic> json) {
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

class LoadReviewModel {
  int? code; //"성공은 1 or 실패는 2 or 토큰 만료는 3",
  bool? hasNextPage; //true
  dynamic reviewList;
  String? description; //"성공 or 에러 메세지 or 토큰이 만료되었습니다.",
  bool? result; //true

  LoadReviewModel({code, hasNextPage, reviewList, description, result});

  LoadReviewModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    hasNextPage = json['data']['hasNextPage'];
    reviewList = json['data']['reviewList'];
    description = json['description'];
    result = json['result'];
  }
}

class LoadShopRatingListModel {
  int? code; //"성공은 1 or 실패는 2 or 토큰 만료는 3",
  int? oneOrSo; //100
  int? twoOrSo; //200
  int? threeOrSo; //300
  int? fourOrSo; //400
  int? fiveOrSo; //500
  String? description; //"성공 or 에러 메세지 or 토큰이 만료되었습니다.",
  bool? result; //true

  LoadShopRatingListModel({code, ratingList, description, result});

  LoadShopRatingListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    oneOrSo = json['data']['ratingList'][0]['count'];
    twoOrSo = json['data']['ratingList'][1]['count'];
    threeOrSo = json['data']['ratingList'][2]['count'];
    fourOrSo = json['data']['ratingList'][3]['count'];
    fiveOrSo = json['data']['ratingList'][4]['count'];
    description = json['description'];
    result = json['result'];
  }
}

class ReviewCommentModel {
  int? code;
  String? comment;
  String? createdAt;
  bool? isUpdated;
  int? reviewCommentId;
  String? description;
  bool? result;

  ReviewCommentModel(
      {this.code, this.comment, this.createdAt, this.isUpdated, this.reviewCommentId, this.description, this.result});

  ReviewCommentModel.fromJson(Map<String, dynamic> json) {
    print('comment: $json');
    code = json['code'];
    comment = json['data']['comment'];
    createdAt = json['data']['createdAt'];
    isUpdated = json['data']['isUpdated'];
    reviewCommentId = json['data']['reviewCommentId'];
    description = json['description'];
    result = json['result'];
  }
}
