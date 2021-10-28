import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchItem = GlobalKey<FormState>();
  DamoAppBar appBar = DamoAppBar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Row(
            children: [
              SizedBox(width: 10.w),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset('assets/images_svg/ic_back.svg',
                    width: 30.w, height: 30.h),
              ),
              SizedBox(width: 9.w),
              Container(
                width: 310.w,
                height: 36.h,
                child: TextFormField(
                  minLines: 1,
                  maxLength: 10,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    counterText: '',
                    fillColor: Colors.red,
                    focusColor: Color(0xff283137),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Color(0xffd1d1d6),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Color(0xffd1d1d6),
                        width: 2.0,
                      ),
                    ),
                    hintText: '원하시는 선물을 검색하세요',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/images_svg/ic_search_gray_20.svg',
                      ),
                    ),
                    hintStyle: TextStyle(
                      height: 2.8.h,
                      color: Color(0xffd1d1d6),
                      fontFamily: 'NotoSansCJKKR',
                    ),
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
