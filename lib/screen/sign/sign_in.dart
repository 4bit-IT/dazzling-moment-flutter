import 'package:damo/screen/bar/scroll_behavior.dart';
import 'package:damo/screen/main/home_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

const users = const {
  'dev@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _signIn(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name) || users[data.name] != data.password) {
        return '로그인 정보가 일치하지 않습니다.';
      }
    });
  }

  Future<String?> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return '계정이 존재하지 않습니다.';
      } else {
        //초기화된 이메일을 주는 부분;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.red[200],
        ),
        body: ScrollConfiguration(
          behavior: NoGlowScrollBehavior(),
          child: FlutterLogin(
            logo: 'assets/images/logo.png',
            messages: LoginMessages(
              userHint: '아이디',
              passwordHint: '비밀번호',
              confirmPasswordHint: '비밀번호 확인',
              forgotPasswordButton: '비밀번호를 잊으셨습니까?',
              loginButton: '로그인',
              signupButton: '회원가입',
              recoverPasswordButton: '비밀번호 찾기',
              recoverPasswordIntro: '비밀번호 찾기',
              recoverPasswordDescription: '초기화된 비밀번호를 이메일로 보내드립니다.',
              goBackButton: '뒤로가기',
              confirmPasswordError: '비밀번호가 일치하지 않습니다.',
              recoverPasswordSuccess: '이메일로 초기화된 비밀번호를 전송했습니다.',
              flushbarTitleSuccess: '성공',
              flushbarTitleError: '실패',
            ),
            theme: LoginTheme(
              bodyStyle: TextStyle(),
              // buttonTheme: LoginButtonTheme(
              //   backgroundColor: Colors.red,
              // ),
              footerTextStyle: TextStyle(color: Colors.red),
              primaryColor: Colors.red[200],
              switchAuthTextColor: Colors.red,
              textFieldStyle: TextStyle(
                color: Colors.black87,
              ),
            ),
            hideSignUpButton: true,
            // showDebugButtons: true,
            onSubmitAnimationCompleted: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeMain()),
              );
            },
            onLogin: _signIn,
            onSignup: _signIn,
            onRecoverPassword: _recoverPassword,
            loginProviders: [
              //소셜 로그인
            ],
          ),
        ),
      ),
    );
  }
}
