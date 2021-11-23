import 'package:damo/app/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:kpostal/kpostal.dart';

class EditMyAddress extends StatefulWidget {
  @override
  _EditMyAddressState createState() => _EditMyAddressState();
}

UserController userController = Get.find();

class _EditMyAddressState extends State<EditMyAddress> {
  String postCode = '-';
  String address = '-';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: KpostalView(
          kakaoKey: 'f531a0ec792da7f77d6b58255ae76aa0',
          callback: (Kpostal result) async {
            userController.getUserInfoModel!.value.zipcode = result.postCode;
            userController.getUserInfoModel!.value.addr1 = result.address;
            userController.addrEditCheck!.value = true;
            // await UserNetwork().postUsersAddress();
          },
        ),
      ),
    );
  }
}