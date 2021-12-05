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
  var jsonResponse;
  var model;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<void> fetchData() async {
    token = (await TokenModel().loadToken()).obs; //기기에 저장되어있는 토큰을 불러온다.
    print('기기에 저장된 토큰을 불러옵니다.');
    print('accessToken: ${token!['accessToken']}');
    print('refreshToken: ${token!['refreshToken']}');

    if ((token!['accessToken'] == '' && token!['refreshToken'] == '')) {
      // 아무 토큰이 없으니 로그인 화면으로 이동
      print('기기에 저장된 토큰이 없으므로 로그인 화면으로 이동합니다.');
      isAutoLogin = false.obs;
    }
    if ((token!['accessToken'] != '' && token!['refreshToken'] != '')) {
      // 토큰이 있는 경우 유효성 검사
      print('기기에 저장된 토큰이 있으므로 유효한 토큰인지 검사합니다.');
      jsonResponse = await UserNetwork().postUsersAccess();
      model = AccessTokenAvailableCheckModel.fromJson(jsonResponse);
      accessTokenAvailableCheckModel.update((val) {
        val!.code = model.code;
        val.data = model.data;
        val.description = model.description;
        val.result = model.result;
      });
      if (accessTokenAvailableCheckModel.value.code == 1) {
        print('기기에 저장된 토큰이 유효합니다.');
        await refreshGetAccessToken();
        isAutoLogin!.value = true;
        print('메인 화면으로 이동합니다.');
      }
      if (accessTokenAvailableCheckModel.value.code == 2) {
        print('기기에 저장된 토큰이 유효하지 않습니다.');
        isAutoLogin!.value = false;
        print('로그인 화면으로 이동합니다.');
      }
      if (accessTokenAvailableCheckModel.value.code == 3) {
        print("현재 기기에 저장된 토큰이 만료되었습니다.");
        await refreshGetAccessToken();
      }
    }
  }

  Future<void> refreshGetAccessToken() async {
    jsonResponse = await UserNetwork().getUsersRefresh();
    model = RefreshAccessTokenModel.fromJson(jsonResponse);
    refreshAccessTokenModel.update((val) {
      val!.code = model.code;
      val.data = model.data;
      val.description = model.description;
      val.result = model.result;
    });
    if (refreshAccessTokenModel.value.code == 3) {
      print('Refresh토큰이 만료되었으므로, 재 로그인이 필요합니다.');
      isAutoLogin = false.obs;
      TokenModel().removeToken();
    }
    if (refreshAccessTokenModel.value.code == 2) {
      print('Refresh토큰 재발급에 실패했습니다.');
      isAutoLogin = false.obs;
    }
    if (refreshAccessTokenModel.value.code == 1) {
      print('새로운 토큰이 발급되었습니다.');
      TokenModel().saveToken(
          refreshAccessTokenModel.value.data!, token!['refreshToken']!);
      token!['accessToken'] = refreshAccessTokenModel.value.data!;
      tokenController.update();
      isAutoLogin = true.obs;
    }
  }
}
