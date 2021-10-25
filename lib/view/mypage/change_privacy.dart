import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePrivacy extends StatefulWidget {
  @override
  _ChangePrivacyState createState() => _ChangePrivacyState();
}

class _ChangePrivacyState extends State<ChangePrivacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().noActionBar(context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.white,
                        child: Image.asset('assets/images/DAMO_logo-01.png'),
                      ),
                      // child: file == null
                      //     ? Image.asset('assets/images/DAMO_logo-01.png')
                      //     : Image.file(
                      //         File(file!.path),
                      //         fit: BoxFit.fill,
                      //         width: double.infinity,
                      //       )),
                      Positioned(
                          bottom: 5,
                          right: 5,
                          child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.black38,
                              size: 40,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        width: MediaQuery.of(context).size.width * 2 / 3,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.black38,
                          ),
                        ),
                        child: Text(
                          '닉네임',
                          style: GoogleFonts.lato(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                        ),
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: Text(
                            '변경',
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    color: Colors.black12,
                    thickness: 8,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '이메일',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'dev@gmail.com',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '휴대폰 번호',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(
                      5,
                    ),
                    width: MediaQuery.of(context).size.width / 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        width: 1,
                        color: Colors.black38,
                      ),
                    ),
                    child: Text(
                      '010',
                      style: GoogleFonts.lato(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(
                      5,
                    ),
                    width: MediaQuery.of(context).size.width / 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        width: 1,
                        color: Colors.black38,
                      ),
                    ),
                    child: Text(
                      '0000',
                      style: GoogleFonts.lato(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(
                      5,
                    ),
                    width: MediaQuery.of(context).size.width / 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        width: 1,
                        color: Colors.black38,
                      ),
                    ),
                    child: Text(
                      '0000',
                      style: GoogleFonts.lato(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(
                      5,
                    ),
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                    ),
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      onPressed: () {
                        //onNumberRecertification();
                      },
                      child: Text(
                        '재인증',
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: Colors.black12,
                thickness: 4,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '마케팅 정보 수신동의',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '메일 수신 동의',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Switch(
                    value: false,
                    onChanged: (value) {
                      setState(() {});
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SMS 수신 동의',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Switch(
                    value: true,
                    onChanged: (value) {
                      setState(() {});
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
