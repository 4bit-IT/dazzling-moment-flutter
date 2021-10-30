import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/view/seller/seller_product_modify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

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
  List<Widget> productImages = <Widget>[];

  @override
  void initState() {
    // TODO: implement initState
    sellerMainImage = Image.asset(
      'assets/images/DAMO_logo-01.png',
      width: 200,
      height: 200,
    );
    sellerName = '김다모';
    sellerDescription = '설명설명';
    receivedData.add(sellerMainImage);
    receivedData.add(sellerName);
    receivedData.add(sellerDescription);

    for (int i = 0; i < 3; i++) {
      productImages.add(
        Image.asset(
          'assets/images/pro.JPG',
        ),
      );
      productImages.add(
        Image.asset(
          'assets/images/DAMO_logo-01.png',
        ),
      );
      productImages.add(
        Image.asset(
          'assets/images/DAMO_logo-03.png',
        ),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamoAppBar().textAppBar(context, '내 상품 관리'),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 16.w, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                thickness: 1.h,
                color: Color(0xfff1f3f5),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                '스토어 대표 사진',
                style: TextStyle(
                  color: Color(0xff283137),
                  fontSize: 16.sp,
                  fontFamily: 'NotoSansCJKKR',
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffd1d1d6),
                    width: 1,
                  ),
                ),
                child: SvgPicture.asset(
                  'assets/images_svg/ic_상품이미지추가.svg',
                  width: 30.r,
                  height: 30.r,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  sellerMainImage,
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black38),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '업체명: $sellerName',
                  style: GoogleFonts.lato(
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black38),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '업체 설명: $sellerDescription 설명설명 설명설명 설명설명 설명설명 설명설명 설명설명 설명설명 설명설명 설명설명 설명설명 설명설명 설명설명 ',
                  style: GoogleFonts.lato(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black38),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '상품 이미지',
                            style: GoogleFonts.lato(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: productImages,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: CupertinoButton(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue[100],
                      child: Text(
                        '수정하기',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        Get.to(() => SellerProductModify());
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
