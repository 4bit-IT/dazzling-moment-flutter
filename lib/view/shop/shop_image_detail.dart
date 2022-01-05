import 'package:damo/app/controller/owner/owner_shop_controller.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopImageDetail extends StatelessWidget {
  final OwnerShopController ownerShopController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ExtendedImage.network(
          Get.arguments == -1 ?
          ownerShopController.shopGetMeModel.value.shopProfileImage:
          ownerShopController.shopGetMeModel.value.images[Get.arguments],
        ),
      ),
    );
  }
}
