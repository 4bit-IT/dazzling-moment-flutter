import 'package:damo/app/data/model/oauth_model.dart';
import 'package:damo/app/data/model/token_model.dart';
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

  void postOauthKakaoLogin(String accessToken) async {
    try {
      print('123');
      http.Response response = await http.post(
          Uri.parse(
            baseUri + '/oauth/kakao/login',
          ),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(<String, String>{
            'fcmToken': 'fcm_token',
            'oauthAccessToken': accessToken.toString()
          }));
      print('1');
      print(jsonDecode(response.body));
      print('2');
      print(jsonDecode(utf8.decode(response.bodyBytes))['code']);
    } catch (e) {
      print('?ㄴㄴ');
    }
  }

  void kakaoSignApi() async {
    try {
      body = AuthSignModel().toJson(token!);

      http.Response response = await http.post(
        Uri.parse(baseUri + '/oauth/kakao'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        signModel =
            AuthSignModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        if (signModel.code == 1) {
          //성공
          Token().saveToken(signModel.accessToken, signModel.refreshToken);
        } else {
          //회원가입인데 토큰이 2나 3일 리가 없으므로 실패
        }
      } else {
        print('잘못된 http 통신 요청입니다.');
      }
    } catch (e) {
      print(e);
    }
  }
}
