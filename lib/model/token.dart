import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class TokenCheck extends StatefulWidget {
  static String? accessToken;
  static String? refreshToken;
  static SharedPreferences? prefs;
  @override
  _TokenCheckState createState() => _TokenCheckState();
}

class _TokenCheckState extends State<TokenCheck> {
  void initState() {
    super.initState(); // initState()를 사용할 때 반드시 사용해야 한다.
    _loadToken(); // 이 함수를 실행한다.
  }

  _loadToken() async {
    TokenCheck.prefs =
        await SharedPreferences.getInstance(); // 캐시에 저장되어있는 값을 불러온다.
    setState(() {
      // 캐시에 저장된 값을 반영하여 현재 상태를 설정한다.
      // SharedPreferences에 id, pw로 저장된 값을 읽어 필드에 저장. 없을 경우 0으로 대입
      TokenCheck.accessToken = (TokenCheck.prefs!.getString(
          'accessToken')); // (TokenCheck.prefs!.getString('accessToken') ?? '');
      TokenCheck.refreshToken = (TokenCheck.prefs!.getString('refreshToken'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
