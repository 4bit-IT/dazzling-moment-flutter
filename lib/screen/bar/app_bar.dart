import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transition/transition.dart';
import '../search/seach_product.dart';

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
      title: Image.asset('assets/images/logo.png', height: 40.0),
      actions: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(
            Icons.search,
            size: 30.0,
            color: Colors.redAccent,
          ),
          onPressed: () {
            Navigator.push(
                context,
                Transition(
                    child: SearchPage(),
                    transitionEffect: TransitionEffect.BOTTOM_TO_TOP));
          },
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(
            Icons.notifications_none,
            size: 30.0,
            color: Colors.redAccent,
          ),
          onPressed: () {},
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
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('핸드메이드 케이크'),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.cake_outlined),
            ],
          )

              //icon: Icon(Icons.cake_outlined,),
              ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('꽃'),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.yard_outlined)
              ],
            ),
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
      title: Image.asset('assets/images/logo.png', height: 40.0),
      actions: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(
            Icons.search,
            size: 30.0,
            color: Colors.redAccent,
          ),
          onPressed: () {
            Navigator.push(
                context,
                Transition(
                    child: SearchPage(),
                    transitionEffect: TransitionEffect.BOTTOM_TO_TOP));
          },
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(
            Icons.notifications_none,
            size: 30.0,
            color: Colors.redAccent,
          ),
          onPressed: () {},
        ),
        SizedBox(width: 10.0),
      ],
    );
  }

  dynamic noSearchBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.red,
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Image.asset('assets/images/logo.png', height: 40.0),
      actions: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(
            Icons.notifications_none,
            size: 30.0,
            color: Colors.redAccent,
          ),
          onPressed: () {},
        ),
        SizedBox(width: 10.0),
      ],
    );
  }
}
