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

<<<<<<< HEAD
      if (kakaoLoginData.isFirst == false) {
        // 이미 가입 된 적이 있는 유저일 경우
        print('이미 가입된 회원입니다.');
        TokenController tokenController = Get.find();
        await tokenController.saveToken(
            kakaoLoginData.accessToken, kakaoLoginData.refreshToken);
        await UserNetwork().getUsers();

        Get.off(() => HomeMain());
      } else if (kakaoLoginData.isFirst == true) {
        // 처음 가입하는 유저일 경우
        print('처음 가입하는 회원입니다.');
        Get.to(() => GetUserInfo());
      } else if (kakaoLoginData.description == "토큰이 만료되었습니다.") {
        // 토큰이 만료 된 경우
        print('토큰 재갱신이 필요한 회원입니다.');
        UserNetwork().getUsersRefresh();
        GetRefreshTokenController refreshTokenData = Get.find();
        if (refreshTokenData.result == true) {
          // 토큰 재발급에 성공
          Get.to(() => HomeMain());
        } else {
          // 토큰 재발급에 실패
        }
      }
      return kakaoAccessToken;
=======
>>>>>>> d65dc7e35b3a3b372cacae7872facdab7a099334
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
