import 'package:damo/sign/sign_in.dart';
import 'package:flutter/material.dart';

void main() => runApp(Damo());

class Damo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}
