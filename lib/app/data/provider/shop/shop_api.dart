import 'package:damo/app/data/model/seller_model.dart';
import 'package:damo/app/data/model/token.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

final baseUri = ('https://www.damoforyou.com/api');

class ShopNetwork {
  final headers = {'Content-Type': 'application/json'};

  void postShop() async {
    try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/shop/me/1'),
        headers: headers,
      );
      print(response);
      if (response.statusCode == 200) {
        /*sellerModel =
            SellerModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        if (sellerModel.code == 1) {
          //성공

        } else if (sellerModel.code == 2) {
          //2=실패
        } else {
          //토큰만료
        }*/
      } else {
        print('잘못된 http 통신 요청입니다.');
      }
    } catch (e) {
      print(e);
    }
  }

  void getShopId() async {

  }

  void postShopImage() async{

  }

  void deleteShopImage() async {

  }

  void postShopImageMain() async {

  }

  void getShopMe() async {

  }

  void postShopOption() async {

  }
}
