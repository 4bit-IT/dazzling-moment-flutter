import 'package:damo/app/data/model/shop_model.dart';
import 'package:damo/app/data/provider/shop/shop_api.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OwnerShopController extends GetxController {
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
  Widget wishIconOn = SvgPicture.asset(
    'assets/images_svg/ic_wish_on.svg',
    width: 30.w,
    height: 30.h,
  );
  Widget wishIconOff = SvgPicture.asset(
    'assets/images_svg/ic_wish_off.svg',
    width: 30.w,
    height: 30.h,
  );
  Map<String, dynamic> toJsonInput = {};
  String sendData = '';
  var response;
  var model;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

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

    // print(shopGetMeModel.value.optionList);

    for (int i = 0; i < shopGetMeModel.value.optionList.length; i++) {
      RxList<ShopDetailOptionModel> temp = <ShopDetailOptionModel>[].obs;

      for (int j = 0; j < shopGetMeModel.value.optionList.length; j++) {
        temp.add(ShopDetailOptionModel(
          detailOptionContentController: TextEditingController(
              text: shopGetMeModel.value.optionList[i]['optionDetailList'][j]
              ['content']),
          detailOptionPriceController: TextEditingController(
              text: shopGetMeModel
                  .value.optionList[i]['optionDetailList'][j]['price']
                  .toString()),
          detailOptionCount: shopGetMeModel.value.optionList[i]
          ['optionDetailList'][j]['count'],
          detailOptionAllowMultipleChoices: shopGetMeModel.value.optionList[i]
          ['optionDetailList'][j]['allowMultipleChoices'],
        ));
      }
      mainOptionList.add(ShopMainOptionModel(
        mainOptionTitleController: TextEditingController(
            text: shopGetMeModel.value.optionList[i]['title']),
        mainOptionDescriptionController: TextEditingController(
            text: shopGetMeModel.value.optionList[i]['description']),
        mainOptionAllowMultipleChoices: shopGetMeModel.value.optionList[i]
        ['allowMultipleChoices'],
        shopDetailOptionList: temp,
      ));
    }
  }

  void onChangeShopMainImage() async {}

  void allowMultipleChoicesChanged(int index) {
    if (mainOptionList[index].mainOptionAllowMultipleChoices == true) {
      mainOptionList[index].mainOptionAllowMultipleChoices = false;
    } else {
      mainOptionList[index].mainOptionAllowMultipleChoices = true;
    }
    mainOptionList.refresh();
  }

  void decreaseDetailOptionCount(int index, int detailIndex) {
    if (mainOptionList[index]
        .shopDetailOptionList[detailIndex]
        .detailOptionCount >
        1) {
      mainOptionList[index]
          .shopDetailOptionList[detailIndex]
          .detailOptionCount--;
      if (mainOptionList[index]
          .shopDetailOptionList[detailIndex]
          .detailOptionCount ==
          1) {
        mainOptionList[index]
            .shopDetailOptionList[detailIndex]
            .detailOptionAllowMultipleChoices = false;
      }
      mainOptionList.refresh();
    }
  }

  void increaseDetailOptionCount(int index, int detailIndex) {
    mainOptionList[index].shopDetailOptionList[detailIndex].detailOptionCount++;
    if (mainOptionList[index]
        .shopDetailOptionList[detailIndex]
        .detailOptionCount >
        1) {
      mainOptionList[index]
          .shopDetailOptionList[detailIndex]
          .detailOptionAllowMultipleChoices = true;
    }
    mainOptionList.refresh();
  }

  void onDetailOptionAdd(int index) {
    mainOptionList[index].shopDetailOptionList.add(ShopDetailOptionModel(
      detailOptionContentController: TextEditingController(),
      detailOptionPriceController: TextEditingController(text: '0'),
      detailOptionCount: 1,
      detailOptionAllowMultipleChoices: false,
    ));
    mainOptionList.refresh();
  }

  void onMainOptionAdd() {
    mainOptionList.add(
      ShopMainOptionModel(
        mainOptionTitleController: TextEditingController(),
        mainOptionDescriptionController: TextEditingController(),
        mainOptionAllowMultipleChoices: false,
        shopDetailOptionList: <ShopDetailOptionModel>[
          ShopDetailOptionModel(
            detailOptionContentController: TextEditingController(),
            detailOptionPriceController: TextEditingController(text: '0'),
            detailOptionCount: 1,
            detailOptionAllowMultipleChoices: false,
          )
        ],
      ),
    );
  }

  Future<void> optionRegistrationModify() async {
    toJsonInput.clear();
    List<Map<String, dynamic>> optionList = <Map<String, dynamic>>[];
    List<Map<String, dynamic>> optionDetailList = <Map<String, dynamic>>[];

    for (int i = 0; i < mainOptionList.length; i++) {
      for (int j = 0; j < mainOptionList[i].shopDetailOptionList.length; j++) {
        optionDetailList.add({
          'allowMultipleChoices': mainOptionList[i]
              .shopDetailOptionList[j]
              .detailOptionAllowMultipleChoices,
          'content': mainOptionList[i]
              .shopDetailOptionList[j]
              .detailOptionContentController!
              .value
              .text,
          'count': mainOptionList[i].shopDetailOptionList[j].detailOptionCount,
          'price': int.parse(mainOptionList[i]
              .shopDetailOptionList[j]
              .detailOptionPriceController!
              .value
              .text)
        });
      }

      optionList.add({
        'allowMultipleChoices':
        mainOptionList[i].mainOptionAllowMultipleChoices,
        'description':
        mainOptionList[i].mainOptionDescriptionController!.value.text,
        'title': mainOptionList[i].mainOptionTitleController!.value.text,
        'optionDetailList': optionDetailList,
      });
    }
    toJsonInput['basePrice'] =
        int.parse(shopBasePriceController.value.value.text);
    toJsonInput['optionList'] = optionList;
    sendData = ShopOptionRegistration().toJson(toJsonInput);
    response = await ShopNetwork().postShopOption(sendData);
  }
}

class ShopMainOptionModel {
  TextEditingController? mainOptionTitleController;
  TextEditingController? mainOptionDescriptionController;
  bool? mainOptionAllowMultipleChoices;
  List<ShopDetailOptionModel> shopDetailOptionList = <ShopDetailOptionModel>[];

  ShopMainOptionModel({
    this.mainOptionTitleController,
    this.mainOptionDescriptionController,
    this.mainOptionAllowMultipleChoices,
    required this.shopDetailOptionList,
  });
}

class ShopDetailOptionModel {
  TextEditingController? detailOptionContentController;
  TextEditingController? detailOptionPriceController;
  int detailOptionCount = 1;
  bool? detailOptionAllowMultipleChoices;

  ShopDetailOptionModel(
      {this.detailOptionContentController,
        this.detailOptionPriceController,
        required this.detailOptionCount,
        this.detailOptionAllowMultipleChoices});
}
