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
        backgroundColor: Colors.pink.shade200,
        automaticallyImplyLeading: true, //뒤로 가기 제공

        title: TextFormField(
          keyboardType: TextInputType.text,
          controller: searchTextEditingController,
          decoration: InputDecoration(
            hintText: '검색하기',
            hintStyle: GoogleFonts.lato(color: Colors.black38),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.pink.shade200),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.pink.shade200,
              ),
            ),
            filled: true,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black38,
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
          style: TextStyle(fontSize: 19, color: Colors.black87),
          onFieldSubmitted: controlSearching,
        ),
      ),
    );
  }
}
