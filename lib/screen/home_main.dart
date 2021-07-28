import 'package:damo/screen/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'bottom_navigaton.dart';
import 'location/look_location.dart';
import 'community/look_community.dart';
import 'search/seach_product.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  DamoAppBar tabBar = DamoAppBar();
  final dropdownList = ['거리순', '추천순', '인기순'];
  var selectedDropdown = '거리순';
  var selectedBottomNavigationBarIndex = 0;

  List bottomNavigationBarPages = [
    HomeMain(),
    LookLocation(),
    LookCommunity(),
  ];

  List appBarPages = [
    SearchPage(),
  ];


  DateTime? backbuttonpressedTime;
  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();

    //Statement 1 Or statement2
    bool backButton = backbuttonpressedTime == null ||
        currentTime.difference(backbuttonpressedTime!) > Duration(seconds: 3);

    if (backButton) {
      backbuttonpressedTime = currentTime;
      Fluttertoast.showToast(
          msg: "'뒤로' 버튼을 한번 더 누르시면 종료됩니다.",
          backgroundColor: Colors.black,
          textColor: Colors.white);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
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

  void onTapped(int index) {
    if (selectedBottomNavigationBarIndex != index)
      setState(() {
        selectedBottomNavigationBarIndex = index;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => bottomNavigationBarPages[index]),
        );
      });
  }

  Widget? productList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('lib/images/logo.png'),
        SizedBox(
          width: 20,
        ),
        Image.asset('lib/images/logo.png'),
      ],
    );
  }

  Widget? getSizedBox() {
    return SizedBox(
      height: 20.0,
    );
  }
}
