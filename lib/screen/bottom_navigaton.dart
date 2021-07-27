import 'package:damo/screen/community/look_community.dart';
import 'package:damo/screen/home_main.dart';
import 'package:damo/screen/location/look_location.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomNavigation extends StatefulWidget {
  BottomNavigation({this.bottomNavigationIndex});
  int? bottomNavigationIndex;

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List bottomNavigationBarPages = [
    HomeMain(),
    LookLocation(),
    LookCommunity(),
  ];

  var selectedBottomNavigationBarIndex = 0;

  void onTapped(int selectedBottomNavigationBarIndex) {
    if (selectedBottomNavigationBarIndex != widget.bottomNavigationIndex!)
      setState(() {
        widget.bottomNavigationIndex = selectedBottomNavigationBarIndex;

        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                bottomNavigationBarPages[selectedBottomNavigationBarIndex],
          ),
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: '상품 보기',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined),
          label: '지도로 보기',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message_outlined),
          label: '커뮤니티',
        ),
      ],
      selectedItemColor: Colors.red,
      currentIndex: widget.bottomNavigationIndex!,
      onTap: onTapped,
    );
  }
}
