import 'package:damo/app/controller/token_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
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

  Future<void> saveToken(String accessToken, String refreshToken) async {
    TokenController tokenController = Get.find();
    prefs = await SharedPreferences.getInstance();
    prefs!.setString('accessToken', accessToken);
    prefs!.setString('refreshToken', refreshToken);
    await tokenController.updateToken(); // 토큰을 최신으로 업데이트 시킨다.
  }
}
