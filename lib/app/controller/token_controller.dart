import 'package:damo/app/data/model/token_model.dart';
import 'package:damo/app/data/provider/user/user_api.dart';
import 'package:get/get.dart';

class TokenController extends GetxController {
  late String accessToken; // damo의 accessToken
  late String refreshToken; // damo의 refreshToken
  late Map<String, String> token; // cache로 저장되어있는 token을 return받기 위한 테이블
  late bool isAutoLogin; // 자동로그인이 가능한지 여부를 판별해주는 변수

  @override
  Future<void> onInit() async {
    super.onInit();
    token = await Token().loadToken(); //기기에 저장되어있는 토큰을 불러온다.
    accessToken = token['accessToken']!;
    refreshToken = token['refreshToken']!;

    if (accessToken == '' && refreshToken == '') {
      // 아무 토큰이 없으니 로그인 화면으로 이동
      print('토큰이 없으므로 로그인 화면으로 이동');
      isAutoLogin = false;
    } else {
      // 토큰이 있는 경우 유효성 검사
      isAutoLogin = await UserNetwork().postUsersAccess();
    }
  }

  Future<void> updateToken() async {
    // token = await Token().loadToken(); //기기에 저장되어있는 토큰을 불러온다.
    accessToken = token['accessToken']!;
    refreshToken = token['refreshToken']!;
  }
}
