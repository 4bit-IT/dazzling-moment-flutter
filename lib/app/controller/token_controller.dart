import 'package:damo/app/data/model/token.dart';
import 'package:get/get.dart';

class TokenController extends GetxController {
  late String accessToken;
  late String refreshToken;
  late Map<String, String> token;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    token = await Token().loadToken();
    accessToken = token['accessToken']!;
    refreshToken = token['refreshToken']!;
  }
}
