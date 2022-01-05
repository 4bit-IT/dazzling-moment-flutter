import 'package:damo/app/controller/notification/notofication_controller.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NotificationUser extends StatefulWidget {
  @override
  _NotificationUserState createState() => _NotificationUserState();
}

class _NotificationUserState extends State<NotificationUser> {
  DamoAppBar appBar = DamoAppBar();
  final NotificationController notificationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            '알림',
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
        body: SingleChildScrollView(
          child: Column(
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
                                    '[알림]',
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
                                'assets/images_svg/ic_alarmlist_off.svg',
                                width: 30.w,
                                height: 30.h,
                              ),
                              SizedBox(width: 16.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '[알림]',
                                    style: TextStyle(
                                      color: Color(0xffd1d1d6),
                                      fontSize: 12,
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    '읽은거는 어찌바꾸노',
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
                                'assets/images_svg/ic_alarmlist_on.svg',
                                width: 30.w,
                                height: 30.h,
                              ),
                              SizedBox(width: 16.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '[알림]',
                                    style: TextStyle(
                                      color: Color(0xff283137),
                                      fontSize: 12,
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    '너무어렵다',
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
                                    notificationController.message.value!.notification!.title??'title',
                                    style: TextStyle(
                                      color: Color(0xff283137),
                                      fontSize: 12,
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    notificationController.message.value!.notification!.body??'body',
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
              )
            ],
          ),
        ));
  }
}
