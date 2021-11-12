import 'package:damo/app/data/model/token_model.dart';
import 'package:damo/app/data/provider/user/user_api.dart';
import 'package:get/get.dart';

class TokenController extends GetxController {
  late String accessToken;
  late String refreshToken;
  late Map<String, String> token;
  late bool isAutoLogin;
  @override
  Future<void> onInit() async {
    super.onInit();
    token = await Token().loadToken();
    accessToken = token['accessToken']!;
    refreshToken = token['refreshToken']!;
    if (accessToken == '' && refreshToken == '') {
      // 아무 토큰이 없으니 로그인 화면으로 이동
      print('토큰이 없으므로 로그인 화면으로 이동');
      isAutoLogin = false;
    } else {
      // 토큰이 있는 경우 유효성 검사
      isAutoLogin = await UserNetwork().postUsersAccess(accessToken);
    }
  }
}
