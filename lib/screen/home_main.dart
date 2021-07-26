import 'package:damo/screen/app_bar.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
