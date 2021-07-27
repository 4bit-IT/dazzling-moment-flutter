import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'search/seach_product.dart';

class DamoAppBar {
  dynamic tabBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Image.asset('lib/images/logo.png'),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SearchPage()));
          },
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
        labelStyle: GoogleFonts.lato(color: Colors.black38, fontSize: 15.0),
        unselectedLabelStyle: TextStyle(fontSize: 15.0),
        labelColor: Colors.red,
        unselectedLabelColor: Colors.black,
        indicatorColor: Colors.white,
        isScrollable: false,
        tabs: [
          Tab(
            text: '핸드메이드 케이크',
            icon: Icon(Icons.cake_outlined),
          ),
          Tab(text: '꽃', icon: Icon(Icons.yard_outlined)),
        ],
      ),
    );
  }

  //hintStyle: GoogleFonts.lato(color: Colors.black38),
  dynamic appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Image.asset('lib/images/logo.png'),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SearchPage()));
          },
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
