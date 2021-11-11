import 'package:damo/app/data/model/token_model.dart';
import 'package:damo/app/data/provider/user/user_api.dart';
import 'package:get/get.dart';

class TokenController extends GetxController {
  late var accessToken;
  late var refreshToken;
  late Map<String, String> token;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    token = await Token().loadToken();
    accessToken = token['accessToken'];
    refreshToken = token['refreshToken'];

    //UserNetwork().getUsers();
  }
}