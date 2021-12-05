import 'package:damo/app/controller/shop_controller.dart';
import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/app/data/model/shop_faq_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final TokenController tokenController = Get.find();
final ShopController shopController = Get.find();
final baseUri = ('https://www.damoforyou.com/api');

class ShopFAQNetwork {
  final headers = {
    'Content-Type': 'application/json',
    'token': tokenController.token!['accessToken']!,
  };
  var body;

  Future<dynamic> getFAQ() async {
    try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/faq?shopId=${shopController.shopGetMeModel.value.id}'),
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

  Future<dynamic> patchFAQAnswer(String body) async {
    try {
      http.Response response = await http.patch(
        Uri.parse(baseUri + '/faq/answer'),
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
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
      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
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
      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> deleteFAQ() async {
    try {
      print('${shopFAQController.shopGetFAQModel.value.faqList![shopFAQController.currentIndex.value]['faqId']}');
      http.Response response = await http.delete(
        Uri.parse(baseUri +
            '/faq?faqId=${shopFAQController.shopGetFAQModel.value.faqList![shopFAQController.currentIndex.value]['faqId']}'),
        headers: headers,
      );
      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      }
    } catch (e) {
      print(e);
    }
  }
}
