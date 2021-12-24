import 'dart:convert';

class GetReviewCommentModel {
  int? code;
  String? comment;
  String? createdAt;
  bool? isUpdated;
  int? reviewCommentId;
  String? description;
  bool? result;

  GetReviewCommentModel(
      {code,
      comment,
      createdAt,
      isUpdated,
      reviewCommentId,
      description,
      result});

  GetReviewCommentModel.fromJson(Map<String, dynamic> json) {
    print(json);
    code = json['code'];
    comment = json['data']['comment'];
    createdAt = json['data']['createdAt'];
    isUpdated = json['data']['isUpdated'];
    reviewCommentId = json['data']['reviewCommentId'];
    description = json['description'];
    result = json['result'];
  }
}

class CreateReviewCommentModel {
  int? code;
  String? comment;
  String? createdAt;
  bool? isUpdated;
  int? reviewCommentId;
  String? description;
  bool? result;

  CreateReviewCommentModel(
      {code,
      comment,
      createdAt,
      isUpdated,
      reviewCommentId,
      description,
      result});

  String toJson(Map<String, dynamic> toJsonInput) {
    String body;
    Map sendData = {
      'comment': toJsonInput['comment'],
      'reviewId': toJsonInput['reviewId'],
    };
    body = json.encode(sendData);
    return body;
  }

  CreateReviewCommentModel.fromJson(Map<String, dynamic> json) {
    print(json);
    code = json['code'];
    comment = json['data']['comment'];
    createdAt = json['data']['createdAt'];
    isUpdated = json['data']['isUpdated'];
    reviewCommentId = json['data']['reviewCommentId'];
    description = json['description'];
    result = json['result'];
  }
}

class UpdateReviewCommentModel {
  int? code;
  String? comment;
  String? createdAt;
  bool? isUpdated;
  int? reviewCommentId;
  String? description;
  bool? result;

  UpdateReviewCommentModel(
      {code,
      comment,
      createdAt,
      isUpdated,
      reviewCommentId,
      description,
      result});

  String toJson(Map<String, dynamic> toJsonInput) {
    String body;
    Map sendData = {
      'comment': toJsonInput['comment'],
      'reviewCommentId': toJsonInput['reviewCommentId'],
    };
    body = json.encode(sendData);
    return body;
  }

  UpdateReviewCommentModel.fromJson(Map<String, dynamic> json) {
    print(json);
    code = json['code'];
    comment = json['data']['comment'];
    createdAt = json['data']['createdAt'];
    isUpdated = json['data']['isUpdated'];
    reviewCommentId = json['data']['reviewCommentId'];
    description = json['description'];
    result = json['result'];
  }
}

class DeleteReviewCommentModel {
  int? code;
  String? description;
  bool? result;

  DeleteReviewCommentModel({code, description, result});

  String toJson(Map<String, dynamic> toJsonInput) {
    String body;
    Map sendData = {
      'reviewCommentId': toJsonInput['reviewCommentId'],
    };
    body = json.encode(sendData);
    return body;
  }

  DeleteReviewCommentModel.fromJson(Map<String, dynamic> json) {
    print(json);
    code = json['code'];
    description = json['description'];
    result = json['result'];
  }
}
