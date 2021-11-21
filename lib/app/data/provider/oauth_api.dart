import 'package:damo/app/controller/sign_controller.dart';
import 'package:damo/app/data/model/oauth_model.dart';
import 'package:damo/app/data/model/user_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kakao_flutter_sdk/all.dart';

const baseUri = ('https://www.damoforyou.com/api');
final headers = {
  'Content-Type': 'application/json',
};

class OauthNetwork {

  Future<dynamic> postOauthKakaoLogin(Map<String, dynamic> input) async {
    try {
      http.Response response = await http.post(
          Uri.parse(
            baseUri + '/oauth/kakao/login',
          ),
          headers: headers,
          body: AuthLoginModel().toJson(input));

      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print('postOauthKakaoLogin 예외발생');
      print(e);
    }
  }
}
