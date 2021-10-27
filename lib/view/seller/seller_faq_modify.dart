import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter/material.dart';

class SellerFAQModify extends StatefulWidget {
  @override
  _SellerFAQModifyState createState() => _SellerFAQModifyState();
}

class _SellerFAQModifyState extends State<SellerFAQModify> {
  TextEditingController faqTitleController = TextEditingController();
  TextEditingController faqDocumentController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
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
