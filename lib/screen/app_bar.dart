import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transition/transition.dart';
import 'search/seach_product.dart';

class DamoAppBar {
  dynamic tabBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.red,
      ),
      // automaticallyImplyLeading: false,
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Image.asset('assets/images/logo.png'),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.push(
                context,
                Transition(
                    child: SearchPage(),
                    transitionEffect: TransitionEffect.BOTTOM_TO_TOP));
          },
          color: Colors.red,
          iconSize: 30.0,
        ),
        IconButton(
          icon: Icon(Icons.notifications_outlined),
          onPressed: () {},
          color: Colors.red,
          iconSize: 30.0,
        ),
        SizedBox(width: 10.0),
        // IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () {},
        //   color: Colors.red,
        //   iconSize: 30.0,
        // ),
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
          Tab(
            text: '꽃',
            icon: Icon(Icons.yard_outlined),
          ),
        ],
      ),
    );
  }

  dynamic appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.red,
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Image.asset('assets/images/logo.png'),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.push(
                context,
                Transition(
                    child: SearchPage(),
                    transitionEffect: TransitionEffect.BOTTOM_TO_TOP));
          },
          color: Colors.red,
          iconSize: 30.0,
        ),
        IconButton(
          icon: Icon(Icons.notifications_outlined),
          onPressed: () {},
          color: Colors.red,
          iconSize: 30.0,
        ),
        SizedBox(width: 10.0),
      ],
    );
  }
}
