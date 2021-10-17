import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/bar/scroll_behavior.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class WishListPage extends StatelessWidget {
  List<Widget> wishList = [];
  ScrollController scrollController = ScrollController();
  List<Image> imageList = [
    Image.asset(
      'assets/images/DAMO_logo-01.png',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/images/DAMO_logo-03.png',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/images/pro.JPG',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/images/logo.png',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/images/pro.JPG',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/images/DAMO_logo-01.png',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/images/DAMO_logo-02.png',
      fit: BoxFit.fill,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DamoAppBar().noActionBar(context),
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          child: ScrollConfiguration(
            behavior: NoGlowScrollBehavior(),
            child: AnimationLimiter(
              child: GridView.builder(
                  controller: scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 15.0,
                      mainAxisExtent: 330.0,
                      crossAxisSpacing: 6.0,
                      childAspectRatio: 1.0),
                  padding: const EdgeInsets.fromLTRB(5.5, 0.0, 5.5, 0.0),
                  itemCount: imageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: 2,
                      columnCount: 2,
                      duration: Duration(milliseconds: 500),
                      child: InkWell(
                        onTap: () {}, //클릭시 이동
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: Card(
                              shadowColor: Colors.black87,
                              child: Column(
                                children: [
                                  Container(
                                    child: imageList[index],
                                    height: 180.0,
                                    width: 200.0,
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    "곰돌곰돌",
                                    style: TextStyle(
                                        fontFamily: 'NotoSans',
                                        color: Colors.black87,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    ' 서면에서 입소문난 수제 케이크 서면에서 입소문난 수제 케이크 서면에서 입소문난 수제 케이크 ',
                                    //최대 3줄까지 지정.
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.orangeAccent,
                                          ),
                                          Text(
                                            "5.0",
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ));
  }
}
