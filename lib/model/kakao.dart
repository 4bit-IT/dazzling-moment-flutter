import 'package:damo/view/main/home_main.dart';
import 'package:damo/view/sign/get_user_number.dart';
import 'package:damo/view/sign/sign.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:get/get.dart';

class Network {
  final String url;
  AccessTokenResponse token;
  User user;

  Network(this.url, this.token, this.user);

  Future<dynamic> getKakaoData() async {
    Map data = {
      'fcmToken': "",
      'oauthAccessToken': token.accessToken,
    };
    var body = json.encode(data);

    http.Response response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      String jsonData = utf8.decode(response.bodyBytes);
      var parsingData = jsonDecode(jsonData);

      int stateCode = parsingData['code'];
      String accessToken = parsingData.toJson()['data'][0].toString();
      bool isFirst = parsingData.toJson()['data'][1];
      String refreshToken = parsingData.toJson()['data'][2].toString();
      String description = parsingData['description'].toString();
      print(description);
      bool result = parsingData['result'];
      print(description);
      print(result);
      if (stateCode == 1) {
        if (accessToken == '' || refreshToken == '' || isFirst == true) {
          //첫 로그인이니까 닉네임 전화번호 받고 진행
          Map signUpData = {
            'fcmToken': '',
            'nickname': '안주형',
            'oauthAccessToken': token.accessToken,
            'phoneNumber': '010-5784-0360',
            'pushNotificationAllowed': false,
          };
          body = json.encode(signUpData);
          http.Response response = await http.post(
            Uri.parse(
                'http://ec2-13-209-10-201.ap-northeast-2.compute.amazonaws.com:8080/api/oauth/kakao'),
            headers: {"Content-Type": "application/json"},
            body: body,
          );
          print('받은 데이터: ' + utf8.decode(response.bodyBytes));
          print(jsonDecode(utf8.decode(response.bodyBytes)));
        }
        Get.offAll(() => HomeMain());
      } else if (stateCode == 2) {
        //2=실패,3=토큰만료
        Get.offAll(() => Sign());
      }
    } else {}
  }
}

class Kakao {
  AccessTokenResponse? token;

  void kakaoSign() async {
    //카카오 회원가입 api 호출
    Map signUpData = {
      'fcmToken': '',
      'nickname': '안주형',
      'oauthAccessToken': token!.accessToken,
      'phoneNumber': '010-5784-0360',
      'pushNotificationAllowed': false,
    };
    var body = json.encode(signUpData);
    http.Response response = await http.post(
      Uri.parse('https://www.damoforyou.com/api/oauth/kakao'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    // print('받은 데이터: ' + utf8.decode(response.bodyBytes));
    // print(jsonDecode(utf8.decode(response.bodyBytes)));
  }

  void kakaoLogin() async {
    //카카오 로그인 api 호출
    try {
      String authCode = await AuthCodeClient.instance.request(); //웹으로 열기
      // String authCode = await AuthCodeClient.instance.requestWithTalk() // Kakao app 으로 열기

      token = await AuthApi.instance.issueAccessToken(authCode);
      TokenManager.instance.setToken(token!);
      User user = await UserApi.instance.me();
      String url = 'https://www.damoforyou.com/api/oauth/kakao/login';
      Map data = {
        'fcmToken': "",
        'oauthAccessToken': token!.accessToken,
      };
      var body = json.encode(data);

      http.Response response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: body,
      );
      if (response.statusCode == 200) {
        String jsonData = utf8.decode(response.bodyBytes);
        var parsingData = jsonDecode(jsonData);
        int stateCode = parsingData['code'];
        String accessToken = parsingData['data'][0].toString();
        String isFirst = parsingData['data'][1].toString();
        String refreshToken = parsingData['data'][2].toString();
        String description = parsingData['description'].toString();
        print(parsingData);
        if (stateCode == 1) {
          if (accessToken == 'null' ||
              refreshToken == 'null' ||
              isFirst == 'true') {
            print('첫 로그인 입니다.');
            //첫 로그인이니까 닉네임 전화번호 받고 진행
            Get.to(() => GetUserInfo());
          }
        } else if (stateCode == 2 || stateCode == 3) {
          print('실패 || 토큰 만료');
          //2=실패,3=토큰만료
          Get.offAll(() => Sign());
        }
      }
    } on KakaoAuthException {
      print("동의 취소");
    } on KakaoClientException {
      print("카카오 클라이언트 문제 발생");
    } catch (e) {
      print("로그인 취소");
    }
  }

  void kakaoLogout() async {
    await UserApi.instance.logout();
    await TokenManager.instance.clear();
  }
}
