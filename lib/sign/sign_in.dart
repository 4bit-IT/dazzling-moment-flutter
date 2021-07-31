import 'package:damo/screen/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:transition/transition.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var autoLoginIsChecked = false;

  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  void loginButtonClicked() async {
    try {
      String authCode = await AuthCodeClient.instance.request();
      print("성공");
      print(authCode);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Loading()),
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
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  left: 40.0, top: 80.0, right: 40.0, bottom: 0.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Image.asset('assets/images/logo.png'),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email_outlined,
                          size: 20.0,
                        ),
                        hintText: '아이디',
                        contentPadding:
                            EdgeInsets.fromLTRB(5.0, 10.0, 20.0, 10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Container(
                    child: TextFormField(
                      autofocus: false,
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.vpn_key_outlined,
                          size: 20.0,
                        ),
                        hintText: '비밀번호',
                        contentPadding:
                            EdgeInsets.fromLTRB(5.0, 10.0, 20.0, 10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.black54,
                        focusColor: Colors.red,
                        activeColor: Colors.transparent,
                        value: autoLoginIsChecked,
                        onChanged: (value) {
                          setState(
                            () {
                              autoLoginIsChecked = value!;
                            },
                          );
                        },
                      ),
                      Text(
                        '자동 로그인',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: Colors.black87,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: TextButton(
                      onPressed: () {
                        //loginButtonClicked();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 300,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.pink.shade100,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          //  mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 10.0),
                            Icon(
                              Icons.email_outlined,
                              color: Colors.grey[850],
                            ),
                            SizedBox(width: 100.0),
                            Text(
                              '로그인',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromRGBO(45, 41, 38, 39)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: TextButton(
                      onPressed: () {
                        loginButtonClicked();
                      },
                      child: Image.asset(
                        'assets/images/kakao_login_medium_wide.png',
                      ),
                    ),
                  ),
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 105,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '계정찾기',
                              style: TextStyle(
                                fontFamily: 'NotoSans',
                                color: Colors.black38,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '회원가입',
                              style: TextStyle(
                                fontFamily: 'NotoSans',
                                color: Colors.black38,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  Transition(
                                      child: Loading(),
                                      transitionEffect: TransitionEffect.FADE));
                            },
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Text(
                                '둘러보기',
                                style: TextStyle(
                                  fontFamily: 'NotoSans',
                                  color: Colors.black38,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
