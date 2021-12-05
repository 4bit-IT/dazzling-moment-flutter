import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:damo/app/controller/token_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

const baseUri = ('https://damoforyou.com/api/agreement');
TokenController tokenController = Get.find();

var headers = {
  'token': tokenController.token!['accessToken']!,
};

class AgreementNetwork {
  Future<dynamic> patchAgreementMarketing() async {
    try {
      http.Response response = await http.patch(
        Uri.parse(baseUri + '/marketing'),
        headers: headers,
      );
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> patchAgreementPush() async {
    try {
      http.Response response = await http.patch(
        Uri.parse(baseUri + '/push'),
        headers: headers,
      );
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
  }
}
