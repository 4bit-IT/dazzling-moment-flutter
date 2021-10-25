import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

class PurchaseHistory extends StatefulWidget {
  @override
  State<PurchaseHistory> createState() => _PurchaseHistoryState();
}

class _PurchaseHistoryState extends State<PurchaseHistory> {
  List<Widget> purchaseList = [
    Image.asset(
      'assets/images/DAMO_logo-01.png',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/images/DAMO_logo-03.png',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/images/pro.JPG',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/images/logo.png',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/images/pro.JPG',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/images/DAMO_logo-01.png',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/images/DAMO_logo-02.png',
      fit: BoxFit.fill,
    ),
  ];

  ScrollController scrollController = ScrollController();

  Future<dynamic> onRejectAccept() {
    return showDialog(
      barrierDismissible: false, //여백눌려도 안닫힘.
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)), //테두리 둥글기
        title: Text(
          "주문을 수락하시겠습니까?",
        ),
        actions: [
          TextButton(
              child: Text(
                "예",
                style:
                    TextStyle(fontFamily: 'NotoSans', color: Colors.red[400]),
              ),
              onPressed: () {}),
          TextButton(
            child: Text(
              "취소",
              style: TextStyle(fontFamily: 'NotoSans', color: Colors.red[400]),
            ),
            onPressed: () => Navigator.pop(context, false),
          ),
        ],
      ),
    );
  }

  Future<dynamic> onOrderInfo() {
    return showDialog(
        barrierDismissible: false, //여백눌려도 안닫힘.
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)), //테두리 둥글기
              title: Text(
                "주문을 거절하시겠습니까?",
              ),
              actions: [
                TextButton(
                    child: Text(
                      "예",
                      style: TextStyle(
                          fontFamily: 'NotoSans', color: Colors.red[400]),
                    ),
                    onPressed: () {}),
                TextButton(
                  child: Text(
                    "취소",
                    style: TextStyle(
                        fontFamily: 'NotoSans', color: Colors.red[400]),
                  ),
                  onPressed: () => Navigator.pop(context, false),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamoAppBar().sellerAppBar(context),
      body: GridView.builder(
          controller: scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 15.0,
              mainAxisExtent: 350.0,
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
                        '주문 중',
                        style: GoogleFonts.lato(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '업체 명',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '옵션+옵션+옵션+옵션 ... ',
                        style: GoogleFonts.lato(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '예약 날짜: ',
                        style: GoogleFonts.lato(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '가격: ',
                        style: GoogleFonts.lato(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black38),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: CupertinoButton(
                            padding: EdgeInsets.all(0),
                            child: Text(
                              '주문 취소하기',
                              style: GoogleFonts.lato(color: Colors.black),
                            ),
                            onPressed: () {
                              onRejectAccept();
                            }),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black38),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: CupertinoButton(
                            padding: EdgeInsets.all(0),
                            child: Text(
                              '주문 상세보기',
                              style: GoogleFonts.lato(color: Colors.black),
                            ),
                            onPressed: () {
                              onOrderInfo();
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
