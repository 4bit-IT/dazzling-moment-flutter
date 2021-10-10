import 'package:damo/ViewModel/bar/app_bar.dart';
import 'package:damo/ViewModel/bar/back_button_clicked.dart';
import 'package:damo/ViewModel/bar/bottom_navigaton.dart';
import 'package:damo/ViewModel/bar/drawer.dart';
import 'package:damo/ViewModel/bar/scroll_behavior.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snack.dart';
import 'package:damo/view/product/product.dart';
import 'package:like_button/like_button.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final controller = ScrollController();
  DamoAppBar appBar = DamoAppBar();
  ScrollController scrollController = ScrollController();

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    if (isLiked) {
      Get.snackbar(
        '알림',
        '찜목록에서 제거했어요!',
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 1),
        icon: Icon(Icons.favorite),
      );
    } else {
      Get.snackbar(
        '알림',
        '찜목록에 담았어요!',
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 1),
        icon: Icon(Icons.favorite, color: Colors.red),
      );
    }
    return !isLiked;
  }

  Widget viewProduct() {
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
    return Container(
      color: Colors.white,
      child: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
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
                      Get.to(() => Product());
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
                                      animationDuration:
                                          const Duration(milliseconds: 500),
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
          appBar: appBar.appBar(context),
          bottomNavigationBar: BottomNavigation(
            bottomNavigationIndex: 0,
            scrollController: scrollController,
          ),
          body: viewProduct(),
        ),
      ),
    );
  }
}
