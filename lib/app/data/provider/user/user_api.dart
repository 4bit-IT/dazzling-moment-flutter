import 'package:damo/app/controller/sign_controller.dart';
import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/app/controller/user_controller.dart';
import 'package:damo/app/data/model/token_model.dart';
import 'package:damo/app/data/model/user_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

const baseUri = ('https://damoforyou.com/api');
TokenController tokenController = Get.find();
UserController userController = Get.find();
var headers = {
  'Content-Type': 'application/json',
  'token': tokenController.token!['accessToken']!,
};

class UserNetwork {
  NicknameDoubleCheckModel nicknameDoubleCheckModel =
      NicknameDoubleCheckModel();

  Future<dynamic> postUsersAccess() async {
    // AccessToken 사용할 수 있는지 확인
    try {
      http.Response response = await http.post(
        Uri.parse(
          baseUri + '/users/access',
        ),
        headers: {
          'Content-Type': 'application/json',
          'token': tokenController.token!['accessToken']!,
        },
      );
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getUsersRefresh() async {
    // AccessToken 재발급
    try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/users/refresh'),
        headers: {
          'Content-Type': 'application/json',
          'token': tokenController.token!['refreshToken']!,
        },
      );
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print('getUsersRefreshError!');
    }
  }

  Future<dynamic> getUsers() async {
    // 회원 정보 조회
    try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/users'),
        headers: {
          'Content-Type': 'application/json',
          'token': tokenController.token!['accessToken']!,
        },
      );
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print('회원정보조회 오류!');
    }
  }

  Future<dynamic> postUsersAddress(String sendData) async {
    try {
      http.Response response = await http.post(
        Uri.parse(
          baseUri + '/users/address',
        ),
        headers: {
          'Content-Type': 'application/json',
          'token': tokenController.token!['accessToken']!,
        },
        body: sendData);
      print(jsonDecode(utf8.decode(response.bodyBytes)));
      return jsonDecode(utf8.decode(response.bodyBytes));

    } catch (e) {
      print(e);
    }
  }

  Future<NicknameDoubleCheckModel> postUsersCheckNickname(
      Map<String, dynamic> input) async {
    try {
      var body = NicknameDoubleCheckModel().toJson(input);
      http.Response response = await http.post(
          Uri.parse(
            baseUri + '/users/check/nickname',
          ),
          headers: {
            'Content-Type': 'application/json',
          },
          body: body);

      nicknameDoubleCheckModel = NicknameDoubleCheckModel.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)));
      if (nicknameDoubleCheckModel.code == 1 &&
          nicknameDoubleCheckModel.result == true) {
        return nicknameDoubleCheckModel;
      } else if (nicknameDoubleCheckModel.code == 2 &&
          nicknameDoubleCheckModel.result == false) {
        //실패
      } else if (nicknameDoubleCheckModel.code == 3 &&
          nicknameDoubleCheckModel.result == false) {
        //토큰 만료, 토큰재발급 필요
      }
      return nicknameDoubleCheckModel;
    } catch (e) {
      return nicknameDoubleCheckModel;
    }
  }
}
