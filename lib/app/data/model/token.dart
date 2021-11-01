import 'package:shared_preferences/shared_preferences.dart';

class Token {
  static String? accessToken;
  static String? refreshToken;
  static SharedPreferences? prefs;

  Future<Map<String, String>> loadToken() async {
    prefs = await SharedPreferences.getInstance(); // 캐시에 저장되어있는 값을 불러온다.
    // 캐시에 저장된 값을 반영하여 현재 상태를 설정한다.
    // SharedPreferences에 id, pw로 저장된 값을 읽어 필드에 저장. 없을 경우 0으로 대입
    accessToken = (prefs!.getString(
        'accessToken')); // (TokenCheck.prefs!.getString('accessToken') ?? '');
    refreshToken = (prefs!.getString('refreshToken'));

    return ({'accessToken': accessToken!, 'refreshToken': refreshToken!});
  }

  void saveToken(String accessToken, String refreshToken) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString('accessToken', accessToken);
    prefs!.setString('refreshToken', refreshToken);
  }
}
