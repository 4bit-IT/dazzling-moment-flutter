import 'package:damo/screen/product/product_info.dart';
import 'package:damo/screen/product/product_qa.dart';
import 'package:damo/screen/product/product_review.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:card_swiper/card_swiper.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> with TickerProviderStateMixin {
  late TabController _controller;
  String reviewCount = '30';
  String questionCount = '30';
  String productName = '곰돌곰돌';

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
  void initState() {
    super.initState();

    _controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      centerTitle: true,
      fullyStretchable: false,
      curvedBodyRadius: 20.0,
      backgroundColor: Colors.white,
      headerExpandedHeight: 0.68,
      title: Text('서면에서 입소문난 수제케이크'),
      headerWidget: headerWidget(context),
      body: [
        tabBar(context),
        Container(height: MediaQuery.of(context).size.height * 0.015),
        tabBarView(context),
      ],

      // floatingActionButton: IconButton(
      //     iconSize: 40.0
      //     color: Colors.red[200],
      //     onPressed: () {
      //       //맨위로 이동하는 버튼 함수
      //     },
      //     icon: Icon(Icons.arrow_circle_up)),
    );
  }

  Container tabBar(BuildContext context) => Container(
        child: TabBar(
          controller: _controller,
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 3.0, color: Colors.red),
              insets: EdgeInsets.symmetric(horizontal: 90.0)),
          indicatorWeight: 0.0,
          indicatorColor: Colors.red[200],
          labelColor: Colors.red,
          unselectedLabelColor: Colors.black,
          tabs: [
            Tab(text: '상품설명'),
            Tab(text: '리뷰 ($reviewCount)'),
            Tab(text: 'Q&A ($questionCount)'),
          ],
        ),
      );
  Container tabBarView(BuildContext context) => Container(
        child: Container(
          height: MediaQuery.of(context).size.height / 1.28,
          margin: EdgeInsets.only(left: 16.0, right: 16.0),
          child: TabBarView(
            controller: _controller,
            children: <Widget>[
              ProductInfo(), //상품설명
              ProductReview(), //리뷰
              ProductQnA(), //QnA
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
                            autoplay: false,
                            pagination: SwiperPagination(
                                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                builder: DotSwiperPaginationBuilder(
                                    color: Colors.grey,
                                    activeColor: Colors.red[200],
                                    size: 15.0,
                                    activeSize: 15.0)),
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
              SizedBox(
                height: 10.0,
              ),
              Divider(
                color: Colors.black12,
                thickness: 8,
              ),
            ]),
          ],
        ),
      );
}
