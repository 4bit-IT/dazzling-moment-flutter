import 'package:damo/app/controller/agreement_controller.dart';
import 'package:damo/app/controller/user_controller.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

UserController userController = Get.find();
AgreementController agreementController = Get.put(AgreementController());

class SettingApp extends StatelessWidget {
  const SettingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: DamoAppBar().textAppBar(context, '앱 알림 및 설정'),
        body: Container(
          padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 11.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '마케팅 수신 동의',
                    style: TextStyle(
                      color: Color(0xff283137),
                      fontFamily: 'NotoSansCJKKR',
                    ),
                  ),
                  Obx(
                    () => Switch(
                      value: userController.getUserInfoModel.value.marketing!,
                      onChanged: (value) async {
                        await agreementController.onChangedAgreementMarketing();
                      },
                      activeTrackColor: Colors.grey[300],
                      activeColor: Color(0xfff93f5b),
                    ),
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
                    '푸쉬 알림 동의',
                    style: TextStyle(
                      color: Color(0xff283137),
                      fontFamily: 'NotoSansCJKKR',
                    ),
                  ),
                  Obx(
                    () => Switch(
                      value: userController
                          .getUserInfoModel.value.pushNotification!,
                      onChanged: (value) async {
                        await agreementController.onChangedAgreementPush();
                      },
                      activeTrackColor: Colors.grey[300],
                      activeColor: Color(0xfff93f5b),
                    ),
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
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 20.h, 0, 20.h),
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
              ),
              Container(
                height: 1,
                decoration: BoxDecoration(
                  color: Color(0xfff1f3f5),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 20.h, 0, 20.h),
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
              ),
              Container(
                height: 1,
                decoration: BoxDecoration(
                  color: Color(0xfff1f3f5),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 20.h, 0, 20.h),
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
              ),
              Container(
                height: 1,
                decoration: BoxDecoration(
                  color: Color(0xfff1f3f5),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 20.h, 0, 20.h),
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
              ),
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
