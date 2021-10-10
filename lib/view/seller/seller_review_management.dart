import 'package:damo/ViewModel/bar/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

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
  List<Widget> reviewReply = []; //리뷰 답글
  List<int> selectedReviewIndex = [];
  List<Widget> review = [];
  List<CupertinoButton> reviewButton = [];
  String sellerName = '판매자 이름';
  List<String> reviewReplyDate = []; //리뷰 최근 수정 날짜
  List<TextEditingController> reviewDialogController = [];

  List<String> receivedReplyData = [
    '리뷰 답글 1',
    '',
    '리뷰 답글 2',
    '',
    '리뷰 답글 2',
  ];

  bool accept = true;

  Future<dynamic> replyAlert(int index) {
    String tempString = reviewDialogController[index].text.toString();
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("리뷰의 답글을 달아주세요"),
          content: SingleChildScrollView(
            child: Container(
              child: TextFormField(
                maxLines: 10,
                enableSuggestions: false,
                controller: reviewDialogController[index],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.redAccent,
                      width: 2,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.comment_sharp,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
          ),
          actions: <Widget>[
            CupertinoButton(
                child: Text("확인"),
                onPressed: () {
                  setState(() {
                    accept = true;
                    receivedReplyData[index] =
                        reviewDialogController[index].value.text;
                    Get.back();
                  });
                }),
            CupertinoButton(
              child: Text("취소"),
              onPressed: () {
                setState(() {
                  accept = false;
                  reviewDialogController[index].text = tempString;
                  Get.back();
                });
              },
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> modifyAlert(int index) {
    String tempString = reviewDialogController[index].text.toString();
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("리뷰의 답글을 달아주세요"),
          content: SingleChildScrollView(
            child: Container(
              child: TextFormField(
                maxLines: 10,
                enableSuggestions: false,
                controller: reviewDialogController[index],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.redAccent,
                      width: 2,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.comment_sharp,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
          ),
          actions: <Widget>[
            CupertinoButton(
                child: Text("확인"),
                onPressed: () {
                  setState(() {
                    accept = true;
                    receivedReplyData[index] =
                        reviewDialogController[index].value.text;
                    Get.back();
                  });
                }),
            CupertinoButton(
              child: Text("취소"),
              onPressed: () {
                setState(() {
                  accept = false;
                  reviewDialogController[index].text = tempString;
                  Get.back();
                });
              },
            ),
          ],
        );
      },
    );
  }

  onReplyButtonClicked(int index) async {
    await replyAlert(index);
    if (accept)
      reviewReply[index] = Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black38),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          receivedReplyData[index],
        ),
      );
  }

  onReplyModifyButtonClicked(int index) async {
    await modifyAlert(index);
    if (accept)
      reviewReply[index] = Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black38),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          receivedReplyData[index],
        ),
      );
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

      if (receivedReplyData[i] == '') {
        reviewReply.add(Container());
        reviewDialogController.add(TextEditingController());
      } else {
        reviewReply.add(
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black38),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              receivedReplyData[i],
            ),
          ),
        );
        reviewDialogController
            .add(TextEditingController(text: receivedReplyData[i]));
      }
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    receivedReplyData[index] == ''
                        ? Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.black38),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: CupertinoButton(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                '등록하기',
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {
                                onReplyButtonClicked(index);
                              },
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.black38),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: CupertinoButton(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                '수정하기',
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {
                                onReplyModifyButtonClicked(index);
                              },
                            ),
                          ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: reviewReply[index]),
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
