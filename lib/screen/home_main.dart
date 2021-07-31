import 'package:damo/screen/app_bar.dart';
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
            Image.asset('assets/images/logo.png'),
            SizedBox(
              width: 20,
            ),
            Image.asset('assets/images/logo.png'),
          ],
        ),
        SizedBox(height: 10.0,),
      ],
    );
  }
}
