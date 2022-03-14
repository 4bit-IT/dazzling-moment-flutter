import 'dart:convert';
import 'package:damo/app/controller/token_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

TokenController tokenController = Get.find();

const baseUri = ('https://www.damoforyou.com/api');
final headers = {
  'Content-Type': 'application/json',
  'token': tokenController.token!['accessToken']!,
};

class OwnerBusinessHourNetwork {
  Future<dynamic> getBusinessHour(int year, int month) async {
    try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/businesshour/$year/$month'),
        headers: headers,
      );
      print(jsonDecode(utf8.decode(response.bodyBytes)));
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getBusinessHourDefault() async {
    try{
      http.Response response = await http.get(
        Uri.parse(baseUri + '/businesshour/default'),
        headers: headers,
      );
      print(jsonDecode(utf8.decode(response.bodyBytes)));
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> postBusinesshourDefault(String sendData) async {
    try{
      http.Response response = await http.post(
        Uri.parse(baseUri + '/businesshour/default'),
        headers: headers,
        body: sendData,
      );
      print(jsonDecode(utf8.decode(response.bodyBytes)));
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> postBusinesshourDetails(String sendData) async {
    try{
      http.Response response = await http.post(
        Uri.parse(baseUri + '/businesshour/details'),
        headers: headers,
        body: sendData,
      );
      print(jsonDecode(utf8.decode(response.bodyBytes)));
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> putBusinesshourDetails(String sendData)async{
    try{
      http.Response response = await http.put(
        Uri.parse(baseUri + '/businesshour/details'),
        headers: headers,
        body: sendData,
      );
      print(jsonDecode(utf8.decode(response.bodyBytes)));
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> deleteBusinesshourDetails(String sendData)async{
    try{
      http.Response response = await http.delete(
        Uri.parse(baseUri + '/businesshour/details'),
        headers: headers,
        body: sendData,
      );
      print(jsonDecode(utf8.decode(response.bodyBytes)));
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
  }
}
