import 'package:damo/view/community/look_community.dart';
import 'package:damo/view/location/look_location.dart';
import 'package:damo/view/main/home_main.dart';
import 'package:damo/view/mypage/chat.dart';
import 'package:damo/view/mypage/my_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transition/transition.dart';

// ignore: must_be_immutable
class BottomNavigation extends StatefulWidget {
  BottomNavigation(
      {this.selectedBottomNavigationBarIndex, this.scrollController});

  ScrollController? scrollController;
  int? selectedBottomNavigationBarIndex;

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  static List bottomNavigationBarPages = [
    HomeMain(),
    LookLocation(),
    Chat(),
    MyPage(),
  ];

  Widget icHome = SvgPicture.asset('assets/images_svg/ic_홈_off.svg');
  Widget icMy = SvgPicture.asset('assets/images_svg/ic_마이_off.svg');
  Widget icChat = SvgPicture.asset('assets/images_svg/ic_채팅_off.svg');
  Widget icLocation = SvgPicture.asset('assets/images_svg/ic_내주변_off.svg');

  void onTapped(int index) {
    if (widget.selectedBottomNavigationBarIndex == index) {
      SchedulerBinding.instance?.addPostFrameCallback((_) {
        widget.scrollController!.animateTo(
            widget.scrollController!.position.minScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastLinearToSlowEaseIn);
      });
    } else if (widget.selectedBottomNavigationBarIndex != index) {
      setState(() {
        if (widget.selectedBottomNavigationBarIndex == 0) {
          icHome = SvgPicture.asset('assets/images_svg/ic_홈_off.svg');
        } else if (widget.selectedBottomNavigationBarIndex == 1) {
          icLocation = SvgPicture.asset('assets/images_svg/ic_내주변_off.svg');
        } else if (widget.selectedBottomNavigationBarIndex == 2) {
          icChat = SvgPicture.asset('assets/images_svg/ic_채팅_off.svg');
        } else {
          icMy = SvgPicture.asset('assets/images_svg/ic_마이_off.svg');
        }

        if (index == 0) {
          icHome = SvgPicture.asset('assets/images_svg/ic_홈_on.svg');
        } else if (index == 1) {
          icLocation = SvgPicture.asset('assets/images_svg/ic_내주변_on.svg');
        } else if (index == 2) {
          icChat = SvgPicture.asset('assets/images_svg/ic_채팅_on.svg');
        } else {
          icMy = SvgPicture.asset('assets/images_svg/ic_마이_on.svg');
        }
        widget.selectedBottomNavigationBarIndex = index;
        Navigator.pushReplacement(
            context,
            Transition(
                child: bottomNavigationBarPages[
                    widget.selectedBottomNavigationBarIndex!],
                transitionEffect: TransitionEffect.FADE));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xff283137),
      selectedLabelStyle: TextStyle(
        fontSize: 12,
        fontFamily: 'NotoSansCJKKR',
        fontWeight: FontWeight.w700,
      ),
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/images_svg/ic_홈_off.svg'),
          activeIcon: SvgPicture.asset('assets/images_svg/ic_홈_on.svg'),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/images_svg/ic_내주변_off.svg'),
          activeIcon: SvgPicture.asset('assets/images_svg/ic_내주변_on.svg'),
          label: '내 주변',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/images_svg/ic_채팅_off.svg'),
          activeIcon: SvgPicture.asset('assets/images_svg/ic_채팅_on.svg'),
          label: '채팅',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/images_svg/ic_마이_off.svg'),
          activeIcon: SvgPicture.asset('assets/images_svg/ic_마이_on.svg'),
          label: '마이',
        ),
      ],
      currentIndex: widget.selectedBottomNavigationBarIndex!,
      onTap: onTapped,
    );
  }
}
