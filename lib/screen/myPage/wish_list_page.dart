import 'package:damo/screen/bar/app_bar.dart';
import 'package:flutter/material.dart';

class WishListPage extends StatelessWidget {

  List<Widget> wishList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().noActionBar(context),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: wishList,
        ),
      ),
    );
  }
}
