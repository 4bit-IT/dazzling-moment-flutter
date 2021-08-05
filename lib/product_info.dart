import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class ProductInfo extends StatefulWidget {
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  String reviewCount = '30';
  String questionCount = '30';
  String productName = '곰돌곰돌';
  Widget wishButton = Icon(
    Icons.favorite_border,
    color: Colors.redAccent[200],
  );
  Widget wishButton2 = Icon(Icons.favorite_border);
  int bottomNavigationBarIndex = 0;

  onBottomNavigationBarTapped(int index) {
    setState(() {
      bottomNavigationBarIndex = index;
      if (index == 1) {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              print(MediaQuery.of(context).viewInsets.bottom);
              return SingleChildScrollView(
                  child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  children: [
                    Icon(Icons.vertical_align_bottom),
                    Text('필수 옵션 선택 *'),
                    Text('필수 옵션 선택 *'),
                    Text('필수 옵션 선택 *'),
                    Text('필수 옵션 선택 *'),
                    Text('필수 옵션 선택 *'),
                    Text('필수 옵션 선택 *'),
                    BottomNavigationBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      type: BottomNavigationBarType.fixed,
                      items: const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Icon(Icons.shopping_bag_outlined),
                          label: '상품구매',
                        ),
                        BottomNavigationBarItem(
                            icon: Icon(CupertinoIcons.cart), label: '장바구니'),
                      ],
                      selectedItemColor: Colors.redAccent[200],
                      currentIndex: bottomNavigationBarIndex,
                    ),
                  ],
                ),
              ));
            });
      } else {}
    });
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
            // padding: EdgeInsets.all(0),
            child: Column(
              children: [
                // Text(
                //   '장바구니',
                //   style: GoogleFonts.lato(
                //     color: Colors.black,
                //   ),
                // ),
                Icon(
                  CupertinoIcons.cart,
                  color: Colors.black,
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
                                  '리뷰 ${reviewCount}',
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
                                  'Q&A ${questionCount}',
                                  style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                onPressed: () {
                                  print(MediaQuery.of(context).size.height);
                                },
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
                IconButton(
                  onPressed: () {
                    setState(() {
                      print(wishButton);
                      if (wishButton.toString() ==
                          'Icon(IconData(U+0E25B), color: Color(0xffff5252))') {
                        wishButton = Icon(
                          Icons.favorite_border,
                          color: Colors.redAccent[200],
                        );
                      } else {
                        wishButton = Icon(
                          Icons.favorite,
                          color: Colors.redAccent[200],
                        );
                      }
                    });
                  },
                  icon: wishButton,
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
                    onPressed: () {},
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
