import 'package:flutter/material.dart';

class DrawerButton extends StatefulWidget {
  @override
  _DrawerButtonState createState() => _DrawerButtonState();
}

class _DrawerButtonState extends State<DrawerButton> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            onDetailsPressed: () {
              print('clicked');
            },
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
              print('Setting is clicked');
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
              print('Q&A is clicked');
            },
            // trailing: Icon(Icons.add),
          ),
          ListTile(
            leading: Icon(
              Icons.new_releases_outlined,
              color: Colors.grey[850],
            ),
            title: Text('버전정보'),
            onTap: () {
              print('Q&A is clicked');
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
              print('Q&A is clicked');
            },
            // trailing: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
