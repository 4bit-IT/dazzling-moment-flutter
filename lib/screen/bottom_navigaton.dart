import 'package:damo/screen/community/look_community.dart';
import 'package:damo/screen/home_main.dart';
import 'package:damo/screen/location/look_location.dart';
import 'package:damo/screen/myPage/my_page.dart';
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
    MyPage(),
  ];

  var selectedBottomNavigationBarIndex = 0;

  void onTapped(int selectedBottomNavigationBarIndex) {
    if (selectedBottomNavigationBarIndex != widget.bottomNavigationIndex!) {
      setState(() {
        widget.bottomNavigationIndex = selectedBottomNavigationBarIndex;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  bottomNavigationBarPages[selectedBottomNavigationBarIndex],
            ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.storefront),
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
        BottomNavigationBarItem(
          icon: Icon(Icons.perm_identity),
          label: '내 정보',
        ),
      ],
      selectedItemColor: Colors.red,
      currentIndex: widget.bottomNavigationIndex!,
      onTap: onTapped,
    );
  }
}
