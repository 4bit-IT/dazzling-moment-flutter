import 'package:damo/app/controller/owner/owner_review_controller.dart';
import 'package:damo/app/data/model/owner/owner_review_comment_model.dart';
import 'package:damo/app/data/provider/owner/owner_review_comment_api.dart';
import 'package:get/get.dart';

class OwnerReviewCommentController extends GetxController {
  OwnerReviewController ownerReviewController = Get.find();
  Rx<GetReviewCommentModel> getReviewCommentModel = GetReviewCommentModel().obs;

  Map<String, dynamic> toJsonInput = {};
  String sendData = '';
  var jsonResponse;
  var model;

  Future<void> loadReviewComment(int index) async {
    jsonResponse = await OwnerReviewCommentNetwork().getReviewComment(index);
    model = GetReviewCommentModel.fromJson(jsonResponse);

    if (model.code == 1) {
      getReviewCommentModel.update((val) {
        val!.code = model.code;
        val.comment = model.comment;
        val.isUpdated = model.isUpdated;
        val.reviewCommentId = model.reviewCommentId;
        val.description = model.description;
        val.result = model.result;
      });
    } else if (model.code == 2) {
    } else {}
  }

  Future<void> createReviewComment(int index) async {
    toJsonInput.clear();
    toJsonInput['comment'] =
        ownerReviewController.commentModel[index].commentController!.value.text;
    toJsonInput['reviewId'] =
        ownerReviewController.ownerReviewModel.value.reviewList[index]['id'];
    print(toJsonInput);
    sendData = CreateReviewCommentModel().toJson(toJsonInput);
    jsonResponse =
        await OwnerReviewCommentNetwork().postReviewComment(sendData);
    model = CreateReviewCommentModel.fromJson(jsonResponse);

    if (model.code == 1) {
      ownerReviewController.fetchReviewComment(index, model);
      ownerReviewController.commentModel[index].commentFocusNode!.unfocus();
      ownerReviewController.commentModel.refresh();
    } else if (model.code == 2) {
    } else {}
  }

  Future<void> deleteReviewComment(int index) async {
    toJsonInput.clear();
    toJsonInput['reviewCommentId'] =
        ownerReviewController.commentModel[index].reviewCommentId;
    print(toJsonInput);
    sendData = DeleteReviewCommentModel().toJson(toJsonInput);
    jsonResponse =
        await OwnerReviewCommentNetwork().deleteReviewComment(sendData);
    model = DeleteReviewCommentModel.fromJson(jsonResponse);

    if (model.code == 1) {
      await ownerReviewController.fetchDeleteReviewComment(index);
      ownerReviewController.commentModel[index].commentFocusNode!.unfocus();
      ownerReviewController.commentModel[index].commentController!.clear();
    } else if (model.code == 2) {
    } else {}
  }

  Future<void> updateReviewComment(int index) async {
    toJsonInput.clear();
    toJsonInput['comment'] =
        ownerReviewController.commentModel[index].commentController!.value.text;
    toJsonInput['reviewCommentId'] =
        ownerReviewController.commentModel[index].reviewCommentId;
    print(toJsonInput);
    sendData = UpdateReviewCommentModel().toJson(toJsonInput);
    jsonResponse =
        await OwnerReviewCommentNetwork().patchReviewComment(sendData);
    model = UpdateReviewCommentModel.fromJson(jsonResponse);

    if (model.code == 1) {
      ownerReviewController.fetchReviewComment(index, model);
      ownerReviewController.commentModel[index].commentFocusNode!.unfocus();
    } else if (model.code == 2) {
    } else {}
  }
}
