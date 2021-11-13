import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/app/data/model/token_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

const baseUri = ('https://damoforyou.com/api');
TokenController tokenController = Get.find();

class UserNetwork {
  final accessTokenHeaders = {
    'Content-Type': 'application/json',
    'token': tokenController.accessToken,
  };
  final refreshTokenHeaders = {
    'Content-Type': 'application/json',
    'token': tokenController.refreshToken,
  };

  Future<void> getUsers() async {
    // 회원 정보 조회
    try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/users'),
        headers: accessTokenHeaders,
      );

      int code = jsonDecode(utf8.decode(response.bodyBytes))['code'];
    } catch (e) {}
  }

  Future<bool> postUsersAccess() async {
    // AccessToken 사용할 수 있는지 확인
    try {
      http.Response response = await http.post(
        Uri.parse(
          baseUri + '/oauth/users/access',
        ),
        headers: accessTokenHeaders,
      );
      int code = jsonDecode(utf8.decode(response.bodyBytes))['code'];
      String description =
          jsonDecode(utf8.decode(response.bodyBytes))['description'];

      if (code == 1) {
        // 유요한 토큰이므로 성공
        return true;
      } else if (code == 2) {
        // 유효하지 않은 토큰이므로 실패
        return false;
      } else {
        //code ==3, 만료된 토큰이므로 토큰 재발급
        bool isSuccessRefreshToken = await UserNetwork().getUsersRefresh();
        if (isSuccessRefreshToken == true) {
          // 토큰 재발급에 성공
          return true;
        } else {
          // 토큰 재발급에 실패
          return false;
        }
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> getUsersRefresh() async {
    //AccessToken 재발급
    try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/users/refresh'),
        headers: refreshTokenHeaders,
      );
      dynamic body = jsonDecode(utf8.decode(response.bodyBytes));
      int code = body['code'];
      String accessToken = body['data'];

      if (code == 1) {
        print('토큰이 성공적으로 재 갱신되었습니다!');
        await Token().saveToken(accessToken, tokenController.refreshToken);
        return true;
      } else {
        print('토큰 갱신에 실패했습니다.');
        return false;
      }
    } catch (e) {
      print('getUsersRefreshError!');
      return false;
    }
  }
}
