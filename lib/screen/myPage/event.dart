import 'package:damo/screen/bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import 'event_info.dart';

class Event extends StatelessWidget {
  int eventCount = 3;
  List<Text> eventTitle = [
    Text('이벤트 1 제목'),
    Text('이벤트 2 제목'),
    Text('이벤트 3 제목'),
  ];
  List<Text> eventContent = [
    Text('이벤트 1 내용'),
    Text('이벤트 2 내용'),
    Text('이벤트 3 내용'),
  ];
  List<Text> eventDate = [
    Text('이벤트 1 날짜'),
    Text('이벤트 2 날짜'),
    Text('이벤트 3 날짜'),
  ];

  onEventTapped(int index) {
    Get.to(
      () => EventInfo(),
      arguments: {
        'eventTitle': eventTitle[index].data,
        'eventContent': eventContent[index].data,
        'eventDate': eventDate[index].data
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().textAppBar(context, '이벤트'),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView.builder(
          itemCount: eventCount,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      onEventTapped(index);
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
                                  eventTitle[index].data.toString(),
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
                                  eventContent[index].data.toString(),
                                  style: GoogleFonts.lato(
                                    fontSize: 17,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  eventDate[index].data.toString(),
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
