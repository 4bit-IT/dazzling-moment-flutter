import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetUserInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().noActionBar(context),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(

        ),
      ),
    );
  }
}
