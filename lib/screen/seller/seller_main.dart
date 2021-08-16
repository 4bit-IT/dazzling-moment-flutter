import 'package:damo/screen/bar/app_bar.dart';
import 'package:damo/screen/seller/seller_product_main.dart';
import 'package:damo/screen/seller/seller_product_modify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SellerMain extends StatefulWidget {
  @override
  _SellerMainState createState() => _SellerMainState();
}

class _SellerMainState extends State<SellerMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamoAppBar().sellerAppBar(context),
      body: Center(
        child: Column(
          children: [
            CupertinoButton(
              child: Text(
                '내 정보 보기',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
            CupertinoButton(
              child: Text(
                '내 상품 관리하기',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SellerProductMain(),
                  ),
                );
              },
            ),
            CupertinoButton(
              child: Text(
                '예약 관리하기',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
            CupertinoButton(
              child: Text(
                '판매 내역 보기',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
            CupertinoButton(
              child: Text(
                '쪽지 관리하기',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
            CupertinoButton(
              child: Text(
                '리뷰 관리하기',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
