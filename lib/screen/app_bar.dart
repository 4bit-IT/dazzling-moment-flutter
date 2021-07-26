import 'package:flutter/material.dart';

class DamoAppBar {
  dynamic tabBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Image.asset('lib/images/logo.png'),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
          color: Colors.red,
          iconSize: 30.0,
        ),
        SizedBox(width: 10.0),
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {},
          color: Colors.red,
          iconSize: 30.0,
        ),
        SizedBox(width: 10.0),
      ],
      bottom: TabBar(
        labelStyle: TextStyle(fontSize: 20.0),
        unselectedLabelStyle: TextStyle(fontSize: 15.0),
        labelColor: Colors.red,
        unselectedLabelColor: Colors.black,
        indicatorColor: Colors.white,
        isScrollable: false,
        tabs: [
          Tab(text: '핸드메이드 케이크'),
          Tab(text: '꽃'),
        ],
      ),
    );
  }

  dynamic appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Image.asset('lib/images/logo.png'),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
          color: Colors.red,
          iconSize: 30.0,
        ),
        SizedBox(width: 10.0),
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {},
          color: Colors.red,
          iconSize: 30.0,
        ),
        SizedBox(width: 10.0),
      ],
    );
  }
}
