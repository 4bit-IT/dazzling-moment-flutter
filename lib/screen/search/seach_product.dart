import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bar/app_bar.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  DamoAppBar appBar = DamoAppBar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        iconTheme: IconThemeData(
          color: Colors.black54,
        ),
        automaticallyImplyLeading: true, //뒤로 가기 제공

        title: CupertinoSearchTextField(
          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 0.0, 10.0),
          placeholder: '검색어를 입력하세요.',
          placeholderStyle: TextStyle(color: Colors.black87),
          onChanged: (String value) {
            print('The text has changed to: $value');
          },
          onSubmitted: (String value) {
            print('Submitted text: $value');
          },
          // backgroundColor: Colors.redAccent[50],
        ),
      ),
    );
  }
}
