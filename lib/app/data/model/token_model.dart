import 'package:damo/app/controller/token_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class Token {
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
  }

  Future<void> removeToken() async {
    prefs = await SharedPreferences.getInstance();
    prefs!.clear();
  }
}
