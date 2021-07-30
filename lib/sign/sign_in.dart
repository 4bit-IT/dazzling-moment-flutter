import 'package:damo/screen/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kakao_flutter_sdk/all.dart';

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
                  left: 40.0, top: 0.0, right: 40.0, bottom: 0.0),
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
                    child: TextField(
                      controller: idController,
                      decoration: InputDecoration(labelText: '아이디'),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Container(
                    child: TextField(
                      obscureText: true,
                      controller: pwController,
                      decoration: InputDecoration(labelText: '비밀번호'),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
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
                        style: GoogleFonts.lato(
                          fontSize: 15.0,
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
                        child: Text(
                          '로그인',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(45, 41, 38, 39)),
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
                              style: GoogleFonts.archivo(
                                fontWeight: FontWeight.bold,
                                color: Colors.black38,
                                fontSize: 14,
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
                              style: GoogleFonts.archivo(
                                fontWeight: FontWeight.bold,
                                color: Colors.black38,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Text(
                                '둘러보기',
                                style: GoogleFonts.archivo(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38,
                                  fontSize: 14,
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
