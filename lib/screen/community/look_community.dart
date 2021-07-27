import 'package:damo/screen/app_bar.dart';
import 'package:flutter/material.dart';

import '../bottom_navigaton.dart';

class LookCommunity extends StatefulWidget {
  @override
  _LookCommunityState createState() => _LookCommunityState();
}

class _LookCommunityState extends State<LookCommunity> {
  DamoAppBar appBar = DamoAppBar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar.appBar(context),
      bottomNavigationBar: BottomNavigation(bottomNavigationIndex: 2),
    );
  }
}
