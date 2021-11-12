import 'package:damo/app/data/provider/user/user_api.dart';
import 'package:kakao_flutter_sdk/all.dart';

class Kakao {
  AccessTokenResponse? token;

  Future<AccessTokenResponse?> getKakaoToken() async {
    try {
      String authCode = await AuthCodeClient.instance.request(); //웹으로 열기
      // String authCode = await AuthCodeClient.instance.requestWithTalk() // Kakao app 으로 열기

      token = await AuthApi.instance.issueAccessToken(authCode);
      TokenManager.instance.setToken(token!);

      print(token!.accessToken);

      return token;
    } on KakaoAuthException {
      print("동의 취소");
      return null;
    } on KakaoClientException {
      print("카카오 클라이언트 문제 발생");
      return null;
    } catch (e) {
      print("로그인 취소");
      return null;
    }
  }

  void kakaoLogout() async {
    await UserApi.instance.logout();
    await TokenManager.instance.clear();
  }
}
