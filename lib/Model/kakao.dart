import 'package:damo/view/main/home_main.dart';
import 'package:damo/view/sign/sign.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kakao_flutter_sdk/all.dart';

class Network {
  final String url;
  AccessTokenResponse token;
  Network(this.url, this.token);

  Future<dynamic> getKakaoData() async {
    Map data = {'kakaoToken': token.accessToken};
    var body = json.encode(data);

    http.Response response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      String stateCode = parsingData.toJson()['code'].toString();
      return stateCode;
    } else {
      return 2;
    }
  }
}

void kakaoLogin() async {
  try {
    String authCode = await AuthCodeClient.instance.request();
    // String authCode = await AuthCodeClient.instance.requestWithTalk() // Kakao app
    AccessTokenResponse token =
        await AuthApi.instance.issueAccessToken(authCode);
    TokenManager.instance.setToken(token);
    String url = 'http://00a3-112-171-43-132.ngrok.io/api/oauth/kakao';
    dynamic stateCode = Network(url, token).getKakaoData();
    if (stateCode == 1) {
      //성공
      Get.offAll(() => HomeMain());
    } else {
      //2=실패,3=토큰만료
      Get.offAll(() => Sign());
    }
  } on KakaoAuthException {
    print("동의 취소");
  } on KakaoClientException {
    print("카카오 클라이언트 문제 발생");
  } catch (e) {
    print("로그인 취소");
  }
}
