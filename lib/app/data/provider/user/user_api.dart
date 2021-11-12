import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/app/data/model/user_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

final baseUri = ('https://damoforyou.com/api');
TokenController tokenController = Get.find();

class UserNetwork {
  final headers = {
    'Content-Type': 'application/json',
    'token': tokenController.accessToken,
  };

  Future<void> getUsers() async {
    try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/users'),
        headers: headers,
      );

      // userModel =
      //     UserModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));

      int code = jsonDecode(utf8.decode(response.bodyBytes))['code'];
    } catch (e) {}
  }

  Future<bool> postUsersAccess(String accessToken) async {
    try {
      http.Response response = await http.post(
        Uri.parse(
          baseUri + '/oauth/users/access',
        ),
        headers: {
          'Content-Type': 'application/json',
          'token': accessToken,
        },
      );
      int code = jsonDecode(utf8.decode(response.bodyBytes))['code'];
      String description =
          jsonDecode(utf8.decode(response.bodyBytes))['description'];
      if (code == 1) {
        //성공
        print(description);
        return true;
      } else if (code == 2) {
        //실패
        print(description);
        return false;
      } else if (code == 3) {
        //토큰 만료
        print(description);
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> getUsersRefresh() async {
    try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/users/refresh'),
        headers: headers,
      );

      // userModel =
      //     UserModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));

      int code = jsonDecode(utf8.decode(response.bodyBytes))['code'];
    } catch (e) {}
  }
}