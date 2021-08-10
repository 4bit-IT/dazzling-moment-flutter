import 'package:damo/sign/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transition/transition.dart';
import 'package:damo/screen/bar/scroll_behavior.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Future<dynamic> signIn() {
    return showDialog(
        barrierDismissible: false, //여백눌려도 안닫힘.
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)), //테두리 둥글기
              title: Text(
                "로그인으로 이동하시겠습니까?",
              ),
              actions: [
                TextButton(
                    child: Text(
                      "예",
                      style: TextStyle(
                          fontFamily: 'NotoSans', color: Colors.red[400]),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          Transition(
                              child: SignIn(),
                              transitionEffect: TransitionEffect.FADE));
                    }),
                TextButton(
                    child: Text(
                      "아니오",
                      style: TextStyle(
                          fontFamily: 'NotoSans', color: Colors.red[400]),
                    ),
                    onPressed: () {
                      Navigator.pop(context, false);
                    }),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red,
        ),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoGlowScrollBehavior(),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/images/logo.png'),
                          // Text(
                          //   "회원가입",
                          //   style: TextStyle(
                          //     fontSize: 30,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "다모(Damo, Dazzling moment)",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: [
                            makeInput(label: "아이디"),
                            makeInput(label: "비밀번호", obsureText: true),
                            makeInput(label: "비밀번호 확인", obsureText: true)
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          // padding: EdgeInsets.only(top: 0, left: 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            // border: Border(
                            //     bottom: BorderSide(color: Colors.black),
                            //     top: BorderSide(color: Colors.black),
                            //     right: BorderSide(color: Colors.black),
                            //     left: BorderSide(color: Colors.black))),
                          ),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 60,
                            onPressed: () {},
                            color: Colors.red[100],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            child: Text(
                              "회원가입",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("이미 가입된 계정이 있나요? "),
                          SizedBox(
                            child: CupertinoButton(
                              onPressed: () {
                                signIn();
                              },
                              child: Text(
                                "로그인",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.black87),
                              ),
                            ),
                          ),
                        ],
                      )
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

Widget makeInput({label, obsureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obsureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
      SizedBox(
        height: 30,
      )
    ],
  );
}
