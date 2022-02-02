import 'dart:io';
import 'dart:math';
import 'package:damo/app/controller/notification/notofication_controller.dart';
import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/app/data/model/shop_model.dart';
import 'package:damo/app/data/provider/owner/owner_shop_api.dart';
import 'package:damo/viewmodel/get_dialog.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class OwnerShopController extends GetxController {
  TokenController tokenController = Get.find();
  Rx<ShopRegistrationModel> shopRegistrationModel = ShopRegistrationModel().obs;
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
  Rx<LoadShopMainPageModel> loadShopMainPageModel = LoadShopMainPageModel().obs;
  int maxImagesSize = 10;
  Rx<ShopImageModel>? selectMainImage = ShopImageModel().obs;
  RxList<ShopImageModel>? selectImages = <ShopImageModel>[].obs;
  List<String> deleteImages = [];
  RxInt imagesSize = 0.obs;
  RxBool isLoadingModifyData = false.obs;

  Map<String, dynamic> toJsonInput = {};
  String sendData = '';
  var jsonResponse;
  var model;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await fetchModifyData();
  }

  Future<void> fetchModifyData() async {
    isLoadingModifyData.value = true;
    jsonResponse = await OwnerShopNetwork().getShopMe();
    model = ShopGetMeModel.fromJson(jsonResponse);
    if (model.code == 1) {
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
            TextEditingController(text: shopGetMeModel.value.dataDescription)
                .obs;
      }
      if (shopGetMeModel.value.basePrice != '') {
        shopBasePriceController =
            TextEditingController(text: shopGetMeModel.value.basePrice).obs;
      }
      selectMainImage!.value = ShopImageModel();
      shopContentController.value =
          TextEditingController(text: shopGetMeModel.value.content);
      shopDescriptionController.value =
          TextEditingController(text: shopGetMeModel.value.dataDescription);
      selectImages = <ShopImageModel>[].obs;
      imagesSize.value = 0;
      mainOptionList.clear();

      if (shopGetMeModel.value.images != null)
        for (int i = 0; i < shopGetMeModel.value.images.length; i++) {
/*        String random = Random().nextInt(2147483890).toString();
        Directory tempDir = await getTemporaryDirectory();
        String tempPath = tempDir.path;
        File file = File('$tempPath' +
            random +
            '.' +
            shopGetMeModel.value.images[i]
                [shopGetMeModel.value.images[i].length - 3] +
            shopGetMeModel.value.images[i]
                [shopGetMeModel.value.images[i].length - 2] +
            shopGetMeModel.value.images[i]
                [shopGetMeModel.value.images[i].length - 1]);
        http.Response response =
            await http.get(Uri.parse(shopGetMeModel.value.images[i]));
        await file.writeAsBytes(response.bodyBytes);
        selectImages![i] = FileImage(file);*/
          selectImages!
              .add(ShopImageModel(imageUrl: shopGetMeModel.value.images[i]));
        }
      if (shopGetMeModel.value.shopProfileImage != null) {
        selectMainImage!.value.imageUrl = shopGetMeModel.value.shopProfileImage;
      }
      imagesSize.value = shopGetMeModel.value.images.length;

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
    } else if (model.code == 2) {
    } else {
      await tokenController.refreshGetAccessToken();
      await fetchModifyData();
    }

    isLoadingModifyData.value = false;
  }

  Future<void> selectShopMainImage() async {
    final ImagePicker _picker = ImagePicker();
    var image = (await _picker.pickImage(
      //이미지를 선택
      source: ImageSource.gallery, //위치는 갤러리
      imageQuality: 100, // 이미지 퀄리티
    ));
    if (image != null) {
      selectMainImage!.value.imageUrl = null;
      selectMainImage!.value.image = FileImage(File(image.path));
      selectMainImage!.refresh();
    }
  }

  Future<void> selectShopImages(int index) async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(
      //이미지를 선택
      source: ImageSource.gallery,
      maxHeight: 1000.w,
      maxWidth: 1000.w,
      imageQuality: 100, // 이미지 퀄리티
    );
    print(image?.path);
    print(image);
    if (image != null) {
      if (index == imagesSize.value) {
        selectImages!.add(ShopImageModel());
        imagesSize.value++;
      }
      selectImages![index].imageUrl = null;
      selectImages![index].image = FileImage(File(image.path));
      selectImages!.refresh();
    }
  }

  Future<void> deleteShopImages(int index) async {
    if (selectImages![index].imageUrl != null)
      deleteImages.add(selectImages![index].imageUrl!);
    selectImages!.removeAt(index);
    /*for (int i = index; i < imagesSize.value - 1; i++) {
      selectImages![i] = selectImages![i + 1];
    }*/
    imagesSize.value--;
    Get.back();
  }

  Future<void> changeShopMainImage() async {
    var model;
    if (selectMainImage != null) {
      dynamic sendData = await ShopChangeMainImageModel()
          .toJson(selectMainImage!.value.image.file.path);
      jsonResponse = await OwnerShopNetwork().postShopImageMain(sendData);
      model = ShopChangeMainImageModel.fromJson(jsonResponse);

      if (model.code == 1) {
        String random = Random().nextInt(2147483890).toString();
        shopGetMeModel.value.shopProfileImage = '${model.imageUrl}?v=$random';

        shopGetMeModel.refresh();
      }
      if (model.code == 2) {}
      if (model.code == 3) {
        await tokenController.refreshGetAccessToken();
        await changeShopMainImage();
      }
    }
  }

  Future<void> changeShopImages() async {
    var model;
    if (selectImages != null) {
      List<dynamic> temp = [];
      for (int i = 0; i < imagesSize.value; i++) {
        if (selectImages![i].image != null)
          temp.add(selectImages![i].image.file.path);
      }
      print(temp);
      dynamic sendData = await ShopImageRegistrationModel().toJson(temp);
      jsonResponse = await OwnerShopNetwork().postShopImage(sendData);
      model = ShopImageRegistrationModel.fromJson(jsonResponse);

      if (model.code == 1) {
        for (int i = 0; i < model.imageUrlList.length; i++) {
          String random = Random().nextInt(2147483890).toString();
          shopGetMeModel.value.images[i] = '${model.imageUrlList[i]}?v=$random';
        }
        shopGetMeModel.refresh();
      }
      if (model.code == 2) {}
      if (model.code == 3) {
        await tokenController.refreshGetAccessToken();
        await changeShopImages();
      }
      Get.back();
    }
  }

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

  Future<void> onMainOptionDelete(int index) async {
    mainOptionList[index].shopDetailOptionList.clear();
    mainOptionList.removeAt(index);
  }

  Future<void> onDetailOptionDelete(int index, int detailIndex) async {
    mainOptionList[index].shopDetailOptionList.removeAt(detailIndex);
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
    jsonResponse = await OwnerShopNetwork().postShopOption(sendData);
    model = ShopOptionRegistration.fromJson(jsonResponse);
    if (model.code == 3) {
      await tokenController.refreshGetAccessToken();
      await optionRegistrationModify();
    }
  }

  Future<void> shopManagementModifyClicked(BuildContext context) async {
    if (shopContentController.value.value.text == '' ||
        shopDescriptionController.value.value.text == '') {
      FocusScope.of(context).unfocus();
      GetDialog().simpleDialog('스토어 설명과 상세 설명을 모두 작성해주세요.');
    } else if (selectMainImage!.value.image == null &&
        selectMainImage!.value.imageUrl == null) {
      FocusScope.of(context).unfocus();
      GetDialog().simpleDialog('업체 대표 이미지를 선택해주세요.');
    } else if (imagesSize.value == 0) {
      FocusScope.of(context).unfocus();
      GetDialog().simpleDialog('상품 이미지는 최소 1개 첨부해주세요.');
    } else if (shopBasePriceController.value.value.text == '') {
      FocusScope.of(context).unfocus();
      GetDialog().simpleDialog('상품 기본 금액을 설정해주세요.');
    } else {
      for (int i = 0; i < mainOptionList.length; i++) {
        if (mainOptionList[i].mainOptionTitleController!.value.text == '' ||
            mainOptionList[i].mainOptionDescriptionController!.value.text ==
                '') {
          FocusScope.of(context).unfocus();
          GetDialog().simpleDialog('옵션 제목과 옵션 설명 모두 작성해주세요.');
          return;
        }
        for (int j = 0;
            j < mainOptionList[i].shopDetailOptionList.length;
            j++) {
          if (mainOptionList[i]
                      .shopDetailOptionList[j]
                      .detailOptionPriceController!
                      .value
                      .text ==
                  '' ||
              mainOptionList[i]
                      .shopDetailOptionList[j]
                      .detailOptionContentController!
                      .value
                      .text ==
                  '') {
            FocusScope.of(context).unfocus();
            GetDialog().simpleDialog('선택지의 제목과 금액을 모두 작성해주세요.');
            return;
          }
        }
      }
      FocusScope.of(context).unfocus();
      GetDialog().alternativeDialog('수정을 완료하시겠습니까?', () async => await finishModify());
    }
  }

  Future<void> introModify() async {
    toJsonInput.clear();
    toJsonInput['content'] = shopContentController.value.value.text;
    toJsonInput['description'] = shopDescriptionController.value.value.text;
    sendData = ShopIntroModel().toJson(toJsonInput);
    jsonResponse = await OwnerShopNetwork().patchShopIntro(sendData);
    model = ShopIntroModel.fromJson(jsonResponse);
    if (model.code == 1) {
    } else if (model.code == 2) {
    } else {
      await tokenController.refreshGetAccessToken();
      await introModify();
    }
  }

  Future<void> finishModify() async {
    await optionRegistrationModify();
    await introModify();
    await changeShopMainImage();
    await changeShopImages();
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

class ShopImageModel {
  String? imageUrl;
  dynamic image;
  int? index;

  ShopImageModel({this.imageUrl, this.image, this.index});
}

class OwnerShopBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    // TODO: implement dependencies
    Get.put<OwnerShopController>(OwnerShopController());
  }
}
