import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/view/mypage/notice_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class Notice extends StatelessWidget {
  int noticeCount = 3;
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

  onNoticeTapped(int index) {
    Get.to(
      () => NoticeInfo(),
      arguments: {
        'noticeTitle': noticeTitle[index].data,
        'noticeContent': noticeContent[index].data,
        'noticeDate': noticeDate[index].data
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().textAppBar(context, '공지사항'),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView.builder(
          itemCount: noticeCount,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      onNoticeTapped(index);
                    },
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
                                  noticeTitle[index].data.toString(),
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
                                  noticeContent[index].data.toString(),
                                  style: GoogleFonts.lato(
                                    fontSize: 17,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  noticeDate[index].data.toString(),
                                  style: GoogleFonts.lato(
                                      fontSize: 15, color: Colors.black54),
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
                  Divider(
                    color: Colors.black12,
                    thickness: 2,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
