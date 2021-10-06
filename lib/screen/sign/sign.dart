import 'package:damo/data/kakao.dart';
import 'package:damo/screen/bar/scroll_behavior.dart';
import 'package:damo/screen/main/home_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:http/http.dart' as http;

class Sign extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
  void _getUserInfo() async {
    User user = await UserApi.instance.me();
    _getUserNickName(user);
    _getUserEmail(user);
  }

  void _getUserNickName(User user) async {
    String nickName =
        await user.kakaoAccount!.profile!.toJson()['nickname'].toString();
    print(nickName);
  }

  void _getUserEmail(User user) async {
    String accountEmail = await user.kakaoAccount!.email!;
    print(accountEmail);
  }

  void kakaoLogin() async {
    AccessTokenResponse? token;
    try {
      String authCode = await AuthCodeClient.instance.request();
      // String authCode = await AuthCodeClient.instance.requestWithTalk() // Kakao app
      AccessTokenResponse token =
          await AuthApi.instance.issueAccessToken(authCode);
      TokenManager.instance.setToken(
          token); // Store access token in TokenManager for future API requests.

      //String url = 'http://3.36.123.19:8080/api/oauth/kakao';
      //String url = 'http://00a3-112-171-43-132.ngrok.io/api/oauth/kakao';
      //Network(url, token).getJsonData();

      if (token.refreshToken == null) {
        Get.offAll(() => Sign()); //토큰이 만료되었을 시 로그인화면으로 이동
      } else {
        _getUserInfo();
        Get.offAll(() => HomeMain()); //토큰 기간이 남아있을 떄 메인화면으로 이동
      }
      print("토큰 :" + token.accessToken);
    } on KakaoAuthException {
      print("동의 취소");
    } on KakaoClientException {
      print("카카오 클라이언트 문제 발생");
    } catch (e) {
      print("로그인 취소");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoGlowScrollBehavior(),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "MZ세대를 위한 이벤트 관련 오픈마켓 및 정보공유 서비스",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey[700], fontSize: 15),
                      )
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/DAMO_logo-03.png'))),
                  ),
                  Column(
                    children: [
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Get.to(() => HomeMain());
                        },
                        color: Colors.blue,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "페이스북으로 로그인",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {},
                        color: Colors.green,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "네이버로 로그인",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          kakaoLogin();
                        },
                        color: Colors.yellow,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "카카오톡으로 로그인",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {},
                        color: Colors.grey[400],
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "애플 로그인",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
