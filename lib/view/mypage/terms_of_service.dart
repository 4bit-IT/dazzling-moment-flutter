import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter/material.dart';

class TermsOfService extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().textAppBar(context, '서비스 이용약관'),
      backgroundColor: Colors.white,

    );
  }
}
