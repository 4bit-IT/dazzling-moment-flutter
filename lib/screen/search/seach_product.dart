import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchTextEditingController = TextEditingController();

  controlSearching(str) {
    print(str);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextFormField(
          controller: searchTextEditingController,
          decoration: InputDecoration(
            hintText: '검색하기',
            hintStyle: GoogleFonts.lato(
              color: Colors.grey,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            filled: true,
            prefixIcon: Icon(
              Icons.person_pin,
              color: Colors.white,
              size: 30,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.clear,
                color: Colors.white,
              ),
              onPressed: () {
                searchTextEditingController.clear();
              },
            ),
          ),
          style: TextStyle(
              fontSize: 18,
              color: Colors.white
          ),
          onFieldSubmitted: controlSearching,
        ),
      ),
    );
  }
}