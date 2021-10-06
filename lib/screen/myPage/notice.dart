import 'package:damo/screen/bar/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notice extends StatefulWidget {
  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  List<Text> noticeTitle = [
    Text('공지사항 1 제목'),
    Text('공지사항 2 제목'),
    Text('공지사항 3 제목'),
  ];
  List<Text> noticeContent = [
    Text('공지사항 1 내용'),
    Text('공지사항 2 내용'),
    Text('공지사항 3 내용'),
  ];
  List<Text> noticeDate = [
    Text('공지사항 1 날짜'),
    Text('공지사항 2 날짜'),
    Text('공지사항 3 날짜'),
  ];

  List<Widget> notice = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < noticeTitle.length; i++) {
      notice.add(
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        noticeTitle[i].data.toString(),
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        noticeContent[i].data.toString(),
                        style: GoogleFonts.lato(
                          fontSize: 17,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        noticeDate[i].data.toString(),
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          color: Colors.black54
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.arrow_forward_ios_outlined),
              ],
            ),
          ),
        ),
      );
      notice.add(
        Divider(
          color: Colors.black12,
          thickness: 2,
        ),
      );
    }
  }

  onNoticeTapped() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().textAppBar(context, '공지사항'),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              Divider(
                color: Colors.black12,
                thickness: 8,
              ),
              Column(
                children: notice,
              )
            ],
          ),
        ),
      ),
    );
  }
}
