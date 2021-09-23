import 'package:damo/screen/bar/app_bar.dart';
import 'package:damo/screen/seller/seller_faq_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SellerFAQManagement extends StatefulWidget {
  @override
  _SellerFAQManagementState createState() => _SellerFAQManagementState();
}

class _SellerFAQManagementState extends State<SellerFAQManagement> {
  TextEditingController faqTitleController = TextEditingController();
  TextEditingController faqDocumentController = TextEditingController();

  List<Widget> listFAQ = [];

  void onAddClicked() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("FAQ의 제목과 내용을 입력해 주세요"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
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
                    labelText: 'FAQ의 제목을 입력하세요.',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  enableSuggestions: false,
                  controller: faqDocumentController,
                  maxLines: 10,
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
                    labelText: 'FAQ의 내용을 입력하세요.',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            CupertinoButton(
                child: Text("확인"),
                onPressed: () {
                  addNewFAQ();
                  Navigator.pop(context);
                }),
            CupertinoButton(
              child: Text("취소"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void addNewFAQ() {
    setState(() {
      listFAQ.add(
        Column(children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Q: ${faqTitleController.text}',
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              CupertinoButton(
                child: Row(
                  children: [
                    Text(
                      '자세히',
                      style: GoogleFonts.lato(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SellerFAQInfo(),
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.black12,
            thickness: 8,
          ),
        ]),
      );
      faqTitleController.clear();
      faqDocumentController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamoAppBar().sellerAppBar(context),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: listFAQ,
              ),
              Center(
                child: CupertinoButton(
                  onPressed: onAddClicked,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'FAQ 추가하기',
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ],
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
