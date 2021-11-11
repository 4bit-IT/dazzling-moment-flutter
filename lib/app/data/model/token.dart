import 'package:shared_preferences/shared_preferences.dart';

class Token {
  String? accessToken;
  String? refreshToken;
  SharedPreferences? prefs;

  Future<Map<String, String>> loadToken() async {
    print(1);
    prefs = await SharedPreferences.getInstance();
    print(prefs!.getString('accessToken'));
    accessToken = (prefs!.getString('accessToken') ?? '');
    refreshToken = (prefs!.getString('refreshToken') ?? '');

    return ({'accessToken': accessToken!, 'refreshToken': refreshToken!});
  }

  void saveToken(String accessToken, String refreshToken) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString('accessToken', accessToken);
    prefs!.setString('refreshToken', refreshToken);
  }
}
