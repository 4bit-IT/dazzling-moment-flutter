import 'package:damo/app/data/model/seller_model.dart';
import 'package:damo/app/data/provider/shop/shop_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class SellerController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  //var _sellerModel = SellerModel();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    /*if (_sellerModel.mainImage == '') {
      _sellerModel.mainImage = SvgPicture.asset(
        'assets/images_svg/ic_상품이미지추가.svg',
        width: 30.w,
        height: 30.h,
      );
    }*/
    /*if(_sellerModel.name == ''){

    }*/
  }

  void onChangeSellerMainImage() async {}
}
