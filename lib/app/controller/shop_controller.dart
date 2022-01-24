import 'package:damo/app/data/model/shop_model.dart';
import 'package:damo/app/data/provider/shop/shop_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ShopController extends GetxController {
  Rx<ShopGetDetailModel> shopGetDetailModel = ShopGetDetailModel().obs;
  Rx<LoadShopMainPageModel> loadShopMainPageModel = LoadShopMainPageModel().obs;
  RxList<dynamic> storageMainPage = [].obs;
  RxInt currentSortIndex = 0.obs;
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
  List sortValueName = ['RATING', 'REVIEW', 'PRICE', 'NEWEST', 'OLDEST'];
  RxBool isLoadingShopData = false.obs;

  Map<String, dynamic> toJsonInput = {};

  String sendData = '';
  var jsonResponse;
  var model;

  @override
  void onInit() async {
    super.onInit();
    await loadShopMain(0, 'RATING');
  }

  Future<void> loadShopDetail(int shopId) async {
    isLoadingShopData.value = true;
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
    isLoadingShopData.value = false;
    print(isLoadingShopData.value);
  }

  Future<void> loadShopMain(int pageNumber, String sortBy) async {
    if (loadShopMainPageModel.value.hasNextPage == false) return;

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
        storageMainPage.add(snippetList);
      }
    }
    if (model.code == 2) {}
    if (model.code == 3) {}
  }

  Future<void> sortMainPage(int sortIndex) async {
    await Future.delayed(Duration(milliseconds: 300));
    String sortValue = sortValueName[sortIndex];
    loadShopMainPageModel.value.hasNextPage = true;
    storageMainPage.clear();
    await loadShopMain(0, sortValue);
  }
}


class ShopBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<ShopController>(ShopController());
  }
}

class ShopBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<ShopController>(ShopController());
  }
}