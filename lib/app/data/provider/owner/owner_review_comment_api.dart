import 'dart:convert';
import 'package:damo/app/controller/owner/owner_review_controller.dart';
import 'package:damo/app/controller/token_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

TokenController tokenController = Get.find();
OwnerReviewController ownerReviewController = Get.find();

const baseUri = ('https://www.damoforyou.com/api');
final headers = {
  'Content-Type': 'application/json',
  'token': tokenController.token!['accessToken']!,
};

class OwnerReviewCommentNetwork {
  Future<dynamic> getReviewComment(int index) async {
    try {
      http.Response response = await http.get(
        Uri.parse(baseUri +
            '/review/comment?reviewId=${ownerReviewController.ownerReviewModel.value.reviewList[index]['id']}'),
        headers: headers,
      );
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> postReviewComment(String sendData) async {
    try {
      http.Response response = await http.post(
        Uri.parse(baseUri + '/review/comment'),
        body: sendData,
        headers: headers,
      );
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> patchReviewComment(String sendData) async {
    try {
      http.Response response = await http.patch(
        Uri.parse(baseUri + '/review/comment'),
        body: sendData,
        headers: headers,
      );
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> deleteReviewComment(String sendData) async {
    try {
      http.Response response = await http.delete(
        Uri.parse(baseUri + '/review/comment'),
        body: sendData,
        headers: headers,
      );
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
  }
}
