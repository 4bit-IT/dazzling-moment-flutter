import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditMyInfo extends StatelessWidget {
  const EditMyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          '내 정보 수정',
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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 1.h,
                    decoration: BoxDecoration(
                      color: Color(0xfff1f3f5),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Stack(
                    children: [
                      SvgPicture.asset(
                        'assets/images_svg/img_여자기본프로필.svg',
                        width: 75.w,
                        height: 75.h,
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/images_svg/ic_프로필변경.svg',
                            width: 30.w,
                            height: 30.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 39.h,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
                    child: Column(
                      children: [
                        Container(
                          height: 1.h,
                          decoration: BoxDecoration(
                            color: Color(0xfff1f3f5),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(16.w, 0, 0, 0),
                          height: 59.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '이메일',
                                style: TextStyle(
                                    color: Color(0xff283137),
                                    fontFamily: 'NotoSansCJKKR',
                                    fontSize: 14.h,
                                    height: 1),
                              ),
                              Text(
                                '4bitdamo@naver.com',
                                style: TextStyle(
                                    color: Color(0xff283137),
                                    fontFamily: 'NotoSansCJKKR',
                                    fontSize: 14.h,
                                    height: 1),
                              ),
                              SvgPicture.asset(
                                'assets/images_svg/ic_kakao_20.svg',
                                width: 20.w,
                                height: 20.h,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1.h,
                          decoration: BoxDecoration(
                            color: Color(0xfff1f3f5),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(16.w, 0, 0, 0),
                          height: 59.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '닉네임',
                                style: TextStyle(
                                    color: Color(0xff283137),
                                    fontFamily: 'NotoSansCJKKR',
                                    fontSize: 14.h,
                                    height: 1),
                              ),
                              Container(
                                height: 40.h,
                                width: 230.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xffd1d1d6),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    8.r,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        inputFormatters: [],
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                            color: Color(0xffd1d1d6),
                                            fontFamily: 'NotoSansCJKKR',
                                            fontSize: 14.h,
                                            height: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      'assets/images_svg/btn_중복확인.svg',
                                      width: 80.w,
                                      height: 40.h,
                                      fit: BoxFit.fill,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1.h,
                          decoration: BoxDecoration(
                            color: Color(0xfff1f3f5),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(16.w, 0, 8.w, 0),
                          height: 59.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '주소 변경',
                                style: TextStyle(
                                  color: Color(0xff283137),
                                  fontFamily: 'NotoSansCJKKR',
                                  fontSize: 14.h,
                                  height: 1,
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/images_svg/ic_바로가기.svg',
                                width: 20.w,
                                height: 20.h,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1.h,
                          decoration: BoxDecoration(
                            color: Color(0xfff1f3f5),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(16.w, 0, 8.w, 0),
                          height: 59.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '전화 번호 인증',
                                style: TextStyle(
                                  color: Color(0xff283137),
                                  fontFamily: 'NotoSansCJKKR',
                                  fontSize: 14.h,
                                  height: 1,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '인증완료',
                                    style: TextStyle(
                                      color: Color(0xfff93f5b),
                                      fontFamily: 'NotoSansCJKKR',
                                      fontSize: 14.h,
                                      height: 1,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  SvgPicture.asset(
                                    'assets/images_svg/ic_바로가기.svg',
                                    width: 20.w,
                                    height: 20.h,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1.h,
                          decoration: BoxDecoration(
                            color: Color(0xfff1f3f5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SvgPicture.asset(
            'assets/images_svg/btn_수정완료.svg',
            width: 375.w,
          ),
        ],
      ),
    );
  }
}
