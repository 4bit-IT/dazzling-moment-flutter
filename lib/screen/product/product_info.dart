import 'package:damo/screen/bar/scroll_behavior.dart';
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
    color: Colors.red[200],
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
        backgroundColor: Colors.red[200],
        elevation: 0.0,
        automaticallyImplyLeading: true,
        title: Text(
          '$productName',
          style: GoogleFonts.lato(color: Colors.white),
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
      body: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 20.0),
                    Image.asset(
                      'assets/images/pro.JPG',
                    ),
                    Center(
                      child: Text(
                        '서면에서 입소문난 수제 케이크 집',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Divider(
                      thickness: 3.0,
                      color: Colors.grey[200],
                    ),
                    DefaultTabController(
                      length: 3,
                      initialIndex: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            child: TabBar(
                              indicatorColor: Colors.red[100],
                              automaticIndicatorColorAdjustment: false,
                              labelColor: Colors.red,
                              unselectedLabelColor: Colors.black,
                              tabs: [
                                Tab(text: '상품설명'),
                                Tab(text: '리뷰 ($reviewCount)'),
                                Tab(text: 'Q&A ($questionCount)'),
                              ],
                            ),
                          ),
                          Container(
                            height: 400, //height of TabBarView
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.grey, width: 0.5))),
                            child: TabBarView(
                              children: <Widget>[
                                Container(
                                  child: Center(
                                    child: Text('설명',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Text('리뷰',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Text(
                                      'Q&A',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 0.5,
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
                            'Icon(IconData(U+0E25C), size: 50.0, color: Color(0xffef9a9a))') {
                          wishButton = Icon(
                            Icons.favorite,
                            color: Colors.red[200],
                            size: 50,
                          );
                        } else {
                          wishButton = Icon(
                            Icons.favorite_border,
                            color: Colors.red[200],
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
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      color: Colors.red[200],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "구매하기",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
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
                                                        Icons
                                                            .keyboard_arrow_down,
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
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                                        taste.remove(value);
                                                        taste.insert(
                                                            0, '$value');
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
                                          padding: EdgeInsets.fromLTRB(
                                              30, 10, 30, 10),
                                          color: Colors.red[200],
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
                                          padding: EdgeInsets.fromLTRB(
                                              30, 10, 30, 10),
                                          color: Colors.red[200],
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
      ),
    );
  }
}
