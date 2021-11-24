import 'package:damo/app/data/model/shop_model.dart';
import 'package:damo/app/data/provider/shop/shop_api.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ShopController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  Rx<ShopRegistrationModel> shopRegistrationModel = ShopRegistrationModel().obs;
  Rx<ShopGetDetailModel> shopGetDetailModel = ShopGetDetailModel().obs;
  Rx<ShopImageRegistrationModel> shopImageRegistrationModel = ShopImageRegistrationModel().obs;
  Rx<ShopImageDeleteModel> shopImageDeleteModel = ShopImageDeleteModel().obs;
  Rx<ShopChangeMainImageModel> shopChangeMainImageModel = ShopChangeMainImageModel().obs;
  Rx<ShopGetMeModel> shopGetMeModel = ShopGetMeModel().obs;
  Rx<ShopOptionRegistration> shopOptionRegistration = ShopOptionRegistration().obs;
  List<ShopOptionModel>? mainOptionList;
  Rx<TextEditingController>? shopNameController = TextEditingController().obs;
  Rx<TextEditingController>? shopContentController =
      TextEditingController().obs;
  Rx<TextEditingController>? shopDescriptionController =
      TextEditingController().obs;


  Map<String, dynamic> input = {};
  String sendData = '';
  var response;
  var model;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await fetchShopData();
  }

  Future<void> fetchShopData() async {
    response = await ShopNetwork().getShopMe();
    model = ShopGetMeModel.fromJson(response);
    shopGetMeModel.update((val) {
      val!.code = model.code;
      val.content = model.content;
      val.dataDescription = model.dataDescription;
      val.id = model.id;
      val. images = model.images;
      val.latitude = model.latitude;
      val.longitude = model.longitude;
      val.name = model.name;
      val.basePrice = model.basePrice;
      val.optionList = model.optionList;
      val.rating = model.rating;
      val.reviewCount = model.reviewCount;
      val.shopProfileImage = model.shopProfileImage;
      val.description = model.description;
      val.result = model.result;
    });

    if (shopGetMeModel.value.name != '') {
      shopNameController =
          TextEditingController(text: shopGetMeModel.value.name).obs;
    }
    if (shopGetMeModel.value.content != '') {
      shopContentController =
          TextEditingController(text: shopGetMeModel.value.content).obs;
    }
    if (shopGetMeModel.value.dataDescription != '') {
      shopDescriptionController =
          TextEditingController(text: shopGetMeModel.value.dataDescription)
              .obs;
    }

    for (int i = 0; i < shopGetMeModel.value.optionList!.length; i++) {
      List<TextEditingController> optionDetailTitleController = [];
      List<TextEditingController> optionDetailPriceController = [];
      List<int> optionDetailCount = [];
      List<bool> optionDetailAllowMultipleChoices = [];
      for (int j = 0;
      j < shopGetMeModel.value.optionList![i]['optionDetailList'].length;
      j++) {
        optionDetailTitleController.add(TextEditingController(
            text: shopGetMeModel.value.optionList![i]['optionDetailList']
            ['content']));
        optionDetailPriceController.add(TextEditingController(
            text: shopGetMeModel.value.optionList![i]['optionDetailList']
            ['price']));
        optionDetailCount.add(
            shopGetMeModel.value.optionList![i]['optionDetailList']['count']);
        optionDetailAllowMultipleChoices.add(shopGetMeModel.value.optionList![i]
        ['optionDetailList']['allowMultipleChoices']);
      }

      mainOptionList!.add(ShopOptionModel(
        title: shopGetMeModel.value.optionList![i]['title'],
        optionTitleController: TextEditingController(
            text: shopGetMeModel.value.optionList![i]['title']),
        description: shopGetMeModel.value.optionList![i]['description'],
        optionDescriptionController: TextEditingController(
            text: shopGetMeModel.value.optionList![i]['description']),
        price: shopGetMeModel.value.optionList![i]['price'],
        optionPriceController: TextEditingController(
            text: shopGetMeModel.value.optionList![i]['price']),
        allowMultipleChoices: shopGetMeModel.value.optionList![i]
        ['allowMultipleChoices'],
        optionDetailList: shopGetMeModel.value.optionList![i]
        ['optionDetailList'],
        optionDetailTitleController: optionDetailTitleController,
        optionDetailPriceController: optionDetailPriceController,
        optionDetailCount: optionDetailCount,
        optionDetailAllowMultipleChoices: optionDetailAllowMultipleChoices,
      ));
    }
  }


  void onChangeShopMainImage() async {}
}

class ShopOptionModel {
  String? title;
  TextEditingController? optionTitleController;
  String? description;
  TextEditingController? optionDescriptionController;
  int? price;
  TextEditingController? optionPriceController;
  bool? allowMultipleChoices;
  List<Map<String, dynamic>>? optionDetailList;
  List<TextEditingController>? optionDetailTitleController;
  List<TextEditingController>? optionDetailPriceController;
  List<int>? optionDetailCount;
  List<bool>? optionDetailAllowMultipleChoices;

  ShopOptionModel(
      {title,
        optionTitleController,
        description,
        optionDescriptionController,
        price,
        optionPriceController,
        allowMultipleChoices,
        optionDetailList,
        optionDetailTitleController,
        optionDetailPriceController,
        optionDetailCount,
        optionDetailAllowMultipleChoices});
}
