import 'package:damo/screen/bar/app_bar.dart';
import 'package:damo/screen/bar/drawer.dart';
import 'package:flutter/material.dart';
import 'package:damo/screen/bar/back_button_clicked.dart';
import '../bar/bottom_navigaton.dart';

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
        appBar: appBar.noActionBar(context),
        bottomNavigationBar: BottomNavigation(bottomNavigationIndex: 2),
      ),
    );
  }
}
