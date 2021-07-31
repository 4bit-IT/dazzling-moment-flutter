import 'package:damo/drawer.dart';
import 'package:flutter/material.dart';
import '../app_bar.dart';
import '../bottom_navigaton.dart';
import 'package:damo/back_button_clicked.dart';

class MyPage extends StatefulWidget {
  MyPage({this.bottomNavigationIndex});
  final bottomNavigationIndex;
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  DamoAppBar appBar = DamoAppBar();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: BackButtonClicked().onWillPop,
      child: Scaffold(
        drawer: DrawerButton(),
        appBar: appBar.appBar(context),
        bottomNavigationBar: BottomNavigation(bottomNavigationIndex: 3),
      ),
    );
  }
}
