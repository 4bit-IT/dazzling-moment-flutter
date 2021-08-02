import 'package:damo/screen/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:damo/back_button_clicked.dart';
import '../../drawer.dart';
import '../bottom_navigaton.dart';

class LookLocation extends StatefulWidget {
  LookLocation({this.bottomNavigationIndex});
  final bottomNavigationIndex;
  @override
  _LookLocationState createState() => _LookLocationState();
}

class _LookLocationState extends State<LookLocation> {
  DamoAppBar appBar = DamoAppBar();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: BackButtonClicked().onWillPop,
      child: Scaffold(
        drawer: DrawerButton(),
        appBar: appBar.appBar(context),
        bottomNavigationBar: BottomNavigation(bottomNavigationIndex: 1),
      ),
    );
  }
}
