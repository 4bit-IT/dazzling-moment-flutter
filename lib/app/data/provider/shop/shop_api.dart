import 'dart:convert';
import 'dart:io';
import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/app/data/model/shop_model.dart';
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

  void postShopImage(List<File> images) async {
    try {
      var request =
          http.MultipartRequest("POST", Uri.parse(baseUri + '/shop/image'));
      for (var image in images) {
        request.files
            .add(await http.MultipartFile.fromPath('image', image.path));
      }
      http.StreamedResponse response = await request.send();
      //return jsonDecode(utf8.decode(response.stream));
    } catch (e) {
      print(e);
    }
  }

  void deleteShopImage() async {}

  void postShopImageMain(File image) async {
    try {
      var request = http.MultipartRequest(
          "POST", Uri.parse(baseUri + '/shop/image/main'));
      request.files
          .add(await http.MultipartFile.fromPath('mainImage', image.path));

      http.StreamedResponse response = await request.send();
      //return
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getShopMe() async {
    /*try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/shop/me'),
        headers: headers,
      );
      if(response.statusCode == 200){
        return jsonDecode(utf8.decode(response.bodyBytes));
      }
      else{
        print('통신 오류');
      }
    } catch (e) {
      print(e);
    }*/
    return {
      "code": 1,
      "result": true,
      "data": {
        "id": 1,
        "name": "test",
        "description": "test",
        "content": "test",
        "options": {
          "basePrice": 10000,
          "optionList": [
            {
              "title": "1. 사이즈를 선택해주세요.",
              "description": "반드시 1개 이상 선택해주세요.",
              "allowMultipleChoices": true,
              "optionDetailList": [
                {
                  "content": "오레오 토핑",
                  "price": 1000,
                  "count": 3,
                  "allowMultipleChoices": true
                }
              ]
            }
          ]
        },
        "rating": 0,
        "reviewCount": 0,
        "location": {"latitude": 0, "longitude": 0},
        "shopProfileImage": null,
        "images": []
      },
      "description": "성공"
    };
  }

  void postShopOption(Map<String, dynamic> input) async {
    try {
      body = ShopOptionRegistration().toJson(input);
      http.Response response = await http.post(
        Uri.parse(baseUri + '/shop/option'),
        headers: headers,
        body: body,
      );

      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
  }
}
