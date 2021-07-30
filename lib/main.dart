import 'package:damo/sign/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';

void main() {
  KakaoContext.clientId = '146054d09a25beea21919c465959bafe';
  runApp(Damo());
}

class Damo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
      theme: ThemeData(
        focusColor: Colors.grey,
      ),
    );
  }
}
