import 'package:damo/screen/bar/app_bar.dart';
import 'package:damo/screen/bar/scroll_behavior.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:transition/transition.dart';
import 'bar/drawer.dart';
import 'bar/bottom_navigaton.dart';
import 'package:damo/screen/bar/back_button_clicked.dart';
import 'package:damo/screen/product/product_info.dart';
import 'package:like_button/like_button.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  DamoAppBar tabBar = DamoAppBar();

  List<String> dropdownList = ['거리순', '추천순', '인기순'];
  String selectedDropdown = '거리순';

  ScrollController scrollController = ScrollController();

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;
    if (isLiked) {
      Fluttertoast.showToast(
        msg: '찜목록에서 제거했어요!',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red[200],
        fontSize: 100.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: '찜목록에 담았어요!',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red[200],
        fontSize: 100.0,
      );
    }
    return !isLiked;
  }

  Widget viewProduct() {
    List<Image> imageList = [
      Image.asset(
        'assets/images/pro.JPG',
        fit: BoxFit.fill,
      ),
      Image.asset(
        'assets/images/logo.png',
        fit: BoxFit.fill,
      ),
      Image.asset(
        'assets/images/logo.png',
        fit: BoxFit.fill,
      ),
      Image.asset(
        'assets/images/kakao_login_medium_wide.png',
        fit: BoxFit.fill,
      ),
      Image.asset(
        'assets/images/pro.JPG',
        fit: BoxFit.fill,
      ),
      Image.asset(
        'assets/images/pro.JPG',
        fit: BoxFit.fill,
      ),
      Image.asset(
        'assets/images/pro.JPG',
        fit: BoxFit.fill,
      ),
    ];
    return Container(
      color: Colors.white,
      child: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
              child: DropdownButton(
                value: selectedDropdown,
                items: dropdownList.map((String item) {
                  return DropdownMenuItem<String>(
                    child: Text('$item '),
                    value: item,
                  );
                }).toList(),
                onChanged: (dynamic value) {
                  setState(() {
                    selectedDropdown = value;
                    dropdownList.remove(value);
                    dropdownList.insert(0, value);
                  });
                },
                elevation: 8,
                style: TextStyle(color: Colors.black, fontSize: 16),
                icon: Icon(
                  Icons.arrow_drop_down_circle,
                  size: 20.0,
                ),
                iconEnabledColor: Colors.red[200],
              ),
            ),
            Expanded(
              child: AnimationLimiter(
                child: GridView.builder(
                    controller: scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
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
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                context,
                                Transition(
                                  child: ProductInfo(),
                                  transitionEffect: TransitionEffect.FADE,
                                ),
                              );
                            });
                          }, //클릭시 이동
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
                                        CupertinoButton(
                                          minSize: 0,
                                          padding: EdgeInsets.all(10),
                                          onPressed: () {},
                                          child: LikeButton(
                                            onTap: onLikeButtonTapped,
                                            size: 25.0,
                                            animationDuration: const Duration(
                                                milliseconds: 500),
                                          ),
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
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: BackButtonClicked().onWillPop,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: DrawerButton(),
          appBar: tabBar.tabBar(context),
          bottomNavigationBar: BottomNavigation(
            bottomNavigationIndex: 0,
            scrollController: scrollController,
          ),
          body: TabBarView(
            children: [
              viewProduct(),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 100.0, 30.0, 0.0),
                  child: Column(
                    children: [
                      Image.asset('assets/images/apology.png'),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text('서비스 준비중입니다. 빠른 시일내에 제공하겠습니다.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
