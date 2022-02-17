import 'package:damo/app/controller/owner/owner_shop_controller.dart';
import 'package:damo/app/controller/shop_controller.dart';
import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/app/data/model/owner/owner_shop_faq_model.dart';
import 'package:damo/app/data/model/shop_faq_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final TokenController tokenController = Get.find();
final OwnerShopController ownerShopController = Get.find();
final baseUri = ('https://www.damoforyou.com/api');

class OwnerShopFAQNetwork {
  final headers = {
    'Content-Type': 'application/json',
    'token': tokenController.token!['accessToken']!,
  };
  var body;

  Future<dynamic> getFAQ() async {
    //
    try {
      http.Response response = await http.get(
        Uri.parse(
            baseUri + '/faq?shopId=${ownerShopController.shopGetMeModel.value.id}'),
        headers: headers,
      );
      if (response.statusCode == 200 || response.statusCode == 401) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else {
        print('getFAQ 통신 오류');
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getFAQtoUser(int shopId) async {
    //유저가 상세 페이지에서 볼 때
    try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/faq?shopId=$shopId'),
        headers: headers,
      );
      if(response.statusCode == 200 || response.statusCode == 401)
      return jsonDecode(utf8.decode(response.bodyBytes));
      else {
        print('getFAQtoUser 통신 오류: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> patchFAQAnswer(String body) async {
    try {
      http.Response response = await http.patch(
        Uri.parse(baseUri + '/faq/answer'),
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200 || response.statusCode == 401) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      }
      else {
        print('patchFAQAnswer 통신오류: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> patchFAQQuestion(String body) async {
    try {
      http.Response response = await http.patch(
        Uri.parse(baseUri + '/faq/question'),
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200 || response.statusCode == 401) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      }
      else {
        print('patchFAQQuestion 통신 오류: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> postFAQ(String body) async {
    try {
      http.Response response = await http.post(
        Uri.parse(baseUri + '/faq'),
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200 || response.statusCode == 401) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      }
      else {
        print('postFAQ 통신 오류: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> deleteFAQ() async {
    try {
      print(
          '${ownerShopFAQController.ownerShopGetFAQModel.value.faqList![ownerShopFAQController.currentIndex.value]['faqId']}');
      http.Response response = await http.delete(
        Uri.parse(baseUri +
            '/faq?faqId=${ownerShopFAQController.ownerShopGetFAQModel.value.faqList![ownerShopFAQController.currentIndex.value]['faqId']}'),
        headers: headers,
      );
      if (response.statusCode == 200 || response.statusCode == 401) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      }
      else {
        print('deleteFAQ 통신 오류: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }
}
