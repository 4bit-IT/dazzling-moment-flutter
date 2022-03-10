import 'package:http/http.dart' as http;
import 'dart:convert';

const baseUri = ('https://www.damoforyou.com/api');
final headers = {
  'Content-Type': 'application/json',
};

class OauthNetwork {
  Future<dynamic> postOauthKakaoLogin(String sendData) async {
    try {
      http.Response response = await http.post(
          Uri.parse(
            baseUri + '/oauth/kakao/login',
          ),
          headers: headers,
          body: sendData);
      if (response.statusCode == 200 || response.statusCode == 401)
        return jsonDecode(utf8.decode(response.bodyBytes));
      else
        print('postOauthKakaoLogin 통신오류: ${response.statusCode}');
    } catch (e) {
      print('postOauthKakaoLogin 예외발생');
      print(e);
    }
  }

  Future<dynamic> postOauthKakao(String sendData) async {
    try {
      http.Response response = await http.post(
          Uri.parse(
            baseUri + '/oauth/kakao',
          ),
          headers: headers,
          body: sendData);
      if (response.statusCode == 200 || response.statusCode == 401)
        return jsonDecode(utf8.decode(response.bodyBytes));
      else
        print('postOauthKakao 통신 오류: ${response.statusCode}');
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> postOauthApple(String sendData) async {
    try {
      http.Response response = await http.post(
          Uri.parse(
            baseUri + '/oauth/apple',
          ),
          headers: headers,
          body: sendData);
      if (response.statusCode == 200 || response.statusCode == 401)
        return jsonDecode(utf8.decode(response.bodyBytes));
      else
        print('postOauthKakao 통신 오류: ${response.statusCode}');
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> postOauthAppleLogin(String sendData) async {
    try {
      http.Response response = await http.post(
          Uri.parse(
            baseUri + '/oauth/apple/login',
          ),
          headers: headers,
          body: sendData);
      if (response.statusCode == 200 || response.statusCode == 401)
        return jsonDecode(utf8.decode(response.bodyBytes));
      else
        print('postOauthAppleLogin 통신오류: ${response.statusCode}');
    } catch (e) {
      print('postOauthAPpleLogin 예외발생');
      print(e);
    }
  }
}
