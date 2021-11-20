import 'package:damo/app/controller/sign_controller.dart';
import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/app/controller/user_controller.dart';
import 'package:damo/app/data/model/user_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

const baseUri = ('https://damoforyou.com/api');
TokenController tokenController = Get.find();
var headers = {
  'Content-Type': 'application/json',
  'token': tokenController.accessToken,
};

class UserNetwork {
  NicknameDoubleCheckModel nicknameDoubleCheckModel =
      NicknameDoubleCheckModel();

  GetRefreshTokenController refreshTokenData =
      Get.put(GetRefreshTokenController());

  Future<bool> postUsersAccess() async {
    // AccessToken 사용할 수 있는지 확인
    try {
      http.Response response = await http.post(
        Uri.parse(
          baseUri + '/users/access',
        ),
        headers: {
          'Content-Type': 'application/json',
          'token': tokenController.accessToken.value,
        },
      );
      PostUsersAccessController usersAccessData =
          Get.put(PostUsersAccessController());
      await usersAccessData
          .checkUsersAccess(jsonDecode(utf8.decode(response.bodyBytes)));
      if (usersAccessData.code == 1) {
        // 유요한 토큰이므로 성공
        print('유효한 토큰입니다.');
        return true;
      } else if (usersAccessData.code == 2) {
        // 유효하지 않은 토큰이므로 실패
        print('유효하지 않은 토큰입니다.');
        return false;
      } else {
        //code == 3, 만료된 토큰이므로 토큰 재발급
        print('만료된 토큰입니다.');
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
        TokenController tokenController = Get.find();
        print('토큰이 성공적으로 재 갱신되었습니다!');
        await tokenController.saveToken(refreshTokenData.refreshToken.value,
            tokenController.refreshToken.value);
      } else {
        print('토큰 갱신에 실패했습니다.');
      }
    } catch (e) {
      print('getUsersRefreshError!');
    }
  }

  Future<void> getUsers() async {
    // 회원 정보 조회
    GetUsersData userData = Get.put(GetUsersData(), permanent: true);
    try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/users'),
        headers: {
          'Content-Type': 'application/json',
          'token': tokenController.accessToken.value,
        },
      );
      await userData.saveUsersData(jsonDecode(utf8.decode(response.bodyBytes)));
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
  }

  Future<void> postUsersAddress() async {
    try {
      GetUsersData userData = Get.find();
      http.Response response = await http.post(
        Uri.parse(
          baseUri + '/users/address',
        ),
        headers: {
          'Content-Type': 'application/json',
          'token': tokenController.accessToken.value,
        },
        body: json.encode(
          <String, dynamic>{
            "addr1": userData.addr1.value,
            "addr2": userData.addr2.value,
            "zipcode": userData.zipcode.value,
          },
        ),
      );
    } catch (e) {
      return;
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
      return nicknameDoubleCheckModel;
    } catch (e) {
      return nicknameDoubleCheckModel;
    }
  }
}
