import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/bar/back_button_clicked.dart';
import 'package:damo/viewmodel/bar/bottom_navigaton.dart';
import 'package:damo/viewmodel/bar/drawer.dart';
import 'package:flutter/material.dart';

class LookCommunity extends StatefulWidget {
  @override
  _LookCommunityState createState() => _LookCommunityState();
}

class _LookCommunityState extends State<LookCommunity> {
  DamoAppBar appBar = DamoAppBar();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: BackButtonClicked().onWillPop,
      child: Scaffold(
        drawer: DrawerButton(),
        appBar: appBar.noSearchBar(context),
        bottomNavigationBar: BottomNavigation(
          selectedBottomNavigationBarIndex: 2,
        ),
      ),
    );
  }
}
