import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:damo/model/kakao.dart';
import 'package:damo/viewmodel/bar/scroll_behavior.dart';
import 'package:damo/view/sign/sign.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:page_transition/page_transition.dart';

class DrawerButton extends StatefulWidget {
  @override
  _DrawerButtonState createState() => _DrawerButtonState();
}

class _DrawerButtonState extends State<DrawerButton> {
  Future<dynamic> onLogout() {
    return showDialog(
        barrierDismissible: false, //여백눌려도 안닫힘.
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)), //테두리 둥글기
              title: Text(
                "로그아웃 하시겠습니까?",
              ),
              actions: [
                TextButton(
                  child: Text(
                    "예",
                    style: TextStyle(
                        fontFamily: 'NotoSans', color: Colors.red[400]),
                  ),
                  onPressed: () {
                    Kakao().kakaoLogout();
                    Get.offAll(
                      () => AnimatedSplashScreen(
                        duration: 1500,
                        splash: 'assets/images/DAMO_logo-03.png',
                        nextScreen: Sign(),
                        splashTransition: SplashTransition.fadeTransition,
                        pageTransitionType: PageTransitionType.fade,
                        backgroundColor: Colors.white,
                        splashIconSize: 300.0,
                      ),
                    );
                  },
                ),
                TextButton(
                    child: Text(
                      "아니오",
                      style: TextStyle(
                          fontFamily: 'NotoSans', color: Colors.red[400]),
                    ),
                    onPressed: () {
                      Get.back();
                    }),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowScrollBehavior(),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/DAMO_logo-01.png'),
                backgroundColor: Colors.redAccent,
              ),
              accountName: Text('윤중건'),
              accountEmail: Text('zhaqh056@naver.com'),
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.library_books_outlined,
                color: Colors.grey[850],
              ),
              title: Text('공지사항'),
              onTap: () {
                print('Home is clicked');
              },
              // trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.event,
                color: Colors.grey[850],
              ),
              title: Text('이벤트'),
              onTap: () {
                print('Event is clicked');
              },
              // trailing: Icon(Icons.add),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: Divider(
                height: 10.0,
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.exclamationmark_circle,
                color: Colors.grey[850],
              ),
              title: Text('버전정보'),
              onTap: () {
                print('Version is clicked');
              },
              // trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.doc_plaintext,
                color: Colors.grey[850],
              ),
              title: Text('이용약관'),
              onTap: () {
                print('Terms of service is clicked');
              },
              // trailing: Icon(Icons.add),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: Divider(
                height: 10.0,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[850],
              ),
              title: Text('환경설정'),
              onTap: () {
                print('Settings is clicked');
              },
              // trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.logout_outlined,
                color: Colors.grey[850],
              ),
              title: Text('로그아웃'),
              onTap: () {
                onLogout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
