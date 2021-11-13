import 'package:damo/app/data/provider/kakao_api.dart';
import 'package:damo/app/data/provider/user/user_api.dart';
import 'package:damo/view/main/home_main.dart';
import 'package:damo/view/sign/get_user_number.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:kakao_flutter_sdk/all.dart';

class Kakao {
  AccessTokenResponse? kakaoAccessToken;

  Future<AccessTokenResponse?> getKakaoToken() async {
    try {
      String authCode = await AuthCodeClient.instance.request(); //웹으로 열기
      // String authCode = await AuthCodeClient.instance.requestWithTalk() // Kakao app 으로 열기

      kakaoAccessToken = await AuthApi.instance.issueAccessToken(authCode);
      TokenManager.instance.setToken(kakaoAccessToken!);

      print('KakaoToken: ' + kakaoAccessToken!.accessToken);
      List getOauthKakaoLogin = await OauthNetwork()
          .postOauthKakaoLogin(kakaoAccessToken!.accessToken);
      bool isFirstLogin = getOauthKakaoLogin[0];
      int code = getOauthKakaoLogin[1];

      if (isFirstLogin == false) {
        // 이미 가입 된 적이 있는 유저일 경우
        print('이미 가입된 회원입니다.');
        Get.off(() => HomeMain());
      } else if (isFirstLogin == true) {
        // 처음 가입하는 유저일 경우
        print('처음 가입하는 회원입니다.');
        Get.to(() => GetUserInfo());
      } else if (code == 3) {
        // 토큰이 만료 된 경우
        print('토큰 재갱신이 필요한 회원입니다.');
        bool isSuccessRefreshToken = await UserNetwork().getUsersRefresh();
        if (isSuccessRefreshToken == true) {
          // 토큰 재발급에 성공
          Get.to(() => HomeMain());
        } else {
          // 토큰 재발급에 실패
        }
      }
      return kakaoAccessToken;
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
