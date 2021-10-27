import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class SettingApp extends StatefulWidget {
  const SettingApp({Key? key}) : super(key: key);

  @override
  _SettingAppState createState() => _SettingAppState();
}

class _SettingAppState extends State<SettingApp> {
  bool isLocationSwitched = false;
  bool isNoticeSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            '앱 알림 및 설정',
            style: TextStyle(
              color: Color(0xff283137),
              fontSize: 16,
              fontFamily: 'NotoSansCJKKR',
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: InkWell(
                onTap: Get.back,
                child: SvgPicture.asset(
                  'assets/images_svg/ic_back.svg',
                  width: 30.w,
                  height: 30.h,
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 1,
                decoration: BoxDecoration(
                  color: Color(0xfff1f3f5),
                ),
              ),
              SizedBox(height: 11.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '위치 정보 접근 허용',
                    style: TextStyle(
                      color: Color(0xff283137),
                      fontFamily: 'NotoSansCJKKR',
                    ),
                  ),
                  Switch(
                    value: isLocationSwitched,
                    onChanged: (value) {
                      setState(() {
                        isLocationSwitched = value;
                      });
                    },
                    activeTrackColor: Colors.grey[300],
                    activeColor: Color(0xfff93f5b),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Container(
                height: 1,
                decoration: BoxDecoration(
                  color: Color(0xfff1f3f5),
                ),
              ),
              SizedBox(height: 11.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '알림 설정',
                    style: TextStyle(
                      color: Color(0xff283137),
                      fontFamily: 'NotoSansCJKKR',
                    ),
                  ),
                  Switch(
                    value: isNoticeSwitched,
                    onChanged: (value) {
                      setState(() {
                        isNoticeSwitched = value;
                      });
                    },
                    activeTrackColor: Colors.grey[300],
                    activeColor: Color(0xfff93f5b),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Container(
                height: 1,
                decoration: BoxDecoration(
                  color: Color(0xfff1f3f5),
                ),
              ),
              SizedBox(height: 23.h),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '서비스 이용 약관',
                      style: TextStyle(
                        color: Color(0xff283137),
                        fontFamily: 'NotoSansCJKKR',
                      ),
                    ),
                    SvgPicture.asset('assets/images_svg/ic_바로가기.svg',
                        width: 20.w, height: 20.h),
                  ],
                ),
              ),
              SizedBox(height: 22.h),
              Container(
                height: 1,
                decoration: BoxDecoration(
                  color: Color(0xfff1f3f5),
                ),
              ),
              SizedBox(height: 23.h),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '개인정보 처리방침',
                      style: TextStyle(
                        color: Color(0xff283137),
                        fontFamily: 'NotoSansCJKKR',
                      ),
                    ),
                    SvgPicture.asset('assets/images_svg/ic_바로가기.svg',
                        width: 20.w, height: 20.h),
                  ],
                ),
              ),
              SizedBox(height: 22.h),
              Container(
                height: 1,
                decoration: BoxDecoration(
                  color: Color(0xfff1f3f5),
                ),
              ),
              SizedBox(height: 23.h),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '버전 정보',
                      style: TextStyle(
                        color: Color(0xff283137),
                        fontFamily: 'NotoSansCJKKR',
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '최신버전 사용중',
                          style: TextStyle(
                            color: Color(0xfff93f5b),
                            fontFamily: 'NotoSansCJKKR',
                          ),
                        ),
                        SvgPicture.asset('assets/images_svg/ic_바로가기.svg',
                            width: 20.w, height: 20.h),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22.h),
              Container(
                height: 1,
                decoration: BoxDecoration(
                  color: Color(0xfff1f3f5),
                ),
              ),
              SizedBox(height: 23.h),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '회원탈퇴',
                      style: TextStyle(
                        color: Color(0xff283137),
                        fontFamily: 'NotoSansCJKKR',
                      ),
                    ),
                    SvgPicture.asset('assets/images_svg/ic_바로가기.svg',
                        width: 20.w, height: 20.h),
                  ],
                ),
              ),
              SizedBox(height: 22.h),
              Container(
                height: 1,
                decoration: BoxDecoration(
                  color: Color(0xfff1f3f5),
                ),
              ),
            ],
          ),
        ));
  }
}
