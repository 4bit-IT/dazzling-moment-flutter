import 'package:flutter/material.dart';

class LookLocation extends StatefulWidget {

  @override
  _LookLocationState createState() => _LookLocationState();
}

class _LookLocationState extends State<LookLocation> {
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
    );
  }
}
