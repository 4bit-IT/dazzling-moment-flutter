import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(children: [
              Container(
                child: TabBar(
                  tabs: [
                    Tab(text: '케이크'),
                    Tab(text: '꽃'),
                  ],
                  labelColor: Colors.red,
                  labelStyle: TextStyle(fontSize: 15.0),
                  unselectedLabelColor: Colors.black,
                  indicatorColor: Colors.red,
                  indicatorWeight: 2.5,
                  indicatorSize: TabBarIndicatorSize.tab,
                  //labelPadding: EdgeInsets.only(top: 10.0),
                ),
              ),
              Container(
                  height: 30,
                  child: TabBarView(children: [
                    Container(
                      child: Center(child: Text('케이크임')),
                    ),
                    Container(
                      child: Center(child: Text('꽃임')),
                    ),
                  ]))
            ])),
      ]),
    );
  }
}
