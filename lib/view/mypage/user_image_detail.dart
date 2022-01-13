import 'package:damo/app/controller/owner/owner_shop_controller.dart';
import 'package:damo/app/controller/user_controller.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UserImageDetail extends StatelessWidget {
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          color: Colors.black,
          child: userController.userImageModel.value.imageUrl != null
              ? ExtendedImage.network(
                  userController.userImageModel.value.imageUrl!,
                  cache: true,
                  fit: BoxFit.fill)
              : userController.userImageModel.value.image != null
                  ? Image(
                      image: userController.userImageModel.value.image,
                      fit: BoxFit.fill)
                  : userController.userImageModel.value.defaultImage!,
        ),
      ),
    );
  }
}
