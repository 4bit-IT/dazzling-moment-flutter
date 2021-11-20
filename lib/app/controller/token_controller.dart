import 'package:damo/app/data/model/token_model.dart';
import 'package:damo/app/data/model/user_model.dart';
import 'package:damo/app/data/provider/user/user_api.dart';
import 'package:damo/view/main/home_main.dart';
import 'package:damo/view/sign/sign.dart';
import 'package:get/get.dart';

class TokenController extends GetxController {
  late RxString accessToken; // damo의 accessToken
  late RxString refreshToken; // damo의 refreshToken
  late Map<String, String> token; // cache로 저장되어있는 token을 return받기 위한 테이블
  late RxBool isAutoLogin; // 자동로그인이 가능한지 여부를 판별해주는 변수
  late AccessTokenAvailableCheckModel accessTokenAvailableCheckModel;
  late RefreshAccessTokenModel refreshAccessTokenModel;

  @override
  Future<void> onInit() async {
    super.onInit();
    token = await Token().loadToken(); //기기에 저장되어있는 토큰을 불러온다.
    accessToken = token['accessToken']!.obs;
    refreshToken = token['refreshToken']!.obs;

    if (accessToken.value == '' && refreshToken.value == '') {
      // 아무 토큰이 없으니 로그인 화면으로 이동
      print('토큰이 없으므로 로그인 화면으로 이동');
      isAutoLogin = false.obs;
      Get.to(() => Sign());
    } else {
      // 토큰이 있는 경우 유효성 검사
      print('토큰 있음');
      accessTokenAvailableCheckModel = (await UserNetwork().postUsersAccess()).obs;
      if(accessTokenAvailableCheckModel.code == 1 && accessTokenAvailableCheckModel.result == true) {
        if(accessTokenAvailableCheckModel.data == false){
          //토큰 계속 사용 불가능

        }
      }
      else if(accessTokenAvailableCheckModel.code == 2 && accessTokenAvailableCheckModel.result == false) {
        print('api 호출 중 오류');
      }
      isAutoLogin = true.obs;
      Get.to(() => HomeMain());
    }
  }

  Future<void> updateToken() async {
    // token = await Token().loadToken(); //기기에 저장되어있는 토큰을 불러온다.
    accessToken = token['accessToken']!.obs;
    refreshToken = token['refreshToken']!.obs;
  }

  reGetAccessToken() {
    refreshAccessTokenModel = (await UserNetwork().getUsersRefresh()).obs;
  }
}
