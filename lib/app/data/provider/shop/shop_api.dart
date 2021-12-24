import 'dart:convert';
import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/app/data/model/shop_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

final TokenController tokenController = Get.find();
final baseUri = ('https://www.damoforyou.com/api');

class ShopNetwork {
  final headers = {
    'Content-Type': 'application/json',
    'token': tokenController.token!['accessToken']!,
  };
  var body;

  dynamic postShop(Map<String, dynamic> input) async {
    try {
      body = ShopRegistrationModel().toJson(input);
      http.Response response = await http.post(
        Uri.parse(baseUri + '/shop'),
        headers: headers,
        body: body,
      );
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getShopId(String id) async {
    try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/shop/$id'),
        headers: headers,
      );
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {}
  }

  Future<dynamic> postShopImage(dynamic input) async {
    var dio = new Dio();
    try {
      dio.options.contentType = 'multipart/form-data';
      dio.options.maxRedirects.isFinite;

      dio.options.headers = {'token': tokenController.token!['accessToken']};
      var response = await dio.post(
        baseUri + '/shop/image',
        data: input,
      );
      print('업체 이미지들 업로드 완료');
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  void deleteShopImage() async {}

  Future<dynamic> postShopImageMain(dynamic input) async {
    var dio = new Dio();
    try {
      dio.options.contentType = 'multipart/form-data';
      dio.options.maxRedirects.isFinite;

      dio.options.headers = {'token': tokenController.token!['accessToken']};
      var response = await dio.post(
        baseUri + '/shop/image/profile',
        data: input,
      );
      print('업체 대표 이미지 업로드 완료');
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getShopMe() async {
    try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/shop/me'),
        headers: headers,
      );
      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else {
        print('통신 오류');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> postShopOption(String sendData) async {
    try {
      http.Response response = await http.post(
        Uri.parse(baseUri + '/shop/option'),
        headers: headers,
        body: sendData,
      );

      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getShopRating(int shopId) async {
    try {
      String insertShopId = shopId.toString();
      http.Response response = await http.get(
        Uri.parse(baseUri + '/shop/rating' + "?shopId=$insertShopId"),
        headers: headers,
      );
      print(jsonDecode(utf8.decode(response.bodyBytes)));
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getShopMain(int pageNumber, String sortBy) async {
    try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/shop' + "?page=$pageNumber&sortBy=$sortBy"),
        headers: headers,
      );
      print(jsonDecode(utf8.decode(response.bodyBytes)));
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
  }
}
