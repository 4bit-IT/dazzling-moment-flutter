import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);
  @override
  State<test> createState() => _testState();
}

Future<void> addr2() async {
  Get.defaultDialog(
    title: "Sample Dialog",
    middleText: "You content goes here...",
    content: getContent(),
    barrierDismissible: false,
    radius: 50.0,
    confirm: confirmBtn(),
    cancel: cancelBtn(),
  );
}

Widget getContent() {
  return Column(
    children: [
      Text("Your content goes here widget"),
      Text("Your content goes here widget"),
      Text("Your content goes here widget"),
      Text("Your content goes here widget"),
    ],
  );
}

Widget confirmBtn() {
  return ElevatedButton(
      onPressed: () {
        Get.back();
      },
      child: Text("Confirm"));
}

Widget cancelBtn() {
  return ElevatedButton(
      onPressed: () {
        Get.back();
      },
      child: Text("Cancel"));
}

class _testState extends State<test> {
  @override
  void initState() async {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
