import 'package:damo/screen/bar/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bar/app_bar.dart';
import '../bar/bottom_navigaton.dart';
import 'package:damo/screen/bar/back_button_clicked.dart';

class MyPage extends StatefulWidget {
  MyPage({this.bottomNavigationIndex});

  final bottomNavigationIndex;

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  DamoAppBar appBar = DamoAppBar();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: BackButtonClicked().onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: DrawerButton(),
        appBar: appBar.appBar(context),
        bottomNavigationBar: BottomNavigation(bottomNavigationIndex: 3),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/images/logo.png'),
                            iconSize: 100,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '김다모',
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('4bitdamo@naver.com'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.black38,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: CupertinoButton(
                          onPressed: () {},
                          child: Text(
                            '개인정보 변경',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CupertinoButton(
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red[100],
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '찜 목록',
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Icon(
                                  Icons.favorite_outline,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        CupertinoButton(
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red[100],
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '장바구니',
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Icon(
                                  CupertinoIcons.cart,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        CupertinoButton(
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red[100],
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '구매 내역',
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Icon(
                                  Icons.shopping_bag_outlined,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.black12,
                thickness: 8,
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        child: CupertinoButton(
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.mic_none,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '공지사항',
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 1.0,
                      ),
                      Container(
                        height: 60,
                        child: CupertinoButton(
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.event,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '이벤트',
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 1.0,
                      ),
                      Container(
                        height: 60,
                        child: CupertinoButton(
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.text_alignleft,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '내가 쓴 글',
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 1.0,
                      ),
                      Container(
                        height: 60,
                        child: CupertinoButton(
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.chat_bubble_text,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '내가 쓴 댓글',
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 1.0,
                      ),
                      Container(
                        height: 60,
                        child: CupertinoButton(
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.doc_plaintext,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '이용약관',
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 1.0,
                      ),
                      Container(
                        height: 60,
                        child: CupertinoButton(
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.exclamationmark_circle,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '버전정보',
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 1.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
