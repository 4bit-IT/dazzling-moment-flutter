import 'package:kakao_flutter_sdk/all.dart';

class Kakao {
  AccessTokenResponse? kakaoAccessToken;

  Future<String> getKakaoToken() async {
    try {
      String authCode = await AuthCodeClient.instance.request(); //웹으로 열기
      // String authCode = await AuthCodeClient.instance.requestWithTalk() // Kakao app 으로 열기

      kakaoAccessToken = await AuthApi.instance.issueAccessToken(authCode);
      TokenManager.instance.setToken(kakaoAccessToken!);

      print('KakaoToken: ' + kakaoAccessToken!.accessToken);

      return kakaoAccessToken!.accessToken;

    } on KakaoAuthException {
      print("동의 취소");
      return '';
    } on KakaoClientException {
      print("카카오 클라이언트 문제 발생");
      return '';
    } catch (e) {
      print("로그인 취소");
      return '';
    }
  }

  void kakaoLogout() async {
    await UserApi.instance.logout();
    await TokenManager.instance.clear();
  }
}
