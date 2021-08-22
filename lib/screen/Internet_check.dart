import 'package:damo/screen/loading.dart';
import 'package:damo/sign/sign.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home_main.dart';

class InternetCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Firebase load Fail'),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            //firebase 정상적으로 연결 되있을 때
            return Sign();
          } else
            return CircularProgressIndicator(); //firebase 정상적으로 연결 X
        });
  }
}
