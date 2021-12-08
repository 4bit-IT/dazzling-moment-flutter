import 'dart:convert';

import 'package:damo/app/controller/token_controller.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

TokenController tokenController = Get.find();
const baseUri = ('https://www.damoforyou.com/api');
final headers = {
  'Content-Type': 'application/json',
  'token': tokenController.token!['accessToken']!,
};

class FavoriteNetwork {
  Future<void> postFavoritesOnce(String sendData) async {
    try {
      http.Response response = await http.post(
          Uri.parse(
            baseUri + '/favorites/once',
          ),
          headers: headers,
          body: sendData);
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
  }
}
