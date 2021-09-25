import 'package:damo/screen/community/look_community.dart';
import 'package:damo/screen/main/home_main.dart';
import 'package:damo/screen/location/look_location.dart';
import 'package:damo/screen/mypage/my_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:transition/transition.dart';

// ignore: must_be_immutable
class BottomNavigation extends StatefulWidget {
  BottomNavigation({this.bottomNavigationIndex, this.scrollController});
  int? bottomNavigationIndex;
  ScrollController? scrollController;

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  static List bottomNavigationBarPages = [
    HomeMain(),
    LookLocation(),
    LookCommunity(),
    MyPage(),
  ];

  var selectedBottomNavigationBarIndex = 0;

  void onTapped(int selectedBottomNavigationBarIndex) {
    if (selectedBottomNavigationBarIndex == widget.bottomNavigationIndex!) {
      SchedulerBinding.instance?.addPostFrameCallback((_) {
        widget.scrollController!.animateTo(
            widget.scrollController!.position.minScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastLinearToSlowEaseIn);
      });
    } else if (selectedBottomNavigationBarIndex !=
        widget.bottomNavigationIndex!) {
      setState(() {
        widget.bottomNavigationIndex = selectedBottomNavigationBarIndex;
        Widget selectPage =
            bottomNavigationBarPages[selectedBottomNavigationBarIndex];
        Navigator.pushReplacement(
            context,
            Transition(
                child:
                    bottomNavigationBarPages[selectedBottomNavigationBarIndex],
                transitionEffect: TransitionEffect.FADE));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
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
