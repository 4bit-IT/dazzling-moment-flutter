import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter/material.dart';

class SellerChatManagement extends StatefulWidget {
  const SellerChatManagement({Key? key}) : super(key: key);

  @override
  _SellerChatManagementState createState() => _SellerChatManagementState();
}

class _SellerChatManagementState extends State<SellerChatManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamoAppBar().sellerAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              for (int i = 0; i < 5; i++)
                Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          child: Image.asset('assets/images/DAMO_logo-01.png'),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width * 1.2 / 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '사용자 이름',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '가장 최근의 메세지',
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '시간',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '개수',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
