import 'package:damo/app/controller/sign_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kakao_flutter_sdk/all.dart';

const baseUri = ('https://www.damoforyou.com/api');

class OauthNetwork {
  final headers = {
    'Content-Type': 'application/json',
  };
  AccessTokenResponse? token;

  Future<void> postOauthKakaoLogin(String kakaoAccessToken) async {
    try {
      http.Response response = await http.post(
          Uri.parse(
            baseUri + '/oauth/kakao/login',
          ),
          headers: headers,
          body: json.encode(<String, String>{
            'fcmToken': 'fcm_token',
            'oauthAccessToken': kakaoAccessToken,
          }));
      PostKakaoLoginController kakaoLoginData =
          Get.put(PostKakaoLoginController());
      await kakaoLoginData
          .saveKakaoLoingData(jsonDecode(utf8.decode(response.bodyBytes)));
    } catch (e) {
      print('postOauthKakaoLogin 예외발생');
    }
  }

  Future<void> postOauthKakao(String kakaoAccessToken) async {
    try {
      http.Response response = await http.post(
        Uri.parse(
          baseUri + '/oauth/kakao',
        ),
        headers: headers,
        body: json.encode(
          <String, dynamic>{
            "agreements": {"marketing": true, "pushNotification": true},
            "fcmToken": "234n1",
            "nickname": "11",
            "oauthAccessToken": kakaoAccessToken,
            "phoneNumber": "010-0123-0200"
          },
        ),
      );
      print(jsonDecode(utf8.decode(response.bodyBytes)));
    } catch (e) {
      print('postOauthKakao 예외발생');
    }
  }
}
