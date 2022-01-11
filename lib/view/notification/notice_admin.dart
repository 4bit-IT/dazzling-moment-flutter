import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NotificationAdmin extends StatelessWidget {
  DamoAppBar appBar = DamoAppBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: DamoAppBar().textAppBar(context, '공지사항'),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    height: 1,
                    decoration: BoxDecoration(
                      color: Color(0xfff1f3f5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images_svg/ic_alarmlist_on.svg',
                                width: 30.w,
                                height: 30.h,
                              ),
                              SizedBox(width: 16.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '[중요 시스템 공지]',
                                    style: TextStyle(
                                      color: Color(0xff283137),
                                      fontSize: 12,
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    '10/7 시스템 점검이 있을 예정입니다.',
                                    style: TextStyle(
                                      color: Color(0xff283137),
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '21/10/5',
                            style: TextStyle(
                              color: Color(0xff8e97a0),
                              fontSize: 12,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 21.h),
                  Container(
                    height: 1,
                    margin: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xfff1f3f5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images_svg/ic_noticelist_nomal_on.svg',
                                width: 30.w,
                                height: 30.h,
                              ),
                              SizedBox(width: 16.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '[다모 공지]',
                                    style: TextStyle(
                                      color: Color(0xff283137),
                                      fontSize: 12,
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    '다모 공지사항 입니다',
                                    style: TextStyle(
                                      color: Color(0xff283137),
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '21/10/5',
                            style: TextStyle(
                              color: Color(0xff8e97a0),
                              fontSize: 12,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 21.h),
                  Container(
                    height: 1,
                    margin: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xfff1f3f5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images_svg/ic_noticelist_event_on.svg',
                                width: 30.w,
                                height: 30.h,
                              ),
                              SizedBox(width: 16.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '[이벤트 공지]',
                                    style: TextStyle(
                                      color: Color(0xff283137),
                                      fontSize: 12,
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    '11월 빼빼로 데이 이벤트가 준비되었어요 ',
                                    style: TextStyle(
                                      color: Color(0xff283137),
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '21/10/5',
                            style: TextStyle(
                              color: Color(0xff8e97a0),
                              fontSize: 12,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 21.h),
                  Container(
                    height: 1,
                    margin: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xfff1f3f5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images_svg/ic_noticelist_important_off.svg',
                                width: 30.w,
                                height: 30.h,
                              ),
                              SizedBox(width: 16.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '[다모 공지]',
                                    style: TextStyle(
                                      color: Color(0xffd1d1d6),
                                      fontSize: 12,
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    '다모 공지사항 입니다',
                                    style: TextStyle(
                                      color: Color(0xffd1d1d6),
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '21/10/5',
                            style: TextStyle(
                              color: Color(0xffd1d1d6),
                              fontSize: 12,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 21.h),
                  Container(
                    height: 1,
                    margin: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xfff1f3f5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images_svg/ic_noticelist_nomal_off.svg',
                                width: 30.w,
                                height: 30.h,
                              ),
                              SizedBox(width: 16.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '[다모 공지]',
                                    style: TextStyle(
                                      color: Color(0xffd1d1d6),
                                      fontSize: 12,
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    '다모 공지사항 입니다',
                                    style: TextStyle(
                                      color: Color(0xffd1d1d6),
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '21/10/5',
                            style: TextStyle(
                              color: Color(0xffd1d1d6),
                              fontSize: 12,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 21.h),
                  Container(
                    height: 1,
                    margin: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xfff1f3f5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images_svg/ic_noticelist_event_off.svg',
                                width: 30.w,
                                height: 30.h,
                              ),
                              SizedBox(width: 16.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '[이벤트 공지]',
                                    style: TextStyle(
                                      color: Color(0xffd1d1d6),
                                      fontSize: 12,
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    '10월 이번만 드리는 특별혜택',
                                    style: TextStyle(
                                      color: Color(0xffd1d1d6),
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '21/10/5',
                            style: TextStyle(
                              color: Color(0xffd1d1d6),
                              fontSize: 12,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 21.h),
                  Container(
                    height: 1,
                    margin: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xfff1f3f5),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/images_svg/ic_ mark_20.svg',
                    width: 20.w,
                    height: 20.h,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '최근 30일 동안 30개까지 보관되며,',
                    style: TextStyle(
                      color: Color(0xff8e97a0),
                      fontSize: 12,
                      fontFamily: 'NotoSansCJKKR',
                    ),
                  ),
                  Text(
                    ' 자동삭제 됩니다.',
                    style: TextStyle(
                      color: Color(0xff8e97a0),
                      fontSize: 12,
                      fontFamily: 'NotoSansCJKKR',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
