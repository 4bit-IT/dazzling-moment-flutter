import 'package:damo/app/data/model/token_model.dart';
import 'package:damo/app/data/model/user_model.dart';
import 'package:damo/app/data/provider/user/user_api.dart';
import 'package:get/get.dart';

class TokenController extends GetxController {
  RxMap<String, String>? token; // cache로 저장되어있는 token을 return받기 위한 테이블
  RxBool? isAutoLogin = false.obs; // 자동로그인이 가능한지 여부를 판별해주는 변수
  Rx<AccessTokenAvailableCheckModel> accessTokenAvailableCheckModel =
      AccessTokenAvailableCheckModel().obs;
  Rx<RefreshAccessTokenModel> refreshAccessTokenModel =
      RefreshAccessTokenModel().obs;
  var response;
  var model;

  Future<void> fetchData() async {
    token = (await Token().loadToken()).obs; //기기에 저장되어있는 토큰을 불러온다.
    if (token!['accessToken'] == '' && token!['refreshToken'] == '') {
      // 아무 토큰이 없으니 로그인 화면으로 이동
      print('토큰이 없으므로 로그인 화면으로 이동');
      isAutoLogin = false.obs;
    } else {
      // 토큰이 있는 경우 유효성 검사
      print('토큰 있음');
      print(token!['accessToken']);
      response = await UserNetwork().postUsersAccess();
      print(response);
      model = AccessTokenAvailableCheckModel.fromJson(response);
      accessTokenAvailableCheckModel.update((val) {
        val!.code = model.code;
        val.data = model.data;
        val.description = model.description;
        val.result = model.result;
      });
      print(accessTokenAvailableCheckModel.value.code.runtimeType);
      print(accessTokenAvailableCheckModel.value.code);
      print(accessTokenAvailableCheckModel.value.result.runtimeType);
      print(accessTokenAvailableCheckModel.value.result);
      if (accessTokenAvailableCheckModel.value.code == 1 &&
          accessTokenAvailableCheckModel.value.result == true) {
        isAutoLogin = true.obs;
      } else if (accessTokenAvailableCheckModel.value.code == 2 &&
          accessTokenAvailableCheckModel.value.result == false) {
        print('api 호출 중 오류');
        isAutoLogin = false.obs;
      } else {
        print('토큰 만료');
        reGetAccessToken();
      }
    }
  }

  reGetAccessToken() async {
    response = await UserNetwork().getUsersRefresh();
    model = RefreshAccessTokenModel.fromJson(response);
    refreshAccessTokenModel.update((val) {
      val!.code = model.code;
      val.data = model.data;
      val.description = model.description;
      val.result = model.result;
    });
    print(refreshAccessTokenModel.value.code);
    if (refreshAccessTokenModel.value.code == 3) {
      print('토큰만료됨');
      isAutoLogin = false.obs;
      Token().removeToken();
    } else {
      print('새 토큰 발급 완료');
      Token().saveToken(
          refreshAccessTokenModel.value.data!, token!['refreshToken']!);
      token!['accessToken'] = refreshAccessTokenModel.value.data!;
      isAutoLogin = true.obs;
    }
  }
}
