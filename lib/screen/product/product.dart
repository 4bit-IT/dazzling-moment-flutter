import 'package:damo/screen/bar/scroll_behavior.dart';
import 'package:damo/screen/product/product_info.dart';
import 'package:damo/screen/product/product_qa.dart';
import 'package:damo/screen/product/product_review.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:like_button/like_button.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  Future<bool> onLikeButtonTapped(bool isLiked) async {
    if (isLiked) {
      Fluttertoast.showToast(
        msg: '찜목록에서 제거했어요!',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red[200],
        gravity: ToastGravity.BOTTOM,
        fontSize: 15.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: '찜목록에 담았어요!',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red[200],
        fontSize: 15.0,
      );
    }
    return !isLiked;
  }

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

  List a = [
    Image.asset('assets/images/logo.png'),
    Image.asset('assets/images/logo.png'),
    Image.asset('assets/images/logo.png'),
    Image.asset('assets/images/logo.png'),
    Image.asset('assets/images/logo.png'),
  ];

  void onChange(String value) {
    currentSelectedValue = value;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      backgroundColor: Colors.grey[100],
      centerTitle: true,
      curvedBodyRadius: 20.0,
      headerExpandedHeight: 0.7,
      stretchTriggerOffset: 80,
      title: Text('서면에서 입소문난 수제케이크'),
      headerWidget: headerWidget(context),
      body: [
        body(context),
      ],
      fullyStretchable: true,
      expandedBody: expandedWidget(context),
      floatingActionButton: IconButton(
          iconSize: 40.0,
          color: Colors.red[200],
          onPressed: () {
            //맨위로 이동하는 버튼 함수
          },
          icon: Icon(Icons.arrow_circle_up)),
    );
  }

  Container body(BuildContext context) => Container(
        child: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Column(
            children: [
              TabBar(
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
              Container(
                height:
                    MediaQuery.of(context).size.height, //height of TabBarView
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.grey, width: 0.5))),
                child: TabBarView(
                  children: [
                    ProductInfo(), //상품설명
                    ProductReview(), //리뷰
                    ProductQnA(), //QnA
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Scaffold headerWidget(BuildContext context) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.red[200],
          title: Text(productName),
        ),
        body: Column(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              SizedBox(height: 20.0),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: Swiper(
                  itemHeight: MediaQuery.of(context).size.height,
                  itemWidth: MediaQuery.of(context).size.width,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      child: Stack(
                        children: [
                          // ConstrainedBox(
                          //   constraints: BoxConstraints.expand(),
                          //   child: Image.asset(
                          //     "assets/images/white.jpg", //배경사진
                          //     fit: BoxFit.fill,
                          //   ),
                          // ),
                          Swiper.children(
                            autoplay: true,
                            pagination: SwiperPagination(
                                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                builder: DotSwiperPaginationBuilder(
                                    color: Colors.grey,
                                    activeColor: Colors.red[200],
                                    size: 15.0,
                                    activeSize: 22.0)),
                            children: [
                              Image.asset(
                                "assets/images/logo.png",
                                fit: BoxFit.contain,
                              ),
                              Image.asset(
                                "assets/images/DAMO_logo-01.png",
                                fit: BoxFit.contain,
                              ),
                              Image.asset("assets/images/DAMO_logo-02.png",
                                  fit: BoxFit.contain)
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  // indicatorLayout: PageIndicatorLayout.COLOR,
                  itemCount: 10,
                ),
              ),
              SizedBox(
                height: 20.0,
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
              Divider(
                thickness: 3.0,
                color: Colors.grey[200],
              ),
            ]),
          ],
        ),
      );

  Scaffold expandedWidget(BuildContext context) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.red[200],
          title: Text(productName),
        ),
        body: Column(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              SizedBox(height: 20.0),
              Container(
                height: MediaQuery.of(context).size.height / 1.3,
                child: Swiper(
                  itemHeight: MediaQuery.of(context).size.height,
                  itemWidth: MediaQuery.of(context).size.width,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      child: Stack(
                        children: [
                          // ConstrainedBox(
                          //   constraints: BoxConstraints.expand(),
                          //   child: Image.asset(
                          //     "assets/images/white.jpg", //배경사진
                          //     fit: BoxFit.fill,
                          //   ),
                          // ),
                          Swiper.children(
                            autoplay: false,
                            pagination: SwiperPagination(
                                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                builder: DotSwiperPaginationBuilder(
                                    color: Colors.grey,
                                    activeColor: Colors.red[200],
                                    size: 15.0,
                                    activeSize: 22.0)),
                            children: [
                              Image.asset(
                                "assets/images/logo.png",
                                fit: BoxFit.contain,
                              ),
                              Image.asset(
                                "assets/images/DAMO_logo-01.png",
                                fit: BoxFit.contain,
                              ),
                              Image.asset("assets/images/DAMO_logo-02.png",
                                  fit: BoxFit.contain)
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  // indicatorLayout: PageIndicatorLayout.COLOR,
                  itemCount: 10,
                ),
              ),
              Divider(
                thickness: 3.0,
                color: Colors.grey[200],
              ),
            ]),
          ],
        ),
      );
}
