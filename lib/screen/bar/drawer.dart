import 'package:damo/main.dart';
import 'package:damo/screen/bar/scroll_behavior.dart';
import 'package:damo/sign/sign.dart';
import 'package:flutter/material.dart';

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
                  onPressed: () => Navigator.pushAndRemoveUntil(
                      //모든 stack 삭제하고 새로 push
                      context,
                      PageRouteBuilder(pageBuilder: (BuildContext context,
                          Animation animation, Animation secondaryAnimation) {
                        return Damo();
                      }, transitionsBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child) {
                        return new SlideTransition(
                          position: new Tween<Offset>(
                            begin: const Offset(1.0, 0.0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        );
                      }),
                      (Route route) => false),
                ),
                TextButton(
                  child: Text(
                    "아니오",
                    style: TextStyle(
                        fontFamily: 'NotoSans', color: Colors.red[400]),
                  ),
                  onPressed: () => Navigator.pop(context, false),
                ),
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
                backgroundImage: AssetImage('assets/images/logo.png'),
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
                Icons.system_update,
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
                Icons.info,
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
