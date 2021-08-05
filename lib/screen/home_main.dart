import 'package:damo/screen/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:transition/transition.dart';
import '../drawer.dart';
import 'bottom_navigaton.dart';
import 'package:damo/back_button_clicked.dart';
import 'package:damo/product_info.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  DamoAppBar tabBar = DamoAppBar();
  final dropdownList = ['거리순', '추천순', '인기순'];
  var selectedDropdown = '거리순';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 10.0,
          ),
          DropdownButton(
            value: selectedDropdown,
            items: dropdownList.map(
              (value) {
                return DropdownMenuItem(
                  value: value,
                  child: Container(
                    child: Text(value),
                  ),
                );
              },
            ).toList(),
            onChanged: (value) {
              setState(() {
                selectedDropdown = value.toString();
              });
            },
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15.0,
                    mainAxisExtent: 330.0,
                    crossAxisSpacing: 6.0,
                    childAspectRatio: 1.0),
                padding: const EdgeInsets.fromLTRB(5.5, 0.0, 5.5, 0.0),
                itemCount: imageList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
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
                    child: Card(
                      // elevation: 3.5, //음영
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0), //둥글기
                      ),
                      //테두리를 입체감으로 줌.
                      shadowColor: Colors.black87,
                      // decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.grey, width: 0.5)),
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
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(
                          //       " 내 위치에서",
                          //       style: TextStyle(
                          //           fontFamily: 'NotoSans',
                          //           color: Colors.black87),
                          //     ),
                          //     Row(
                          //       children: [
                          //         Text(
                          //           "128 m ",
                          //           style: TextStyle(color: Colors.red),
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border_outlined,
                                ),
                              ),
                              // Row(
                              //   children: [
                              //     Text('99+구매 '),
                              //   ],
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
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
          bottomNavigationBar: BottomNavigation(bottomNavigationIndex: 0),
          body: TabBarView(
            children: [
              viewProduct(),
              Text('꽃임'),
            ],
          ),
        ),
      ),
    );
  }
}
