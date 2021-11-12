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

  void saveToken(String accessToken, String refreshToken) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString('accessToken', accessToken);
    prefs!.setString('refreshToken', refreshToken);
  }
}
