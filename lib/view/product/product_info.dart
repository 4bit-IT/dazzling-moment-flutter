import 'package:damo/app/controller/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductInfo extends StatelessWidget {
  ShopController shopController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.w, 30.h, 10.w, 0),
      child: Text(
        shopController.shopGetDetailModel.value.content!,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xff283137),
          fontSize: 15.sp,
          height: 1.h,
          fontFamily: 'NotoSansCJKKR',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
