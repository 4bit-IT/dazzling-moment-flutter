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
var headers = {
  'Content-Type': 'application/json',
};

class UserNetwork {
  var body;
  NicknameDoubleCheckModel nicknameDoubleCheckModel = NicknameDoubleCheckModel();

  GetRefreshTokenController refreshTokenData =
      Get.put(GetRefreshTokenController());

  Future<dynamic> postUsersAccess() async {
    // AccessToken 사용할 수 있는지 확인
    try {
      http.Response response = await http.post(
        Uri.parse(
          baseUri + '/oauth/users/access',
        ),
        headers: {
          'Content-Type': 'application/json',
          'token': tokenController.accessToken.value,
        },
      );
      return jsonDecode(utf8.decode(response.bodyBytes));
      /*if (usersAccessData.code == 1) {
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
      }*/
    } catch (e) {
      print(e);
    }
  }

  Future<RefreshAccessTokenModel> getUsersRefresh() async {
    // AccessToken 재발급
    try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/users/refresh'),
        headers: {
          'Content-Type': 'application/json',
          'token': tokenController.accessToken.value,
        },
      );
      await refreshTokenData
          .saveRefreshTokenData(jsonDecode(utf8.decode(response.bodyBytes)));
      if (refreshTokenData.code == 1) {
        print('토큰이 성공적으로 재 갱신되었습니다!');
        await Token().saveToken(
            refreshTokenData.refreshToken, tokenController.refreshToken.value);
      } else {
        print('토큰 갱신에 실패했습니다.');
      }
    } catch (e) {
      print('getUsersRefreshError!');
    }
  }

  /*Future<void> getUsers() async {
    // 회원 정보 조회
    GetUsersData userData = Get.put(GetUsersData(), permanent: true);
    try {
      print(tokenController.accessToken);
      http.Response response = await http.get(
        Uri.parse(baseUri + '/users'),
        headers: {
          'Content-Type': 'application/json',
          'token': tokenController.accessToken.value,
        },
      );
      userData.saveUsersData(jsonDecode(utf8.decode(response.bodyBytes)));
      // if (userData.code == 1) {
      // } else if (userData.code == 2 || userData.code == 3) {
      //   //토큰 만료일 경우
      //   await UserNetwork().getUsersRefresh();
      //   if (refreshTokenData.code == 1) {
      //     print('토큰이 성공적으로 재 갱신되었습니다!');
      //     await Token().saveToken(
      //         refreshTokenData.refreshToken, tokenController.refreshToken);
      //   } else {
      //     print('토큰 갱신에 실패했습니다.');
      //   }
      // }
    } catch (e) {
      print('회원정보조회 오류!');
    }
  }*/

  Future<NicknameDoubleCheckModel> postUsersCheckNickname(
      Map<String, dynamic> input) async {
    try {
      body = NicknameDoubleCheckModel().toJson(input);
      http.Response response = await http.post(
          Uri.parse(
            baseUri + '/users/check/nickname',
          ),
          headers: {
            'Content-Type': 'application/json',
          },
          body: body);

      if (response.statusCode == 200) {
        nicknameDoubleCheckModel = NicknameDoubleCheckModel.fromJson(
            jsonDecode(utf8.decode(response.bodyBytes)));
        if (nicknameDoubleCheckModel.code == '1' &&
            nicknameDoubleCheckModel.result == true) {
          return nicknameDoubleCheckModel;
        } else if (nicknameDoubleCheckModel.code == '2' &&
            nicknameDoubleCheckModel.result == false) {
          //실패
        } else if (nicknameDoubleCheckModel.code == '3' &&
            nicknameDoubleCheckModel.result == false) {
          //토큰 만료, 토큰재발급 필요
        }
      } else {
        //오류
      }
      return nicknameDoubleCheckModel;
    } catch (e) {
      return nicknameDoubleCheckModel;
      print(e);
    }
  }
}
