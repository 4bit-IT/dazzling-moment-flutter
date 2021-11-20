import 'package:damo/app/data/model/token_model.dart';
import 'package:damo/app/data/provider/user/user_api.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenController extends GetxController {
  late RxString accessToken; // damo의 accessToken
  late RxString refreshToken; // damo의 refreshToken
  late Map<String, String> token; // cache로 저장되어있는 token을 return받기 위한 테이블
  late bool isAutoLogin; // 자동로그인이 가능한지 여부를 판별해주는 변수

  @override
  Future<void> onInit() async {
    super.onInit();
    token = await Token().loadToken(); //기기에 저장되어있는 토큰을 불러온다.
    accessToken = token['accessToken']!.toString().obs;
    refreshToken = token['refreshToken']!.toString().obs;

    if (accessToken == '' && refreshToken == '') {
      // 아무 토큰이 없으니 로그인 화면으로 이동
      print('토큰이 없으므로 로그인 화면으로 이동');
      isAutoLogin = false;
    } else {
      // 토큰이 있는 경우 유효성 검사
      print('로그인 기록이 있으므로 유효한 토큰인지 검사합니다.');
      isAutoLogin = await UserNetwork().postUsersAccess();
    }
  }

  Future<void> removeToken() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    accessToken = ''.toString().obs;
    refreshToken = ''.toString().obs;
    prefs.clear();
    print('기기에 저장된 토큰을 삭제합니다.');
    print('삭제 후 accessToken: $accessToken');
    print('삭제 후 refreshToken: $refreshToken');
  }

  Future<void> saveToken(String accessToken, String refreshToken) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', accessToken);
    await prefs.setString('refreshToken', refreshToken);
    this.accessToken = accessToken.obs;
    this.refreshToken = refreshToken.obs;
    print('토큰을 업데이트 했습니다.');
    print('업데이트 후 accessToken: $accessToken');
    print('업데이트 후 refreshToken: $refreshToken');
  }
}
