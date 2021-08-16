import 'package:damo/screen/bar/app_bar.dart';
import 'package:damo/screen/seller/seller_product_modify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SellerProductMain extends StatefulWidget {
  const SellerProductMain({Key? key}) : super(key: key);

  @override
  _SellerProductMainState createState() => _SellerProductMainState();
}

class _SellerProductMainState extends State<SellerProductMain> {
  late Widget sellerMainImage; //업체 대표 사진
  late String sellerName; //업체 이름
  late String sellerDescription; //업체 설명(50자 이내)
  List<dynamic> receivedData = [];
  List<Widget> sellerList = []; //상품 설명

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sellerMainImage = Image.asset('assets/images/logo.png');
    sellerName = '김다모';
    sellerDescription = '설명설명';
    receivedData.add(sellerMainImage);
    receivedData.add(sellerName);
    receivedData.add(sellerDescription);

    print(receivedData);

    for (int i = 0; i < 3; i++) {
      if (i == 1) {
        sellerList.add(
          Text('업체명: ${receivedData[i]}'),
        );
        continue;
      }
      if (i == 2) {
        sellerList.add(
          Text('업체 설명: ${receivedData[i]}'),
        );
        continue;
      }
      if (receivedData[i] is String) {
        sellerList.add(Text(receivedData[i]));
      } else {
        sellerList.add(receivedData[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamoAppBar().sellerAppBar(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Column(
                children: sellerList,
              ),
              CupertinoButton(
                child: Text('수정하기'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SellerProductModify(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
