import 'package:shared_preferences/shared_preferences.dart';

class Token {
  SharedPreferences? prefs;

  Future<Map<String, String>> loadToken() async {
    prefs = await SharedPreferences.getInstance();
    return ({
      'accessToken': (prefs!.getString('accessToken') ?? ''),
      'refreshToken': (prefs!.getString('refreshToken') ?? '')
    });
  }

  // Future<void> saveToken(String accessToken, String refreshToken) async {
  //   prefs = await SharedPreferences.getInstance();
  //   await prefs!.setString('accessToken', accessToken);
  //   await prefs!.setString('refreshToken', refreshToken);
  //   print('토큰을 업데이트 했습니다.');
  // }
}
