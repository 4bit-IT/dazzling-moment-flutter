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
  Future<dynamic> postFavoritesOnce(int sendData) async {
    try {
      http.Response response = await http.post(
          Uri.parse(
            baseUri + '/favorites/once',
          ),
          headers: headers,
          body: sendData.toString());
      if(response.statusCode == 200 || response.statusCode == 401)
      return jsonDecode(utf8.decode(response.bodyBytes));
      else print('postFavoritesOnce 통신 오류: ${response.statusCode}');
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> deleteFavoritesOnce(int sendData) async {
    try {
      http.Response response = await http.delete(
          Uri.parse(
            baseUri + '/favorites/once',
          ),
          headers: headers,
          body: sendData.toString());
      if(response.statusCode == 200 || response.statusCode == 401)
      return jsonDecode(utf8.decode(response.bodyBytes));
      else print('deleteFavoritesOnce 통신 오류: ${response.statusCode}');
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getFavorites(int pageNumber) async {
    try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/favorites' + "?page=$pageNumber"),
        headers: headers,
      );
      if(response.statusCode == 200 || response.statusCode == 401)
      return jsonDecode(utf8.decode(response.bodyBytes));
      else print('getFavorites 통신 오류: ${response.statusCode}');
    } catch (e) {
      print(e);
    }
  }
}
