import 'package:flutter/material.dart';
import 'location/look_location.dart';
import 'community/look_community.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final dropdownList = ['거리순', '추천순', '인기순'];
  var selectedDropdown = '거리순';
  var selectedBottomNavigationBarIndex = 0;
  List? bottomNavigationBarPages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottomNavigationBarPages = [
      HomeMain(),
      LookLocation(),
      LookCommunity(),
    ];
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Image.asset('lib/images/logo.png'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
              color: Colors.red,
              iconSize: 30.0,
            ),
            SizedBox(width: 10.0),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {},
              color: Colors.red,
              iconSize: 30.0,
            ),
            SizedBox(width: 10.0),
          ],
          bottom: TabBar(
            labelStyle: TextStyle(fontSize: 20.0),
            unselectedLabelStyle: TextStyle(fontSize: 15.0),
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.white,
            isScrollable: false,
            tabs: [
              Tab(text: '핸드메이드 케이크'),
              Tab(text: '꽃'),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: '상품 보기',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              label: '지도로 보기',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined),
              label: '커뮤니티',
            ),
          ],
          selectedItemColor: Colors.amber[800],
          currentIndex: selectedBottomNavigationBarIndex,
          onTap: onTapped,
        ),
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
                          for(int i=0;i<10;i++) productList()!,
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
    if(selectedBottomNavigationBarIndex!=index)
    setState(() {
      selectedBottomNavigationBarIndex = index;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => bottomNavigationBarPages![index]),
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
