import 'package:damo/screen/bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationMain extends StatefulWidget {
  @override
  _NotificationMainState createState() => _NotificationMainState();
}

class _NotificationMainState extends State<NotificationMain> {
  List<Widget> notificationList = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      notificationList.add(
        Text(
          '공지: ㅇㅇㅇ',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      );
      notificationList.add(
        Divider(
          color: Colors.black12,
          thickness: 4,
        ),
      );
      notificationList.add(
        Text(
          '알림: ㅇㅇㅇ',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      );
      notificationList.add(
        Divider(
          color: Colors.black12,
          thickness: 4,
        ),
      );
      notificationList.add(
        Text(
          '이벤트: ㅇㅇㅇ',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      );
      notificationList.add(
        Divider(
          color: Colors.black12,
          thickness: 4,
        ),
      );
      notificationList.add(
        Text(
          '예약: ㅇㅇㅇ',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      );
      notificationList.add(
        Divider(
          color: Colors.black12,
          thickness: 4,
        ),
      );
      notificationList.add(
        Text(
          '공지: ㅇㅇㅇ',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      );
      notificationList.add(
        Divider(
          color: Colors.black12,
          thickness: 4,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamoAppBar().sellerAppBar(context),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: notificationList,
          ),
        ),
      ),
    );
  }
}
