import 'package:damo/screen/bar/app_bar.dart';
import 'package:damo/screen/seller/seller_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SellerLogin extends StatefulWidget {
  @override
  _SellerLoginState createState() => _SellerLoginState();
}

class _SellerLoginState extends State<SellerLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().appBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text('로그인하기'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SellerMain(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
