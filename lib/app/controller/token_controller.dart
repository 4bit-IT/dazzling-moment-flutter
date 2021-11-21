import 'package:damo/app/data/model/token_model.dart';
import 'package:damo/app/data/model/user_model.dart';
import 'package:damo/app/data/provider/user/user_api.dart';
import 'package:damo/view/main/home_main.dart';
import 'package:damo/view/sign/sign.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenController extends GetxController {
  late RxString accessToken; // damo의 accessToken
  late RxString refreshToken; // damo의 refreshToken
  late Map<String, String> token; // cache로 저장되어있는 token을 return받기 위한 테이블
<<<<<<< HEAD
  late bool isAutoLogin; // 자동로그인이 가능한지 여부를 판별해주는 변수
=======
  late RxBool isAutoLogin; // 자동로그인이 가능한지 여부를 판별해주는 변수
  late AccessTokenAvailableCheckModel accessTokenAvailableCheckModel;
  late RefreshAccessTokenModel refreshAccessTokenModel;
>>>>>>> d65dc7e35b3a3b372cacae7872facdab7a099334

  @override
  Future<void> onInit() async {
    super.onInit();
    token = await Token().loadToken(); //기기에 저장되어있는 토큰을 불러온다.
    accessToken = token['accessToken']!.toString().obs;
    refreshToken = token['refreshToken']!.toString().obs;

    if (accessToken == '' && refreshToken == '') {
      // 아무 토큰이 없으니 로그인 화면으로 이동
      print('토큰이 없으므로 로그인 화면으로 이동');
<<<<<<< HEAD
      isAutoLogin = false;
    } else {
      // 토큰이 있는 경우 유효성 검사
      print('로그인 기록이 있으므로 유효한 토큰인지 검사합니다.');
      isAutoLogin = await UserNetwork().postUsersAccess();
=======
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
>>>>>>> d65dc7e35b3a3b372cacae7872facdab7a099334
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

  reGetAccessToken() {
    refreshAccessTokenModel = (await UserNetwork().getUsersRefresh()).obs;
  }
}
