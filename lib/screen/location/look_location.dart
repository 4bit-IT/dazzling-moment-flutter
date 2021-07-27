import 'package:damo/screen/app_bar.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: appBar.appBar(context),
      bottomNavigationBar: BottomNavigation(bottomNavigationIndex: 1),
    );
  }
}
