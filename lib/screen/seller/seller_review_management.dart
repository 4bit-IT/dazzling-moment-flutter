import 'package:damo/screen/bar/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SellerReviewManagement extends StatefulWidget {
  @override
  _SellerReviewManagementState createState() => _SellerReviewManagementState();
}

class _SellerReviewManagementState extends State<SellerReviewManagement> {
  int reviewCount = 5; //리뷰 개수
  List<String> reviewOption = []; //각 주문 옵션
  List<double> reviewScore = []; // 각 리뷰 별점
  List<String> reviewId = []; // 리뷰 단 사람 닉네임
  List<String> reviewDate = []; // 리뷰 단 날짜
  List<String> reviewContent = []; //리뷰 내용
  List<Widget> reviewerProfileImage = []; //라뷰 단 사람의 프로필 이미지
  List<Widget> reviewImage = []; //리뷰의 이미지
  List<Text> reviewReply = []; //리뷰 답글
  List<int> selectedReviewIndex = [];
  List<Widget> review = [];
  int selectedIndex = -1;
  List<Widget> reviewButton = [];

  List<Text> receivedReplyData = [
    Text('리뷰 답글 1'),
    Text(''),
    Text('리뷰 답글 2'),
    Text(''),
    Text('리뷰 답글 2'),
  ];

  onReplyButtonClicked(int index) {
    setState(() {
      reviewButton[index] = Container();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < reviewCount; i++) {
      reviewOption.add('옵션 + 옵션 + 옵션 + 옵션 + ...');
      reviewScore.add(4.5);
      reviewId.add('reviewId ${i + 1}');
      reviewDate.add('2021-10-10');
      reviewerProfileImage
          .add(Image.network('https://picsum.photos/250?image=9'));
      reviewContent.add('리뷰 내용임');
      reviewImage.add(Image.asset('assets/images/DAMO_logo-01.png'));
      selectedReviewIndex.add(i);

      if (receivedReplyData[i].data.toString() == '') {
        reviewReply.add(Text(''));
      } else
        reviewReply.add(receivedReplyData[i]);
      int selectedIndex = -1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamoAppBar().sellerAppBar(context),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: reviewCount,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: reviewerProfileImage[index],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reviewId[index],
                            style: GoogleFonts.lato(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star),
                              Text(
                                reviewDate[index],
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  reviewOption[index],
                  style: GoogleFonts.lato(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: reviewImage[index],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        reviewContent[0],
                        style: GoogleFonts.lato(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    reviewReply[index].data.toString() == ''
                        ? Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.black38),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: CupertinoButton(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                '답글달기',
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {
                                onReplyButtonClicked(index);
                              },
                            ),
                          )
                        : Container(),
                  ],
                ),
                SizedBox(height: 10),
                reviewReply[index].data.toString() == ''
                    ? Container()
                    : Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black38),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          reviewReply[index].data.toString(),
                        ),
                      ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}
