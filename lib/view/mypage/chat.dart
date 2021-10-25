import 'package:damo/ViewModel/bar/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  //먼저 업체 페이지에서 쪽지 보내기 버튼을 누르고 첫 대화를 시작하면 파일이 만들어진다.

  /* 디렉토리 구조
  애플리케이션 디렉토리/chat/ 에서는,
  1. counter.txt => 총 채팅의 개수만 적혀있는 txt 파일(File 클래스로 하위 파일 개수 알 수 있으면 필요없음)
  2. chatCounter 개수에 맞는 하위 디렉토리들, 각 디렉토리의 디렉토리명은 채팅 상대의 이름(닉네임)이다.
  3. 각각의 채팅 디렉토리안에는 DamoChats.txt 와 그래픽파일(이미지, GIF)들이 들어가있다.
  4. DamoChats.txt 안에는 첫 줄에 $personName[] 님과 쪽지,
     두 번째 줄부터 0or1(0이면 본인, 1이면 상대방 메세지) OOOO-OO-OO(연월일) OO:OO, 쪽지보낸사람이름 : 쪽지내용
     과 같은 형태(카카오톡과 같은 형태임)로 저장한다.
  5. 그래픽파일(이미지, GIF)의 형태는 아직 모르겠다.
  */

  TextEditingController controller = TextEditingController();
  int count = 0;
  int yesterday = 0, today = 0;

  Future read() async {
    try {
      final dir = await getTemporaryDirectory();
      print(dir.path);
      print(await File(dir.path + '/counter.txt').readAsString());
      return await File(dir.path + '/counter.txt').readAsString();
    } catch (e) {
      print(e);
      return 0;
    }
  }

  Future<void> write(String content) async {
    try {
      var now = DateTime.now(); //연월일
      var dir = await getExternalStorageDirectory();
      String dirPath = dir!.path.toString() + 'chat/oppositeUserName.txt'; //상대방 닉네임
      if (!(await File(dirPath).exists())) {
        //파일이 존재하지않으면 파일을 만든다.
        print('파일이 존재하지 않음');
        File(dirPath).create();
      }
      String chatContents = await File(dirPath).readAsString();
      print(chatContents);
      chatContents += '0 $now, userName : $content\n';
      await File(dirPath).writeAsString(chatContents);
    } catch (e) {
      print('file is not exists');
      print(e);
    }
  }

  /*try {
      var dir = await getTemporaryDirectory();
      String dirPath = dir.path.toString() + '/oppositeUserName.txt'; //상대방 닉네임
      if (await File(dirPath).exists()) {
        //파일이 존재하면 캐시디렉토리에서 파일을 불러온다.
        String chatContents = await File(dirPath).readAsString();
        print(chatContents);
        new File(dirPath)
            .openRead()
            .map(utf8.decode)
            .transform(new LineSplitter())
            .forEach((l) => print('line: $l'));
      } else {
        //파일이 존재하지 않으면 캐시 디렉토리에서 파일을 만든다.
        print('파일이 존재하지 않음');
        File(dirPath).create();
      }
    } catch (e) {
      print('file is not exists');
      print(e);
    }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().textAppBar(context, 'oppositeUserName 님과의 대화'),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        child: FutureBuilder(
          future: getChatData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData == false) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Padding(
                padding: EdgeInsets.all(15),
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              yesterday = today;
              today = int.parse(
                  snapshot.data[0].toString().split(' ')[1].split('-')[2]);
              return ListView.builder(
                itemCount: count,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int count) {
                  return Container(
                      alignment:
                          snapshot.data[count].toString().split(' ')[0] == '0'
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                      child: (count == 0) || //날짜 divider 계산
                              snapshot.data[count]
                                      .toString()
                                      .split(' ')[1]
                                      .split('-')[2] !=
                                  snapshot.data[count - 1]
                                      .toString()
                                      .split(' ')[1]
                                      .split('-')[2]
                          ? Column(
                              crossAxisAlignment: snapshot.data[count]
                                          .toString()
                                          .split(' ')[0] ==
                                      '0'
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Divider(color: Colors.black,),
                                    ),
                                    Text(
                                      '${snapshot.data[count].toString().split(' ')[1]}',
                                    ),
                                    Expanded(
                                      child: Divider(color: Colors.black,),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                snapshot.data[count].toString().split(' ')[0] ==
                                        '0'
                                    ? Column(
                                  children: [
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Text(
                                        '${snapshot.data[count].toString().split(' ')[5]}',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                  ],

                                )
                                    : Column(
                                        children: [
                                          Text(
                                            '${snapshot.data[count].toString().split(' ')[3]}',
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.pink[100],
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                            child: Text(
                                              '${snapshot.data[count].toString().split(' ')[5]}',
                                            ),
                                          ),
                                        ],
                                      ),
                              ],
                            )
                          : snapshot.data[count].toString().split(' ')[0] == '0'
                              ? Column(
                                children: [
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Text(
                                        '${snapshot.data[count].toString().split(' ')[5]}',
                                      ),
                                    ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                ],

                              )
                              : Column(
                                  children: [
                                    Text(
                                      '${snapshot.data[count].toString().split(' ')[3]}',
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.pink[100],
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Text(
                                        '${snapshot.data[count].toString().split(' ')[5]}',
                                      ),
                                    ),
                                  ],
                                ));
                },
              );
            }
          },
        ),
      ),
    );
  }

  Future<dynamic> getChatData() async {
    try {
      var dir = await getExternalStorageDirectory();
      String dirPath = dir!.path.toString() + 'oppositeUserName.txt'; //상대방 닉네임
      File file = File(dirPath);
      file.create();
      file.writeAsString(
          '0 0000-00-00 00:00 userName : content\n1 0000-00-01 00:00 userName : content\n1 0000-00-01 00:00 userName : content\n0 0000-00-01 00:00 userName : content\n0 0000-00-02 00:00 userName : content\n0 0000-00-02 00:00 userName : content\n0 0000-00-02 00:00 userName : content\n1 0000-00-02 00:00 userName : content\n1 0000-00-03 00:00 userName : content\n0 0000-00-04 00:00 userName : content\n0 0000-00-04 00:00 userName : content\n0 0000-00-05 00:00 userName : content\n');
      if (await file.exists()) {
        //파일이 존재하면 캐시디렉토리에서 파일을 불러온다.
        count = file.readAsLinesSync().length;
        List<dynamic> list = await file.readAsLines();
        return list;
      } else {
        //파일이 존재하지 않으면 캐시 디렉토리에서 파일을 만든다.
        print('파일이 존재하지 않음(존재하지 않을 수가 없음)');
      }
    } catch (e) {
      print('file is not exists');
      print(e);
    }
  }
}
