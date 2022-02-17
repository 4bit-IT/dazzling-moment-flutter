import 'package:damo/app/controller/shop_controller.dart';
import 'package:damo/app/controller/token_controller.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final TokenController tokenController = Get.find();
final ShopController shopController = Get.find();
final baseUri = ('https://www.damoforyou.com/api');

class ShopFAQNetwork {
  final headers = {
    'Content-Type': 'application/json',
    'token': tokenController.token!['accessToken']!,
  };
  var body;

  Future<dynamic> getFAQtoUser(int shopId) async {
    //유저가 상세 페이지에서 볼 때
    try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/faq?shopId=$shopId'),
        headers: headers,
      );
      if(response.statusCode == 200 || response.statusCode == 401)
      return jsonDecode(utf8.decode(response.bodyBytes));
      else print('getFAQtoUser 통신 오류: ${response.statusCode}');
    } catch (e) {
      print(e);
    }
  }
}
