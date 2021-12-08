import 'package:damo/app/data/model/review_model.dart';
import 'package:damo/app/data/provider/review_api.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ReviewController extends GetxController {
  Rx<LoadReviewModel> loadReviewModel = LoadReviewModel().obs;
  List<dynamic> stroageReview = [].obs;

  var jsonResponse;
  var model;

  Future<void> loadReview(int pageNumber) async {
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
      for (int i = 0; i < loadReviewModel.value.reviewList.length; i++) {
        stroageReview.add(loadReviewModel.value.reviewList[i]);
      }
    }
    if (model.code == 2) {}
    if (model.code == 3) {}
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void onInit() async {
    await loadReview(0);
    // TODO: implement onInit
    super.onInit();
  }
}
