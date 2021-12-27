import 'dart:convert';
import 'package:damo/app/controller/token_controller.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

final TokenController tokenController = Get.find();
final baseUri = ('https://www.damoforyou.com/api');

class OrderNetwork {
  final headers = {
    'Content-Type': 'application/json',
    'token': tokenController.token!['accessToken']!,
  };
  var body;

  Future<dynamic> getOrdersOwner() async {
    try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/orders/owner'),
        headers: headers,
      );
      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else {
        print('getOrdersOwner 통신 오류');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> postOrdersStatus(String sendData) async {
    try {
      http.Response response = await http.patch(
        Uri.parse(baseUri + '/orders/status'),
        headers: headers,
        body: sendData,
      );
      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else {
        print('postOrdersStatus 통신 오류');
      }
    } catch (e) {
      print(e);
    }
  }
}
