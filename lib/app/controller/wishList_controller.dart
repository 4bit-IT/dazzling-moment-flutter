import 'package:damo/app/data/model/favorite_model.dart';
import 'package:damo/app/data/provider/favorite_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class WishListController extends GetxController {
  Rx<FavoritesProductListModel> favoritesProductListModel =
      FavoritesProductListModel().obs;
  RxList<dynamic> storageFavoriteList = [].obs;
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

  Future<void> getFavoritesList(int pageNumber) async {
    if (favoritesProductListModel.value.hasNextPage == false) return;
    var jsonResponse = await FavoriteNetwork().getFavorites(pageNumber);
    var model = FavoritesProductListModel.fromJson(jsonResponse);

    if (model.code == 1) {
      favoritesProductListModel.update((val) {
        val!.code = model.code;
        val.hasNextPage = model.hasNextPage;
        val.snippetList = model.snippetList;
        val.description = model.description;
        val.result = model.result;
      });
      storageFavoriteList.clear();

      for (dynamic favorites in favoritesProductListModel.value.snippetList) {
        storageFavoriteList.add(favorites);
      }
    }
    if (model.code == 2) {}
    if (model.code == 3) {}
  }

  @override
  void onInit() async {
    await getFavoritesList(0);
    super.onInit();
  }
}
