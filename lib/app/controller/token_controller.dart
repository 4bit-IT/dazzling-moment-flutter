import 'package:damo/app/data/model/token.dart';
import 'package:get/get.dart';

class TokenController extends GetxController {
  late var accessToken;
  late var refreshToken;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Token().loadToken();
    accessToken = Token().accessToken.obs;
    refreshToken = Token().refreshToken.obs;
  }
}