import 'package:damo/screen/app_bar.dart';
import 'package:flutter/material.dart';

class LookLocation extends StatefulWidget {
  @override
  _LookLocationState createState() => _LookLocationState();
}

class _LookLocationState extends State<LookLocation> {
  DamoAppBar appBar = DamoAppBar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar.appBar(),
    );
  }
}
