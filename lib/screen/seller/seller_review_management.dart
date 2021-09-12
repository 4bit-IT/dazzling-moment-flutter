import 'package:damo/screen/bar/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SellerReviewManagement extends StatefulWidget {
  @override
  _SellerReviewManagementState createState() => _SellerReviewManagementState();
}

class _SellerReviewManagementState extends State<SellerReviewManagement> {
  int reviewCount = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamoAppBar().sellerAppBar(context),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              '총 리뷰 $reviewCount 개',
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 15.0,
                      mainAxisExtent: 1000,
                      crossAxisSpacing: 6.0,
                      childAspectRatio: 1.0),
                  padding: const EdgeInsets.fromLTRB(5.5, 0.0, 5.5, 0.0),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {});
                      }, //클릭시 이동
                      child: Card(
                        shadowColor: Colors.black87,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '옵션+옵션+옵션+옵션 ... ',
                                style: GoogleFonts.lato(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '별점',
                                style: GoogleFonts.lato(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'id',
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.width,
                                child: Image.asset('assets/images/DAMO_logo-01.png'),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '리뷰리뷰',
                                style: GoogleFonts.lato(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
