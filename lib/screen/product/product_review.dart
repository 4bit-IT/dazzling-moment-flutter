import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductReview extends StatelessWidget {
  List<int> reviewStar = [1, 2, 3, 4];
  List<dynamic> reviewTitle = [
    //22자 이내로 제한
    "맛있습니다.",
    "배송이 늦어요",
    "만족합니다. ",
    "삼계탕이랑 어울려요",
  ];
  List<dynamic> reviewId = [
    "윤중진",
    "안정모",
    "황진성",
    "조영란",
  ];

  var _listTextStyle = TextStyle(
    color: CupertinoColors.black,
    fontSize: 20.0,
    // fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    var _listView = ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0),
      itemCount: reviewTitle.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 0.5,
          margin: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 100.0,
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.comment),
                      SizedBox(width: 5.0),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reviewTitle[index],
                            style: _listTextStyle,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            '작성자: ' + reviewId[index],
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );
    return CupertinoPageScaffold(
      child: _listView,
    );
  }
}
