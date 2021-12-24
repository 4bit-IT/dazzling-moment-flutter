import 'package:damo/viewmodel/bar/bottom_navigaton.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(
        selectedBottomNavigationBarIndex: 2,
      ),
      backgroundColor: Colors.white,
    );
  }
}
