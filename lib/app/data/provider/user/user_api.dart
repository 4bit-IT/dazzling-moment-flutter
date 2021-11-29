import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/app/controller/user_controller.dart';
import 'package:damo/app/data/model/user_model.dart';
import 'package:dio/dio.dart';
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
  Future<dynamic> postUsersAccess() async {
    // refreshToken 사용할 수 있는지 확인
    try {
      http.Response response = await http.post(
        Uri.parse(
          baseUri + '/users/access',
        ),
        headers: {
          'Content-Type': 'application/json',
          'token': tokenController.token!['refreshToken']!,
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
          'token': tokenController.token!['refreshToken']!,
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
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
  }

  Future<NicknameDoubleCheckModel> postUsersCheckNickname(
      Map<String, dynamic> input) async {
    NicknameDoubleCheckModel nicknameDoubleCheckModel =
        NicknameDoubleCheckModel();
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
      if (nicknameDoubleCheckModel.result == true) {
        return nicknameDoubleCheckModel;
      }
      if (nicknameDoubleCheckModel.result == false) {}
      return nicknameDoubleCheckModel;
    } catch (e) {
      return nicknameDoubleCheckModel;
    }
  }

  Future<dynamic> patchUserProfileImage(dynamic input) async {
    print("프로필 사진을 서버에 업로드 합니다.");
    var dio = new Dio();
    try {
      dio.options.contentType = 'multipart/form-data';
      dio.options.maxRedirects.isFinite;

      dio.options.headers = {'token': tokenController.token!['refreshToken']!};
      var response = await dio.patch(
        baseUri + '/users/profileimage',
        data: input,
      );
      print('성공적으로 업로드했습니다');
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> patchUsersProfileimageDefault() async {
    try {
      http.Response response = await http.patch(
        Uri.parse(
          baseUri + '/users/profileimage/default',
        ),
        headers: {
          'Content-Type': 'application/json',
          'token': tokenController.token!['refreshToken']!,
        },
      );
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
  }
}
