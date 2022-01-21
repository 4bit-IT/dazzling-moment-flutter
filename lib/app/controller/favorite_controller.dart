import 'package:damo/app/controller/shop_controller.dart';
import 'package:damo/app/data/model/favorite_model.dart';
import 'package:damo/app/data/provider/favorite_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FavoriteController extends GetxController {
  ShopController shopController = Get.find();
  late Rx<Widget> wishIcon;

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

  var jsonResponse;
  var model;

  Future<dynamic> onClickedFavoriteButton(int shopId) async {
    shopController.shopGetDetailModel.value.isFavorite == false
        ? jsonResponse = await FavoriteNetwork().postFavoritesOnce(shopId)
        : jsonResponse = await FavoriteNetwork().deleteFavoritesOnce(shopId);
    model = FavoriteModel.fromJson(jsonResponse);
    if (model.code == 1) {
      if (shopController.shopGetDetailModel.value.isFavorite == true) {
        shopController.shopGetDetailModel.value.isFavorite = false;
        shopController.shopGetDetailModel.refresh();
        wishIcon.value = wishIconOff;
        for (dynamic shop in shopController.storageMainPage) {
          shop['id'] == shopId
              ? shop['isFavoriteButton'].value = wishIconOff
              : null;
        }
        print('찜목록에서 제거했습니다.');
      } else if (shopController.shopGetDetailModel.value.isFavorite == false) {
        shopController.shopGetDetailModel.value.isFavorite = true;
        shopController.shopGetDetailModel.refresh();
        wishIcon.value = wishIconOn;
        for (dynamic shop in shopController.storageMainPage) {
          shop['id'] == shopId
              ? shop['isFavoriteButton'].value = wishIconOn
              : null;
        }
        print('찜목록에 추가했습니다.');
      }
    }
    if (model.code == 2) {}
    if (model.code == 3) {}
  }

  Future<void> initWishIcon() async {
    shopController.shopGetDetailModel.value.isFavorite == true
        ? wishIcon = wishIconOn.obs
        : wishIcon = wishIconOff.obs;
  }

  @override
  void onInit() async {
    super.onInit();
    await initWishIcon();
  }
}
