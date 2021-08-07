import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BackButtonClicked {
  DateTime? backButtonPressedTime;
  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();
    bool backButton = backButtonPressedTime == null ||
        currentTime.difference(backButtonPressedTime!) > Duration(seconds: 3);

    if (backButton) {
      backButtonPressedTime = currentTime;
      Fluttertoast.showToast(
          msg: "'뒤로' 버튼을 한번 더 누르시면 종료됩니다.",
          backgroundColor: Colors.black,
          textColor: Colors.white);
      return false;
    }
    SystemNavigator.pop();
    return true;
  }
}
