import 'package:damo/screen/bar/app_bar.dart';
import 'package:damo/screen/seller/seller_modify.dart';
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
      appBar: DamoAppBar().appBar(context),
      body: MaterialButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SellerModify()));
      },
      child: Text('sss'),
      ),
    );
  }
}
