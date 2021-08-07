import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';

class ProductInfo extends StatefulWidget {
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  String reviewCount = '30';
  String questionCount = '30';
  String productName = '곰돌곰돌';
  Widget wishButton = Icon(
    Icons.favorite_outline,
    color: Colors.redAccent[200],
    size: 50,
  );
  final taste = ['초코', '바닐라', '딸기', '치약'];
  var currentSelectedValue;

  void onChange(String value) {
    currentSelectedValue = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent[100],
        elevation: 0.0,
        automaticallyImplyLeading: true,
        title: Text(
          '$productName',
          style: GoogleFonts.lato(color: Colors.black),
        ),
        actions: [
          CupertinoButton(
            minSize: 0,
            child: Column(
              children: [
                Icon(
                  CupertinoIcons.cart,
                  color: Colors.white,
                ),
              ],
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/pro.JPG',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '서면에서 입소문난 수제 케이크 집',
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CupertinoButton(
                                padding: EdgeInsets.all(0),
                                child: Text(
                                  '상품 설명',
                                  style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                              CupertinoButton(
                                padding: EdgeInsets.all(0),
                                child: Text(
                                  '리뷰 $reviewCount',
                                  style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                              CupertinoButton(
                                padding: EdgeInsets.all(0),
                                child: Text(
                                  'Q&A $questionCount',
                                  style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          for (int i = 0; i < 20; i++) Text('설명설명'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CupertinoButton(
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      if (wishButton.toString() ==
                          'Icon(IconData(U+0E25C), size: 50.0, color: Color(0xffff5252))') {
                        wishButton = Icon(
                          Icons.favorite,
                          color: Colors.redAccent[200],
                          size: 50,
                        );
                      } else {
                        wishButton = Icon(
                          Icons.favorite_border,
                          color: Colors.redAccent[200],
                          size: 50,
                        );
                      }
                    });
                  },
                  child: wishButton,
                ),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        15.0,
                      ),
                    ),
                    border: Border.all(color: Colors.black38),
                  ),
                  child: CupertinoButton(
                    child: Text(
                      '구매하기',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.redAccent[200],
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2,
                                      padding: EdgeInsets.all(15),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CupertinoButton(
                                                  minSize: 0,
                                                  padding: EdgeInsets.zero,
                                                  child: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      size: 40,
                                                      color: Colors.black38),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '필수 옵션 선택',
                                              style: GoogleFonts.lato(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 0, 10, 0),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1,
                                                  color: Colors.black38,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0),
                                                ),
                                              ),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                  hint: Text("케이크 맛"),
                                                  value: currentSelectedValue,
                                                  items: taste.map((value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      currentSelectedValue =
                                                          value;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CupertinoButton(
                                        padding:
                                            EdgeInsets.fromLTRB(30, 10, 30, 10),
                                        color: Colors.redAccent[100],
                                        child: Text(
                                          '장바구니 담기',
                                          style: GoogleFonts.lato(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            Fluttertoast.showToast(
                                              msg: '장바구니에 담았어요 !',
                                              toastLength: Toast.LENGTH_SHORT,
                                            );
                                            Navigator.pop(context);
                                          });
                                        },
                                      ),
                                      CupertinoButton(
                                        padding:
                                            EdgeInsets.fromLTRB(30, 10, 30, 10),
                                        color: Colors.redAccent[100],
                                        child: Text(
                                          '바로 구매하기',
                                          style: GoogleFonts.lato(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
