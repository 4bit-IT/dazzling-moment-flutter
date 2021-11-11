import 'package:damo/app/data/model/oauth_model.dart';
import 'package:damo/app/data/model/token_model.dart';
import 'package:damo/view/main/home_main.dart';
import 'package:damo/view/sign/sign.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'kakao.dart';

final baseUri =
('https://www.damoforyou.com/api');

class OauthNetwork {
  final headers = {'Content-Type': 'application/json'};
  var body;
  AccessTokenResponse? token;
  late AuthLoginModel loginModel;
  late AuthSignModel signModel;

  void kakaoLoginApi() async {
    try {
      token = await Kakao().getKakaoToken();
      body = AuthLoginModel().toJson(token!);

      http.Response response = await http.post(
        Uri.parse(baseUri + '/oauth/kakao/login'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        loginModel = AuthLoginModel.fromJson(
            jsonDecode(utf8.decode(response.bodyBytes)));
        if (loginModel.code == 1) {
          //성공
          if (loginModel.accessToken == '' ||
              loginModel.refreshToken == '' ||
              loginModel.isFirst == 'true') {
            //첫 로그인이니까 닉네임 전화번호 받고 진행
            //Get.to(() => getUserInfo());
            //kakaoSignApi();
          }
          Get.offAll(() => HomeMain());
        } else if (loginModel.code == 2) {
          //2=실패
          Get.offAll(() => Sign());
        }
        else{
          //토큰만료
        }
      } else {
        print('잘못된 http 통신 요청입니다.');
      }
    } catch (e) {
      print(e);
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
        signModel = AuthSignModel.fromJson(
            jsonDecode(utf8.decode(response.bodyBytes)));
        if (signModel.code == 1) {
          //성공
          Token().saveToken(signModel.accessToken, signModel.refreshToken);
        }
        else{
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