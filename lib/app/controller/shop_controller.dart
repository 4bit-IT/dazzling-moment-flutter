import 'dart:io';
import 'dart:math';

import 'package:damo/app/data/model/shop_model.dart';
import 'package:damo/app/data/provider/shop/shop_api.dart';
<<<<<<< HEAD
import 'package:damo/main.dart';
import 'package:extended_image/extended_image.dart';
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
>>>>>>> 355cef0a0b1b230c36d589ad519bfb7666ebb08a
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ShopController extends GetxController {
  Rx<ShopRegistrationModel> shopRegistrationModel = ShopRegistrationModel().obs;
  Rx<ShopGetDetailModel> shopGetDetailModel = ShopGetDetailModel().obs;
  Rx<ShopImageRegistrationModel> shopImageRegistrationModel = ShopImageRegistrationModel().obs;
  Rx<ShopImageDeleteModel> shopImageDeleteModel = ShopImageDeleteModel().obs;
  Rx<ShopChangeMainImageModel> shopChangeMainImageModel = ShopChangeMainImageModel().obs;
  Rx<ShopGetMeModel> shopGetMeModel = ShopGetMeModel().obs;
  Rx<ShopOptionRegistration> shopOptionRegistration = ShopOptionRegistration().obs;
  RxList<ShopMainOptionModel> mainOptionList = <ShopMainOptionModel>[].obs;
  Rx<TextEditingController> shopNameController = TextEditingController().obs;
  Rx<TextEditingController> shopContentController = TextEditingController().obs;
  Rx<TextEditingController> shopDescriptionController = TextEditingController().obs;
  Rx<TextEditingController> shopBasePriceController = TextEditingController().obs;
  Rx<LoadShopMainPageModel> loadShopMainPageModel = LoadShopMainPageModel().obs;
  List<dynamic> stroageMainPage = [].obs;
  int maxImagesSize = 10;
  Rx<FileImage>? selectMainImage = FileImage(File(XFile('').path)).obs;
  List<dynamic>? selectImages = List.filled(10, FileImage(File(XFile('').path))).obs;
  RxInt imagesSize = 0.obs;
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
  String sendData = '';
  var jsonResponse;
  var model;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await loadShopMain(0, 'RATING');
  }

  Future<void> fetchShopData() async {
    jsonResponse = await ShopNetwork().getShopMe();
    model = ShopGetMeModel.fromJson(jsonResponse);
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
      shopNameController = TextEditingController(text: shopGetMeModel.value.name).obs;
    }
    if (shopGetMeModel.value.content != '') {
      shopContentController = TextEditingController(text: shopGetMeModel.value.content).obs;
    }
    if (shopGetMeModel.value.dataDescription != '') {
      shopDescriptionController = TextEditingController(text: shopGetMeModel.value.dataDescription).obs;
    }
    if (shopGetMeModel.value.basePrice != null) {
      shopBasePriceController = TextEditingController(text: shopGetMeModel.value.basePrice.toString()).obs;
    }

    // print(shopGetMeModel.value.optionList);
    for (int i = 0; i < shopGetMeModel.value.images.length; i++) {
      String random = Random().nextInt(2147483890).toString();
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      File file = File('$tempPath' +
          random +
          '.' +
          shopGetMeModel.value.images[i][shopGetMeModel.value.images[i].length - 3] +
          shopGetMeModel.value.images[i][shopGetMeModel.value.images[i].length - 2] +
          shopGetMeModel.value.images[i][shopGetMeModel.value.images[i].length - 1]);
      http.Response response = await http.get(Uri.parse(shopGetMeModel.value.images[i]));
      await file.writeAsBytes(response.bodyBytes);
      selectImages![i] = FileImage(file);
    }
    if (shopGetMeModel.value.shopProfileImage != null) {
      String random = Random().nextInt(2147483890).toString();
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      File file = File('$tempPath' +
          random +
          '.' +
          shopGetMeModel.value.shopProfileImage![shopGetMeModel.value.shopProfileImage!.length - 3] +
          shopGetMeModel.value.shopProfileImage![shopGetMeModel.value.images.length - 2] +
          shopGetMeModel.value.shopProfileImage![shopGetMeModel.value.images.length - 1]);
      http.Response response = await http.get(Uri.parse(shopGetMeModel.value.shopProfileImage!));
      await file.writeAsBytes(response.bodyBytes);
      selectMainImage!.value = FileImage(file);
    }
    imagesSize.value = shopGetMeModel.value.images.length;

    for (int i = 0; i < shopGetMeModel.value.optionList.length; i++) {
      RxList<ShopDetailOptionModel> temp = <ShopDetailOptionModel>[].obs;

      for (int j = 0; j < shopGetMeModel.value.optionList.length; j++) {
        temp.add(ShopDetailOptionModel(
          detailOptionContentController:
              TextEditingController(text: shopGetMeModel.value.optionList[i]['optionDetailList'][j]['content']),
          detailOptionPriceController: TextEditingController(
              text: shopGetMeModel.value.optionList[i]['optionDetailList'][j]['price'].toString()),
          detailOptionCount: shopGetMeModel.value.optionList[i]['optionDetailList'][j]['count'],
          detailOptionAllowMultipleChoices: shopGetMeModel.value.optionList[i]['optionDetailList'][j]
              ['allowMultipleChoices'],
        ));
      }
      mainOptionList.add(ShopMainOptionModel(
        mainOptionTitleController: TextEditingController(text: shopGetMeModel.value.optionList[i]['title']),
        mainOptionDescriptionController: TextEditingController(text: shopGetMeModel.value.optionList[i]['description']),
        mainOptionAllowMultipleChoices: shopGetMeModel.value.optionList[i]['allowMultipleChoices'],
        shopDetailOptionList: temp,
      ));
    }
  }

  Future<void> selectShopMainImage() async {
    final ImagePicker _picker = ImagePicker();
    print('프로필 사진을 선택합니다.');
    var image = (await _picker.pickImage(
      //이미지를 선택
      source: ImageSource.gallery, //위치는 갤러리
      maxHeight: 75,
      maxWidth: 75,
      imageQuality: 100, // 이미지 퀄리티
    ));
    if (image != null) {
      selectMainImage!.value = FileImage(File(image.path));
    }
  }

  Future<void> selectShopImages(int index) async {
    final ImagePicker _picker = ImagePicker();
    var image = (await _picker.pickImage(
      //이미지를 선택
      source: ImageSource.gallery, //위치는 갤러리
      maxHeight: 75,
      maxWidth: 75,
      imageQuality: 100, // 이미지 퀄리티
    ));
    if (image != null) {
      selectImages![index] = FileImage(File(image.path));
      if (index == imagesSize.value) imagesSize.value++;
    }
  }

  Future<void> deleteShopImages(int index) async {
    for (int i = index; i < imagesSize.value; i++) {
      if (i == maxImagesSize - 1) {
        selectImages![i] = FileImage(File(''));
      } else {
        selectImages![i] = selectImages![i + 1];
      }
    }
    imagesSize.value--;
  }

  Future<void> changeShopMainImage() async {
    var model;
    if (selectMainImage != null) {
      dynamic sendData = await ShopChangeMainImageModel().toJson(selectMainImage!.value.file.path);
      jsonResponse = await ShopNetwork().postShopImageMain(sendData);
      print(jsonResponse);
      model = ShopChangeMainImageModel.fromJson(jsonResponse);

      if (model.code == 1) {
        print(model.imageUrl);
        String random = Random().nextInt(2147483890).toString();
        shopGetMeModel.value.shopProfileImage = '${model.imageUrl}?v=$random';

        shopGetMeModel.refresh();
        print('프로필 사진을 변경했습니다.');
      }
      if (model.code == 2) {}
      if (model.code == 3) {}
    }
  }

  Future<void> changeShopImages() async {
    var model;
    if (selectImages != null) {
      List<dynamic> temp = [];
      for (int i = 0; i < imagesSize.value; i++) {
        temp.add(selectImages![i].file.path);
      }
      print(temp);
      dynamic sendData = await ShopImageRegistrationModel().toJson(temp);
      jsonResponse = await ShopNetwork().postShopImage(sendData);
      model = ShopImageRegistrationModel.fromJson(jsonResponse);

      if (model.code == 1) {
        for(int i=0;i<model.imageUrlList.length;i++){
          String random = Random().nextInt(2147483890).toString();
          shopGetMeModel.value.images[i] = '${model.imageUrlList[i]}?v=$random';
        }
        shopGetMeModel.refresh();
        print('프로필 사진을 변경했습니다.');
      }
      if (model.code == 2) {}
      if (model.code == 3) {}
      Get.back();

      /*if (_alertCheck == true) {
        //확인창에서 예 클릭시

      }
      if (_alertCheck == false) {
        //확인창에서 아니오 클릭시

      }*/
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
    if (mainOptionList[index].shopDetailOptionList[detailIndex].detailOptionCount > 1) {
      mainOptionList[index].shopDetailOptionList[detailIndex].detailOptionCount--;
      if (mainOptionList[index].shopDetailOptionList[detailIndex].detailOptionCount == 1) {
        mainOptionList[index].shopDetailOptionList[detailIndex].detailOptionAllowMultipleChoices = false;
      }
      mainOptionList.refresh();
    }
  }

  void increaseDetailOptionCount(int index, int detailIndex) {
    mainOptionList[index].shopDetailOptionList[detailIndex].detailOptionCount++;
    if (mainOptionList[index].shopDetailOptionList[detailIndex].detailOptionCount > 1) {
      mainOptionList[index].shopDetailOptionList[detailIndex].detailOptionAllowMultipleChoices = true;
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
    print(mainOptionList);
  }

  Future<void> onDetailOptionDelete(int index, int detailIndex) async {
    mainOptionList[index].shopDetailOptionList.removeAt(detailIndex);
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

  Future<void> loadShopDetail(int shopId) async {
    var input = ShopGetDetailModel().toJson(shopId);
    var jsonResponse = await ShopNetwork().getShopId(input);
    var model = ShopGetDetailModel.fromJson(jsonResponse);
    if (model.code == 1) {
      shopGetDetailModel.update((val) {
        val!.code = model.code;
        val.content = model.content;
        val.dataDescription = model.dataDescription;
        val.description = model.description;
        val.id = model.id;
        val.images = model.images;
        val.isFavorite = model.isFavorite;
        val.latitude = model.latitude;
        val.longitude = model.longitude;
        val.name = model.name;
        val.basePrice = model.basePrice;
        val.optionList = model.optionList;
        val.rating = model.rating;
        val.result = model.result;
        val.reviewCount = model.reviewCount;
        val.shopProfileImage = model.shopProfileImage;
      });
    }
    if (model.code == 2) {}
    if (model.code == 3) {}
  }

  Future<void> loadShopMain(int pageNumber, String sortBy) async {
    if (loadShopMainPageModel.value.hasNextPage == false) {
      return;
    }
    var jsonResponse = await ShopNetwork().getShopMain(pageNumber, sortBy);
    var model = LoadShopMainPageModel.fromJson(jsonResponse);

    if (model.code == 1) {
      loadShopMainPageModel.update((val) {
        val!.code = model.code;
        val.hasNextPage = model.hasNextPage;
        val.snippetList = model.snippetList;
        val.description = model.description;
        val.result = model.result;
      });
      for (dynamic snippetList in loadShopMainPageModel.value.snippetList) {
        if (snippetList['isFavorite'] == true) {
          snippetList['isFavoriteButton'] = wishIconOn.obs;
        } else if (snippetList['isFavorite'] == false) {
          snippetList['isFavoriteButton'] = wishIconOff.obs;
        }
        stroageMainPage.add(snippetList);
      }
    }
    if (model.code == 2) {}
    if (model.code == 3) {}
  }

  Future<void> optionRegistrationModify() async {
    toJsonInput.clear();
    List<Map<String, dynamic>> optionList = <Map<String, dynamic>>[];
    List<Map<String, dynamic>> optionDetailList = <Map<String, dynamic>>[];

    for (int i = 0; i < mainOptionList.length; i++) {
      for (int j = 0; j < mainOptionList[i].shopDetailOptionList.length; j++) {
        optionDetailList.add({
          'allowMultipleChoices': mainOptionList[i].shopDetailOptionList[j].detailOptionAllowMultipleChoices,
          'content': mainOptionList[i].shopDetailOptionList[j].detailOptionContentController!.value.text,
          'count': mainOptionList[i].shopDetailOptionList[j].detailOptionCount,
          'price': int.parse(mainOptionList[i].shopDetailOptionList[j].detailOptionPriceController!.value.text)
        });
      }
      optionList.add({
        'allowMultipleChoices': mainOptionList[i].mainOptionAllowMultipleChoices,
        'description': mainOptionList[i].mainOptionDescriptionController!.value.text,
        'title': mainOptionList[i].mainOptionTitleController!.value.text,
        'optionDetailList': optionDetailList,
      });
    }
    toJsonInput['basePrice'] = int.parse(shopBasePriceController.value.value.text);
    toJsonInput['optionList'] = optionList;
    sendData = ShopOptionRegistration().toJson(toJsonInput);
    jsonResponse = await ShopNetwork().postShopOption(sendData);
  }

  Future<void> shopManagementModifyClicked(BuildContext context) async {
    if (shopContentController.value.value.text == '' || shopDescriptionController.value.value.text == '') {
      FocusScope.of(context).unfocus();
      Get.dialog(
        Dialog(
          child: Container(
            height: 100,
            child: Center(
              child: Text(
                '스토어 설명과 상세 설명을 모두 작성해주세요.',
                style: TextStyle(
                    color: Color(0xff283137),
                    fontFamily: 'NotoSansCJKKR',
                    fontSize: 20.sp,
                    height: 1,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      );
    } else if (selectMainImage!.value.file.path == '') {
      FocusScope.of(context).unfocus();
      Get.dialog(
        Dialog(
          child: Container(
            height: 100,
            child: Center(
              child: Text(
                '업체 대표 이미지를 선택해주세요.',
                style: TextStyle(
                    color: Color(0xff283137),
                    fontFamily: 'NotoSansCJKKR',
                    fontSize: 20.sp,
                    height: 1,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      );
    } else if (imagesSize.value == 0) {
      FocusScope.of(context).unfocus();
      Get.dialog(
        Dialog(
          child: Container(
            height: 100,
            child: Center(
              child: Text(
                '상품 이미지는 최소 1개 첨부해주세요.',
                style: TextStyle(
                    color: Color(0xff283137),
                    fontFamily: 'NotoSansCJKKR',
                    fontSize: 20.sp,
                    height: 1,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      );
    } else if (shopBasePriceController.value.value.text == '') {
      FocusScope.of(context).unfocus();
      Get.dialog(
        Dialog(
          child: Container(
            height: 100,
            child: Center(
              child: Text(
                '상품 기본금액을 설정해주세요.',
                style: TextStyle(
                    color: Color(0xff283137),
                    fontFamily: 'NotoSansCJKKR',
                    fontSize: 20.sp,
                    height: 1,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      );
    } else {
      for (int i = 0; i < mainOptionList.length; i++) {
        if (mainOptionList[i].mainOptionTitleController!.value.text == '' ||
            mainOptionList[i].mainOptionDescriptionController!.value.text == '') {
          FocusScope.of(context).unfocus();
          Get.dialog(
            Dialog(
              child: Container(
                height: 100,
                child: Center(
                  child: Text(
                    '옵션 제목과 옵션 설명 모두 작성해주세요.',
                    style: TextStyle(
                        color: Color(0xff283137),
                        fontFamily: 'NotoSansCJKKR',
                        fontSize: 20.sp,
                        height: 1,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          );
          return;
        }
        for (int j = 0; j < mainOptionList[i].shopDetailOptionList.length; j++) {
          if (mainOptionList[i].shopDetailOptionList[j].detailOptionPriceController!.value.text == '' ||
              mainOptionList[i].shopDetailOptionList[j].detailOptionContentController!.value.text == '') {
            FocusScope.of(context).unfocus();
            Get.dialog(
              Dialog(
                child: Container(
                  height: 100,
                  child: Center(
                    child: Text(
                      '선택지의 제목과 금액을 모두 작성해주세요.',
                      style: TextStyle(
                          color: Color(0xff283137),
                          fontFamily: 'NotoSansCJKKR',
                          fontSize: 20.sp,
                          height: 1,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            );
            return;
          }
        }
      }
      await Get.dialog(
        Dialog(
          child: Container(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
            alignment: Alignment.center,
            height: 190.h,
            width: 130.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                  child: Text(
                    '수정을 완료하시겠습니까?',
                    style: TextStyle(
                        color: Color(0xff283137),
                        fontFamily: 'NotoSansCJKKR',
                        fontSize: 22.sp,
                        height: 1,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                        child: Text(
                          '아니오',
                          style: TextStyle(
                              color: Color(0xff283137),
                              fontFamily: 'NotoSansCJKKR',
                              fontSize: 16.sp,
                              height: 1,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await optionRegistrationModify();
                        await changeShopMainImage();
                        await changeShopImages();
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                        child: Text(
                          '예',
                          style: TextStyle(
                              color: Color(0xff283137),
                              fontFamily: 'NotoSansCJKKR',
                              fontSize: 16.sp,
                              height: 1,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
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
