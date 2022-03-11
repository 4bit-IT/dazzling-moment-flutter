import 'package:damo/app/controller/shop_controller.dart';
import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/app/data/model/review_model.dart';
import 'package:damo/app/data/provider/review_api.dart';
import 'package:damo/app/data/provider/shop/shop_api.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ReviewController extends GetxController {
  Rx<LoadReviewModel> loadReviewModel = LoadReviewModel().obs;
  Rx<LoadShopRatingListModel> loadShopRatingListModel = LoadShopRatingListModel().obs;
  ShopController shopController = Get.find();
  List<dynamic> storageReview = [].obs;
  Map<int, dynamic> reviewComments = <int, dynamic>{}.obs;
  TokenController tokenController = Get.find();

  var jsonResponse;
  var model;

  Future<void> loadReview(int pageNumber) async {
    if (loadReviewModel.value.hasNextPage == false) {
      return;
    }
    jsonResponse = await ReviewNetwork().getReview(pageNumber);
    model = LoadReviewModel.fromJson(jsonResponse);

    if (model.code == 1) {
      loadReviewModel.update((val) {
        val!.code = model.code;
        val.hasNextPage = model.hasNextPage;
        val.reviewList = model.reviewList;
        val.description = model.description;
        val.result = model.result;
      });
      for (dynamic reviewList in loadReviewModel.value.reviewList) {
        storageReview.add(reviewList);
        jsonResponse = await ReviewNetwork().getReviewComment(reviewList['id']);
        if (jsonResponse['data'] != null) {
          model = ReviewCommentModel.fromJson(jsonResponse);
          if (model.code == 1) {
            reviewComments.addAll({reviewList['id']: model});
          }
        }
      }
    }
    if (model.code == 2) {}
    if (model.code == 3) {}
  }

  Future<void> loadShopRatingList(int shopId) async {
    jsonResponse = await ShopNetwork().getShopRating(shopId);
    model = LoadShopRatingListModel.fromJson(jsonResponse);

    if (model.code == 1) {
      loadShopRatingListModel.update((val) {
        val!.oneOrSo = model.oneOrSo;
        val.twoOrSo = model.twoOrSo;
        val.threeOrSo = model.threeOrSo;
        val.fourOrSo = model.fourOrSo;
        val.fiveOrSo = model.fiveOrSo;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await loadReview(0);
    await loadShopRatingList(shopController.shopGetDetailModel.value.id!);
  }
}
