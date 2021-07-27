import 'package:damo/screen/home_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  void loginButtonClicked() async {
    try {
      String authCode = await AuthCodeClient.instance.request();
      print("성공");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeMain(),
        ),
      );
    } on KakaoAuthException catch (e) {
      print("동의 취소");
    } on KakaoClientException catch (e) {
      print("카카오 클라이언트 문제");
    } catch (e) {
      print("로그인 취소");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CupertinoButton(
                onPressed: () {
                  loginButtonClicked();
                },
                color: Colors.yellow,
                child: Text(
                  '카카오 로그인',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
