import 'package:damo/screen/product/look_product.dart';
import 'package:flutter/material.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            color: Colors.pink,
            iconSize: 30.0,
          ),
          SizedBox(width: 10.0),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
            color: Colors.pink,
            iconSize: 30.0,
          ),
          SizedBox(width: 10.0)
        ],
        title: Image.asset('lib/images/logo.png'),
      ),
      body: Container(
        color: Colors.white70,
        child: Column(children: [
          DefaultTabController(
              length: 3, // length of tabs
              initialIndex: 0,
              child: Column(children: [
                Container(
                  child: TabBar(
                    labelStyle: TextStyle(fontSize: 22.0),
                    unselectedLabelStyle: TextStyle(fontSize: 15.0),
                    labelColor: Colors.red,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.white,
                    isScrollable: false,
                    tabs: [
                      Tab(text: '상품 보기'),
                      Tab(text: '지도로 보기'),
                      Tab(text: '커뮤니티'),
                    ],
                  ),
                ),
                Container(
                    height: 100,
                    child: TabBarView(children: [
                      Container(
                        child: Product(),
                      ),
                      Container(
                        child: Center(
                          child: Text('지도로 보기'),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text('커뮤니티'),
                        ),
                      ),
                    ]))
              ])),
        ]),
      ),
    );
  }
}
