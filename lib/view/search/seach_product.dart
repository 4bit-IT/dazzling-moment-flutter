import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black54,
        ),
        title: CupertinoSearchTextField(
          placeholder: '원하시는 선물을 검색하세요.',
          placeholderStyle: TextStyle(
            color: Color(0xffd1d1d6),
            fontFamily: 'NotoSansCJKKR',
          ),
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
