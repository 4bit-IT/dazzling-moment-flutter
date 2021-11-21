import 'package:damo/app/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:kpostal/kpostal.dart';

class EditMyAddress extends StatefulWidget {
  @override
  _EditMyAddressState createState() => _EditMyAddressState();
}

GetUsersData userData = Get.find();

class _EditMyAddressState extends State<EditMyAddress> {
  String postCode = '-';
  String address = '-';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: KpostalView(
          useLocalServer: true,
          localPort: 1024,
          // kakaoKey: 'f531a0ec792da7f77d6b58255ae76aa0',
          callback: (Kpostal result) async {
            userData.zipcode.value = result.postCode;
            userData.addr1.value = result.address;
            userData.addrEditCheck = true;
            // await UserNetwork().postUsersAddress();
          },
        ),
      ),
    );
  }
}
