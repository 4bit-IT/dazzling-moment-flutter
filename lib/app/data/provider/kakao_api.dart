import 'package:damo/app/data/model/oauth_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kakao_flutter_sdk/all.dart';

final baseUri = ('https://www.damoforyou.com/api');

class OauthNetwork {
  final headers = {'Content-Type': 'application/json'};
  var body;
  AccessTokenResponse? token;
  late AuthLoginModel loginModel;
  late AuthSignModel signModel;

  Future<List> postOauthKakaoLogin(String accessToken) async {
    try {
      http.Response response = await http.post(
          Uri.parse(
            baseUri + '/oauth/kakao/login',
          ),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(<String, String>{
            'fcmToken': 'fcm_token',
            'oauthAccessToken': accessToken,
          }));
      bool isFirstLogin =
          jsonDecode(utf8.decode(response.bodyBytes))['data']['isFirst'];
      int code = jsonDecode(utf8.decode(response.bodyBytes))['code'];
      return [isFirstLogin, code];
    } catch (e) {
      print('postOauthKakaoLogin 예외발생');
      return [false];
    }
  }
}
