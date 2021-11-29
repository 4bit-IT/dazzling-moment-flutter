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
      return jsonDecode(utf8.decode(response.bodyBytes));
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
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
  }
}
