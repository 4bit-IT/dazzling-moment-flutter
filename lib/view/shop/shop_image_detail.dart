import 'package:damo/app/controller/owner/owner_shop_controller.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShopImageDetail extends StatelessWidget {
  final OwnerShopController ownerShopController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          color: Colors.black,
          child: Get.arguments == -1
              ? (ownerShopController.selectMainImage!.value.imageUrl == null
                  ? Image(
                      image: ownerShopController.selectMainImage!.value.image,
                      fit: BoxFit.fill)
                  : ExtendedImage.network(
                      ownerShopController.selectMainImage!.value.imageUrl!,
                      cache: true,
                      fit: BoxFit.fill))
              : (ownerShopController.selectImages![Get.arguments].imageUrl == null
                  ? Image(
                      image: ownerShopController.selectImages![Get.arguments].image,
                      fit: BoxFit.fill)
                  : ExtendedImage.network(
                      ownerShopController.selectImages![Get.arguments].imageUrl!,
                      cache: true,
                      fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
