import 'package:damo/app/data/model/shop_model.dart';
import 'package:damo/app/data/provider/shop/shop_api.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ShopController extends GetxController {
  Rx<ShopRegistrationModel> shopRegistrationModel = ShopRegistrationModel().obs;
  Rx<ShopGetDetailModel> shopGetDetailModel = ShopGetDetailModel().obs;
  Rx<ShopImageRegistrationModel> shopImageRegistrationModel =
      ShopImageRegistrationModel().obs;
  Rx<ShopImageDeleteModel> shopImageDeleteModel = ShopImageDeleteModel().obs;
  Rx<ShopChangeMainImageModel> shopChangeMainImageModel =
      ShopChangeMainImageModel().obs;
  Rx<ShopGetMeModel> shopGetMeModel = ShopGetMeModel().obs;
  Rx<ShopOptionRegistration> shopOptionRegistration =
      ShopOptionRegistration().obs;
  RxList<ShopMainOptionModel> mainOptionList = <ShopMainOptionModel>[].obs;
  Rx<TextEditingController> shopNameController = TextEditingController().obs;
  Rx<TextEditingController> shopContentController = TextEditingController().obs;
  Rx<TextEditingController> shopDescriptionController =
      TextEditingController().obs;
  Rx<TextEditingController> shopBasePriceController =
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
      val.images = model.images;
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
          TextEditingController(text: shopGetMeModel.value.dataDescription).obs;
    }
    if (shopGetMeModel.value.basePrice != null) {
      shopBasePriceController =
          TextEditingController(text: shopGetMeModel.value.basePrice.toString())
              .obs;
    }

    print(shopGetMeModel.value.optionList);

    for (int i = 0; i < shopGetMeModel.value.optionList.length; i++) {
      mainOptionList.add(ShopMainOptionModel(
        mainOptionTitleController: TextEditingController(
            text: shopGetMeModel.value.optionList[i]['title']),
        mainOptionDescriptionController: TextEditingController(
            text: shopGetMeModel.value.optionList[i]['description']),
        mainOptionAllowMultipleChoices: shopGetMeModel.value.optionList[i]
            ['allowMultipleChoices'],
        shopDetailOption: <ShopDetailOptionModel>[],
      ));

      for (int j = 0; j < shopGetMeModel.value.optionList.length; j++) {
        mainOptionList[i].shopDetailOption!.add(ShopDetailOptionModel(
            detailOptionContentController: TextEditingController(
                text: shopGetMeModel.value.optionList[i]['optionDetailList'][j]
                    ['content']),
            detailOptionPriceController: TextEditingController(
                text: shopGetMeModel
                    .value.optionList[i]['optionDetailList'][j]['price']
                    .toString()),
            detailOptionCount: shopGetMeModel.value.optionList[i]
                ['optionDetailList'][j]['count'],
            detailOptionAllowMultipleChoices: shopGetMeModel.value.optionList[i]['optionDetailList'][j]
                ['allowMultipleChoices']));
      }
      print(4);
    }
  }

  void onChangeShopMainImage() async {}

  void allowMultipleChoicesChanged(int index) {
    if (shopGetMeModel.value.optionList[index]['allowMultipleChoices'] ==
        true) {
      shopGetMeModel.update((val) {
        val!.optionList[index]['allowMultipleChoices'] = false;
      });
    } else {
      shopGetMeModel.update((val) {
        val!.optionList[index]['allowMultipleChoices'] = true;
      });
    }
  }

  void allowDetailMultipleChoicesChanged(int index, int detailIndex) {
    if (mainOptionList[index]
            .shopDetailOption![detailIndex]
            .detailOptionAllowMultipleChoices ==
        true) {
      mainOptionList[index]
          .shopDetailOption![detailIndex]
          .detailOptionAllowMultipleChoices = false;
    } else {
      mainOptionList[index]
          .shopDetailOption![detailIndex]
          .detailOptionAllowMultipleChoices = true;
    }
  }

  void decreaseDetailOptionCount(int index, int detailIndex) {
    if (shopGetMeModel.value.optionList[index]['optionDetailList'][detailIndex]
            ['count'] >
        1) {
      shopGetMeModel.update((val) {
        val!.optionList[index]['optionDetailList'][detailIndex]['count']--;
      });
    }
  }

  void increaseDetailOptionCount(int index, int detailIndex) {
    shopGetMeModel.update((val) {
      val!.optionList[index]['optionDetailList'][detailIndex]['count']++;
    });
  }

  void onDetailOptionAdd(int index) {
    /*shopGetMeModel.update((val) {
      val!.optionList[index]['optionDetailList'].add({

      });
    });
    mainOptionList[index]
        .optionDetailTitleController!
        .add(TextEditingController());
    mainOptionList[index]
        .optionDetailPriceController!
        .add(TextEditingController());
    mainOptionList[index].optionDetailCount!.add(1);
    mainOptionList[index].optionDetailAllowMultipleChoices!.add(false);*/
  }

  void onMainOptionAdd(int index) {
    /*mainOptionList.add(ShopOptionModel(
      title: '',
      optionTitleController: TextEditingController(),
      description: '',
      optionDescriptionController: TextEditingController(),
      price: 0,
      optionPriceController: TextEditingController(
          text: shopGetMeModel.value.basePrice.toString()),
      allowMultipleChoices: false,
      optionDetailTitleController: [TextEditingController()],
      optionDetailPriceController: [TextEditingController()],
      optionDetailCount: [0],
      optionDetailAllowMultipleChoices: optionDetailAllowMultipleChoices,
    ));*/
  }
}

class ShopMainOptionModel {
  TextEditingController? mainOptionTitleController;
  TextEditingController? mainOptionDescriptionController;
  bool? mainOptionAllowMultipleChoices;
  List<ShopDetailOptionModel>? shopDetailOption = [];

  ShopMainOptionModel(
      {this.mainOptionTitleController,
      this.mainOptionDescriptionController,
      this.mainOptionAllowMultipleChoices,
      this.shopDetailOption});
}

class ShopDetailOptionModel {
  TextEditingController? detailOptionContentController;
  TextEditingController? detailOptionPriceController;
  int? detailOptionCount;
  bool? detailOptionAllowMultipleChoices;

  ShopDetailOptionModel(
      {this.detailOptionContentController,
      this.detailOptionPriceController,
      this.detailOptionCount,
      this.detailOptionAllowMultipleChoices});
}
