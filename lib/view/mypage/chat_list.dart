import 'dart:io';

import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().noSearchBar(context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: FutureBuilder(
            future: getChatList(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData == false) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                return ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int count) {
                    return Column();
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<dynamic> getChatList() async {
    var dir = await getExternalStorageDirectory();
    String dirPath = dir!.path.toString() + 'chat/'; //채팅 디렉토리
    File file = File(dirPath);
    if (await File(dir.path.toString()).exists()) {
      print('1');
    } else {
      file.create(recursive: true);
      print('0');
    }
    /*try {
      file.writeAsString('');
      if (await file.exists()) {
        //파일이 존재하면 캐시디렉토리에서 파일을 불러온다.
        //count = file.readAsLinesSync().length;
        List<dynamic> list = await file.readAsLines();
        return list;
      } else {
        //파일이 존재하지 않으면 캐시 디렉토리에서 파일을 만든다.
        print('파일이 존재하지 않음(존재하지 않을 수가 없음)');
      }
    } catch (e) {
      file.create();
      print('file is not exists');
      print(e);
    }*/
  }
}
