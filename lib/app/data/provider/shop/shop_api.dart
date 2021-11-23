import 'dart:convert';
import 'dart:io';
import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/app/data/model/shop_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

final TokenController tokenController = Get.find();
final baseUri = ('https://www.damoforyou.com/api');

class ShopNetwork {
  late ShopRegistrationModel shopRegistrationModel;
  late ShopGetDetailModel shopGetDetailModel;
  late ShopImageRegistrationModel shopImageRegistrationModel;
  late ShopImageDeleteModel shopImageDeleteModel;
  late ShopChangeMainImageModel shopChangeMainImageModel;
  late ShopGetMeModel shopGetMeModel;
  late ShopOptionRegistration shopOptionRegistration;
  final headers = {
    'Content-Type': 'application/json',
    'token': tokenController.token!['accessToken']!,
  };
  var body;

  void postShop(Map<String, dynamic> input) async {
    try {
      body = ShopRegistrationModel().toJson(input);
      http.Response response = await http.post(
        Uri.parse(baseUri + '/shop'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        shopRegistrationModel = ShopRegistrationModel.fromJson(
            jsonDecode(utf8.decode(response.bodyBytes)));
        if (shopRegistrationModel.code == 1 &&
            shopRegistrationModel.result == true) {
          //업체 등록 성공
        } else if (shopRegistrationModel.code == 2 &&
            shopRegistrationModel.result == false) {
          //업체 등록 실패
        } else if (shopRegistrationModel.code == 3 &&
            shopRegistrationModel.result == false) {
          //토큰 만료, 토큰재발급 필요
        }
      } else {
        //오류
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getShopId(String id) async {
    try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/shop?id=$id'),
        headers: headers,
      );
      if (response.statusCode == 200) {
        shopGetDetailModel = ShopGetDetailModel.fromJson(
            jsonDecode(utf8.decode(response.bodyBytes)));
        if (shopGetDetailModel.code == 1 && shopGetDetailModel.result == true) {
          return shopGetDetailModel;
        } else if (shopGetDetailModel.code == 2 &&
            shopGetDetailModel.result == false) {
          //실패
        } else if (shopGetDetailModel.code == 3 &&
            shopGetDetailModel.result == false) {
          //토큰만료
        }
      }
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
      if (response.statusCode == 200) {
        shopImageRegistrationModel = ShopImageRegistrationModel.fromJson(
            json.decode(await response.stream.bytesToString()));
        if (shopImageRegistrationModel.code == 1 &&
            shopImageRegistrationModel.result == true) {
          //netword cached image 사용해야함
        } else if (shopImageRegistrationModel.code == 2 &&
            shopImageRegistrationModel.result == false) {
          //실패
        } else if (shopImageRegistrationModel.code == 3 &&
            shopImageRegistrationModel.result == false) {
          //토큰만료
        }
      } else {
        //통신 실패
      }
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
      if (response.statusCode == 200) {
        shopChangeMainImageModel = ShopChangeMainImageModel.fromJson(
            json.decode(await response.stream.bytesToString()));
        if (shopImageRegistrationModel.code == 1 &&
            shopImageRegistrationModel.result == true) {
          //netword cached image 사용해야함
        } else if (shopImageRegistrationModel.code == 2 &&
            shopImageRegistrationModel.result == false) {
          //실패
        } else if (shopImageRegistrationModel.code == 3 &&
            shopImageRegistrationModel.result == false) {
          //토큰만료
        }
      } else {
        //통신 실패
      }
    } catch (e) {
      print(e);
    }
  }

  Future<ShopGetMeModel> getShopMe() async {
    try {
      http.Response response = await http.get(
        Uri.parse(baseUri + '/shop/me'),
        headers: headers,
      );
      if (response.statusCode == 200) {
        shopGetMeModel = ShopGetMeModel.fromJson(
            jsonDecode(utf8.decode(response.bodyBytes)));
        if (shopGetDetailModel.code == 1 && shopGetDetailModel.result == true) {
          return shopGetMeModel;
        } else if (shopGetDetailModel.code == 2 &&
            shopGetDetailModel.result == false) {
          //실패
        } else if (shopGetDetailModel.code == 3 &&
            shopGetDetailModel.result == false) {
          //토큰만료
        }
      }
    } catch (e) {}
    return shopGetMeModel;
  }

  void postShopOption(Map<String, dynamic> input) async {
    try {
      body = ShopOptionRegistration().toJson(input);
      http.Response response = await http.post(
        Uri.parse(baseUri + '/shop/option'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        shopOptionRegistration = ShopOptionRegistration.fromJson(
            jsonDecode(utf8.decode(response.bodyBytes)));
        if (shopRegistrationModel.code == 1 &&
            shopRegistrationModel.result == true) {
          //업체 등록 성공
        } else if (shopRegistrationModel.code == 2 &&
            shopRegistrationModel.result == false) {
          //업체 등록 실패
        } else if (shopRegistrationModel.code == 3 &&
            shopRegistrationModel.result == false) {
          //토큰 만료, 토큰재발급 필요
        }
      } else {
        //오류
      }
    } catch (e) {
      print(e);
    }
  }
}
