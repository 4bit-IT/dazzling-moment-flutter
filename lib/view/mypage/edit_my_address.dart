import 'package:damo/app/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:kpostal/kpostal.dart';
import 'package:get/get.dart';

class EditMyAddress {
  UserController userController = Get.find();
  String postCode = '-';
  String address = '-';

  /*void d() {
    KpostalView(
      kakaoKey: 'f531a0ec792da7f77d6b58255ae76aa0',
      callback: (Kpostal result) async {
        userController.zipcode.value = result.postCode;
        userController.addr1.value = result.address;
        userController.addrEditCheck!.value = true;
      },
    );
  }*/
}
