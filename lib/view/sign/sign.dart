import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:damo/view/sign/get_user_number.dart';
import 'package:damo/view/sign/get_user_name.dart';
import 'package:damo/viewmodel/bar/scroll_behavior.dart';
import 'package:damo/model/kakao.dart';
import 'package:damo/view/sign/sms_auth.dart';
import 'package:damo/view/main/home_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Sign extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoGlowScrollBehavior(),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 234.h,
                  ),
                  SvgPicture.asset('assets/images_svg/logo_login.svg'),
                  SizedBox(
                    height: 214.7.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 16.w,
                      ),
                      Expanded(
                        child: Divider(
                          color: Color(0xfff1f3f5),
                          thickness: 1.h,
                        ),
                      ),
                      SizedBox(
                        width: 9.w,
                      ),
                      Text(
                        '간편 로그인',
                        style: TextStyle(
                          color: Color(0xff8e8e93),
                          fontSize: 18.sp,
                          fontFamily: 'NotoSansCJKKR',
                          height: 1,
                        ),
                      ),
                      SizedBox(
                        width: 9.w,
                      ),
                      Expanded(
                        child: Divider(
                          color: Color(0xfff1f3f5),
                          thickness: 1.h,
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 94.w,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => GetUserInfo());
                        },
                        child: Container(
                          width: 93.w,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: ()async{
                                  try {
                                    String body;
                                    Map signUpData = {
                                      'content': 'test content',
                                      'description': 'test',
                                      'location': {
                                        'latitude': 0,
                                        'longitude': 0
                                      },
                                      'name':'test',
                                      'registrationNumber': '000-00-00000'
                                    };
                                    body = json.encode(signUpData);
                                    http.Response response = await http.post(
                                      Uri.parse(
                                          'https://www.damoforyou.com/api/shop'),
                                      headers: {
                                        'Content-Type': 'application/json',
                                        'token': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoidGVzdCIsIm5pY2tuYW1lIjoidGVzdCIsImVtYWlsIjoiZXhhbXBsZUBkYW1vLmNvbSIsInJvbGUiOiJVU0VSIiwiaWF0IjoxNjM2NDczMjY1LCJzdWIiOiJBY2Nlc3NUb2tlbiIsImV4cCI6MTYzNjQ3NTA2NX0.mERbk7Lu_ElLzm2gHpMlr_SOfBL9XXLkrp6sNsT4Jd4'
                                      },
                                      body: body,
                                    );
                                    print(jsonDecode(utf8.decode(response.bodyBytes)));
                                  }catch(e){
                                    print(e);
                                  }
                                },
                                child: SvgPicture.asset(
                                    'assets/images_svg/ic_login_apple.svg'),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                '애플',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: 'NotoSansCJKKR',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 93.w,
                        child: Column(
                          children: [
                            SvgPicture.asset(
                                'assets/images_svg/ic_login_kakao.svg'),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              '카카오',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontFamily: 'NotoSansCJKKR',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 95.w,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Get.to(() => smsAuth());
                        },
                        color: Colors.blue,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "페이스북으로 로그인",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Get.to(() => HomeMain());
                        },
                        color: Colors.green,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "네이버로 로그인",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Kakao().kakaoLogin();
                        },
                        color: Colors.yellow,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "카카오톡으로 로그인",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Get.to(() => GetUserNickname());
                        },
                        color: Colors.grey[400],
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "애플 로그인",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}