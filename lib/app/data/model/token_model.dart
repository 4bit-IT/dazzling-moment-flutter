import 'package:shared_preferences/shared_preferences.dart';

class TokenModel {
  SharedPreferences? prefs;

  Future<Map<String, String>> loadToken() async {
    prefs = await SharedPreferences.getInstance();
    return ({
      'accessToken': (prefs!.getString('accessToken') ?? ''),
      'refreshToken': (prefs!.getString('refreshToken') ?? '')
    });
  }

  Future<void> saveToken(String accessToken, String refreshToken) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString('accessToken', accessToken);
    prefs!.setString('refreshToken', refreshToken);
    print('기기에 토큰을 저장했습니다.');
  }

  Future<void> removeToken() async {
    prefs = await SharedPreferences.getInstance();
    prefs!.clear();
    print('기기에 저장된 토큰을 삭제했습니다.');
  }
}
