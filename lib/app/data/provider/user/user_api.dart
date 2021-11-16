import 'package:damo/app/controller/sign_controller.dart';
import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/app/data/model/token_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

const baseUri = ('https://damoforyou.com/api');
TokenController tokenController = Get.find();

class UserNetwork {
  GetRefreshTokenController refreshTokenData =
      Get.put(GetRefreshTokenController());
  final accessTokenHeaders = {
    'Content-Type': 'application/json',
    'token': tokenController.accessToken,
  };
  final refreshTokenHeaders = {
    'Content-Type': 'application/json',
    'token': tokenController.refreshToken,
  };

  Future<bool> postUsersAccess() async {
    // AccessToken 사용할 수 있는지 확인
    try {
      http.Response response = await http.post(
        Uri.parse(
          baseUri + '/oauth/users/access',
        ),
        headers: accessTokenHeaders,
      );
      PostUsersAccessController usersAccessData =
          Get.put(PostUsersAccessController());
      await usersAccessData
          .checkUsersAccess(jsonDecode(utf8.decode(response.bodyBytes)));
      if (usersAccessData.code == 1) {
        // 유요한 토큰이므로 성공
        return true;
      } else if (usersAccessData.code == 2) {
        // 유효하지 않은 토큰이므로 실패
        return false;
      } else {
        //code ==3, 만료된 토큰이므로 토큰 재발급
        await UserNetwork().getUsersRefresh();
        if (refreshTokenData.code == 1) {
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

  Future<void> getUsersRefresh() async {
    //AccessToken 재발급
    try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/users/refresh'),
        headers: refreshTokenHeaders,
      );
      await refreshTokenData
          .saveRefreshTokenData(jsonDecode(utf8.decode(response.bodyBytes)));
      if (refreshTokenData.code == 1) {
        print('토큰이 성공적으로 재 갱신되었습니다!');
        await Token().saveToken(
            refreshTokenData.refreshToken, tokenController.refreshToken);
      } else {
        print('토큰 갱신에 실패했습니다.');
      }
    } catch (e) {
      print('getUsersRefreshError!');
    }
  }
}
