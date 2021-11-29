import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter/material.dart';

class ShopFAQModify extends StatefulWidget {
  @override
  _ShopFAQModifyState createState() => _ShopFAQModifyState();
}

class _ShopFAQModifyState extends State<ShopFAQModify> {
  TextEditingController faqTitleController = TextEditingController();
  TextEditingController faqDocumentController = TextEditingController();

  @override
  void initState() {
    super.initState();

    String faqTitle = 'FAQ 제목';
    String faqDocument = 'FAQ 내용';
    faqTitleController.text = faqTitle;
    faqDocumentController.text = faqDocument;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().noSearchBar(context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                maxLines: 2,
                enableSuggestions: false,
                controller: faqTitleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.redAccent,
                      width: 2,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                maxLines: 20,
                enableSuggestions: false,
                controller: faqDocumentController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.redAccent,
                      width: 2,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
