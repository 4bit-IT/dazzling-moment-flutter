import 'dart:convert';
import 'package:damo/app/controller/shop_controller.dart';
import 'package:damo/app/controller/token_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

TokenController tokenController = Get.find();
ShopController shopController = Get.find();

const baseUri = ('https://www.damoforyou.com/api');
final headers = {
  'Content-Type': 'application/json',
  'token': tokenController.token!['accessToken']!,
};

class ReviewNetwork {
  Future<dynamic> getReview(int pageNumber) async {
    var shopId = shopController.shopGetDetailModel.value.id!;

    try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/review' + "?page=$pageNumber&shopId=$shopId"),
        headers: headers,
      );
      print(jsonDecode(utf8.decode(response.bodyBytes)));
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
  }
}
