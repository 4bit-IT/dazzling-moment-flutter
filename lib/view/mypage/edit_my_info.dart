import 'package:damo/app/controller/user_controller.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

UserController userController = Get.find();

class EditMyInfo extends StatefulWidget {
  const EditMyInfo({Key? key}) : super(key: key);

  @override
  State<EditMyInfo> createState() => _EditMyInfoState();
}

class _EditMyInfoState extends State<EditMyInfo> {
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
                      Obx(
                        () => (ExtendedImage.network(
                          userController.getUserInfoModel.value.profileImage!,
                          width: 75.w,
                          height: 75.h,
                          fit: BoxFit.cover,
                          cache: false,
                          // border: Border.all(color: Colors.red, width: 1.0),
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        )),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: InkWell(
                          onTap: () {
                            Get.bottomSheet(
                              Container(
                                height: 150.h,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          await userController
                                              .onChangedProfileImage();
                                          Get.back();
                                        },
                                        child: ListTile(
                                          title: Center(
                                            child: Text(
                                              '앨범에서 사진 선택',
                                              style: TextStyle(
                                                  color: Color(0xff283137),
                                                  fontFamily: 'NotoSansCJKKR',
                                                  fontSize: 15.h,
                                                  height: 1),
                                            ),
                                          ),
                                          // trailing: Icon(Icons.access_alarms),
                                        ),
                                      ),
                                      Container(
                                        height: 1.h,
                                        decoration: BoxDecoration(
                                          color: Color(0xfff1f3f5),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await userController
                                              .onChangedDefaultProfileImage();
                                          Get.back();
                                        },
                                        child: ListTile(
                                          title: Center(
                                            child: Text(
                                              "기본 이미지로 변경",
                                              style: TextStyle(
                                                  color: Color(0xff283137),
                                                  fontFamily: 'NotoSansCJKKR',
                                                  fontSize: 15.h,
                                                  height: 1),
                                            ),
                                          ),
                                          // trailing: Icon(Icons.ac_unit),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              backgroundColor: Colors.white,
                            );
                          },
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
                              SizedBox(
                                width: 164.w,
                                child: Text(
                                  userController.getUserInfoModel.value.email!,
                                  style: TextStyle(
                                      color: Color(0xff283137),
                                      fontFamily: 'NotoSansCJKKR',
                                      fontSize: 14.h,
                                      height: 1),
                                ),
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
                              SizedBox(
                                width: 168.w,
                                child: Text(
                                  userController
                                      .getUserInfoModel.value.nickname!,
                                  style: TextStyle(
                                      color: Color(0xff283137),
                                      fontFamily: 'NotoSansCJKKR',
                                      fontSize: 14.h,
                                      height: 1),
                                ),
                              ),
                              SizedBox(width: 15.w),
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
                              InkWell(
                                onTap: () async {
                                  await userController.onAddressChanged();
                                },
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 210.w,
                                      child: Obx(
                                        () => Text(
                                          userController.getUserInfoModel.value
                                                  .addr1! +
                                              ' ' +
                                              userController.getUserInfoModel
                                                  .value.addr2!,
                                          style: TextStyle(
                                              color: Color(0xff283137),
                                              fontFamily: 'NotoSansCJKKR',
                                              fontSize: 14.h,
                                              height: 1),
                                          overflow: TextOverflow.ellipsis,
                                        ),
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
                              Text(
                                  '${userController.getUserInfoModel.value.phoneNumber}'),
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
        ],
      ),
    );
  }
}
