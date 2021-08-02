import 'package:damo/screen/app_bar.dart';
import 'package:damo/sign/sign_in.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';
import 'bottom_navigaton.dart';
import 'package:damo/back_button_clicked.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  DamoAppBar tabBar = DamoAppBar();
  final dropdownList = ['거리순', '추천순', '인기순'];
  var selectedDropdown = '거리순';


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
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
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
                          SizedBox(
                            width: 50,
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int i = 0; i < 10; i++) productList()!,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text('꽃임'),
            ],
          ),
        ),
      ),
    );
  }

  Widget? productList() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: SizedBox(
                width: 200,
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                      },
                      child: Column(
                        children: [
                          Image.asset('assets/images/pro.JPG',
                          ),
                          Text(
                            "곰돌곰돌",
                            style: TextStyle(
                                fontFamily: 'NotoSans',
                                color: Colors.black87,
                                fontSize:16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            '서면에서 입소문난 수제 케이크 안좆모안좆모안좆모안좆모안좆모안좆모안좆모안좆모안좆모안좆모안좆모',
                            style: TextStyle(color: Colors.black54),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Text(
                                "내 위치에서 ",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    color: Colors.black87),
                              ),
                              //  SizedBox(width:62.0),
                              Row(

                                children: [
                                  Text(
                                    "128 m",
                                    style: TextStyle(
                                        color: Colors.red),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        elevation: 0.0,
                      ),
                    ),
                    SizedBox(

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width:8.0),
                              Icon(Icons.star,
                                color: Colors.orangeAccent,
                              ),
                              Text(
                                " 4.9",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite_border_outlined,),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('99+구매  '),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              child: SizedBox(
                width: 200,
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                      },
                      child: Column(
                        children: [
                          Image.asset('assets/images/pro.JPG',
                          ),
                          Text(
                            "곰돌곰돌",
                            style: TextStyle(
                                fontFamily: 'NotoSans',
                                color: Colors.black87,
                                fontSize:16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            '서면에서 입소문난 수제 케이크 안좆모안좆모안좆모안좆모안좆모안좆모안좆모안좆모안좆모안좆모안좆모',
                            style: TextStyle(color: Colors.black54),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Text(
                                "내 위치에서 ",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    color: Colors.black87),
                              ),
                              //  SizedBox(width:62.0),
                              Row(

                                children: [
                                  Text(
                                    "129 m",
                                    style: TextStyle(
                                        color: Colors.red),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        elevation: 0.0,
                      ),
                    ),
                    SizedBox(

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width:8.0),
                              Icon(Icons.star,
                                 color: Colors.orangeAccent,
                              ),
                              Text(
                                " 5.0",
                                style: TextStyle(
                                    color: Colors.black87,
                                fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite_border_outlined,),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('99+구매  '),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
