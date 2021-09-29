import 'package:damo/screen/bar/app_bar.dart';
import 'package:flutter/material.dart';

class PurchaseHistory extends StatelessWidget {

  List<Widget> purchaseList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().noActionBar(context),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(15),
      ),
    );
  }
}
