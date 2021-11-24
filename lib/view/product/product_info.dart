import 'package:damo/app/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductInfo extends StatelessWidget {
  ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0, 0),
          child: Obx(
            () => Text(
              productController.productDescription[productController.index.value],
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
