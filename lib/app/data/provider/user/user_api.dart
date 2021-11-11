import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/app/data/model/user_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

final baseUri = ('https://www.damoforyou.com/api');
TokenController tokenController = Get.find();

class UserNetwork {
  late UserModel userModel;

  final headers = {
    'Content-Type': 'application/json',
    'token': tokenController.accessToken,
  };
  var body;

  void getUsers() async {
    try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/users'),
        headers: headers,
      );
      if (response.statusCode == 200) {
        userModel =
            UserModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        print(userModel);
      }
    } catch (e) {}
  }

// void postUsersAddress() async {
//   try {
//     body = UserChangeAddress().toJson();
//     http.Response response = await http.post(
//       Uri.parse(baseUri + '/users/address'),
//       headers: headers,
//       body: body,
//     );
//   } catch (e) {}
// }
}
