import 'package:damo/screen/bar/app_bar.dart';
import 'package:damo/screen/seller/seller_faq_modify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SellerFAQInfo extends StatefulWidget {
  const SellerFAQInfo({Key? key}) : super(key: key);

  @override
  _SellerFAQInfoState createState() => _SellerFAQInfoState();
}

class _SellerFAQInfoState extends State<SellerFAQInfo> {
  String faqTitle = 'FAQ 제목';
  String faqDocument = 'FAQ 내용';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().sellerAppBar(context),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Q: $faqTitle',
                style: GoogleFonts.lato(color: Colors.black, fontSize: 40),
              ),
              Divider(
                color: Colors.black12,
                thickness: 8,
              ),
              Text(
                'A: $faqDocument',
                style: GoogleFonts.lato(color: Colors.black, fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black38),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CupertinoButton(
                  child: Text(
                    '수정하기',
                    style: GoogleFonts.lato(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => SellerFAQModify());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
