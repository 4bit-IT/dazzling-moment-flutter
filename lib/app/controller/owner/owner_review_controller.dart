import 'package:damo/app/data/model/owner/owner_review_model.dart';
import 'package:damo/app/data/provider/owner/owner_review_api.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';

class OwnerReviewController extends GetxController {
  Rx<OwnerReviewModel> ownerReviewModel = OwnerReviewModel().obs;
  RxList<CommentModel> commentModel = <CommentModel>[].obs;
  var jsonResponse;
  var model;

  Future<void> loadOwnerReview(int pageNumber) async {
    jsonResponse = await OwnerReviewNetwork().getOwnerReview(pageNumber);
    model = OwnerReviewModel.fromJson(jsonResponse);
    if (model.code == 1) {
      ownerReviewModel.update((val) {
        val!.code = model.code;
        val.hasNextPage = model.hasNextPage;
        val.description = model.description;
        val.result = model.result;
      });
      for (int i = 0; i < model.reviewList.length; i++) {
        ownerReviewModel.update((val) {
          val!.reviewList.add(model.reviewList[i]);
        });
        commentModel.add(CommentModel(
          commentController: TextEditingController(),
          commentFocusNode: FocusNode(),
          isFetch: false,
        ));
      }
    }
    if (model.code == 2) {}
    if (model.code == 3) {}
  }

  void fetchReviewComment(int index, var model) {
    commentModel[index].isFetch = true;
    commentModel[index].commentController!.text = model.comment;
    commentModel[index].reviewCommentId = model.reviewCommentId;

    ownerReviewModel.value.reviewList[index]['hasComment'] = true;

    print(commentModel[index].reviewCommentId);
  }

  Future<void> fetchDeleteReviewComment(int index) async {
    commentModel[index].reviewCommentId = -1;
    commentModel[index].commentController!.text = '';
    commentModel[index].isFetch = false;
    ownerReviewModel.value.reviewList[index]['hasComment'] = false;

    //ownerReviewModel.refresh();
    commentModel.refresh();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void onInit() async {
    await loadOwnerReview(0);
    // TODO: implement onInit
    super.onInit();
  }
}

class CommentModel {
  TextEditingController? commentController;
  FocusNode? commentFocusNode;
  bool? isFetch;
  int? reviewCommentId;

  CommentModel({this.commentController, this.commentFocusNode, this.isFetch, this.reviewCommentId});
}
