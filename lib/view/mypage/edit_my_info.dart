import 'package:damo/app/controller/user_controller.dart';
import 'package:damo/view/mypage/user_image_detail.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/custom_textfield.dart';
import 'package:damo/viewmodel/get_dialog.dart';
import 'package:damo/viewmodel/image_model.dart';
import 'package:damo/viewmodel/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

UserController userController = Get.find();

class EditMyInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        FocusScope.of(context).unfocus();
        return Future(() {
          return GetDialog().backButtonDialog(() {
            userController.addr1.value =
                userController.getUserInfoModel.value.addr1!;
            userController.addr2Controller.value.text =
                userController.getUserInfoModel.value.addr2!;
            userController.userImageModel.value.imageUrl =
                userController.getUserInfoModel.value.profileImage!;
          });
        });
      },
      child: Scaffold(
        appBar: DamoAppBar().textAppBar(context, '내 정보 수정'),
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
                        child: Column(
                          children: [
                            SizedBox(height: 24.h),
                            InkWell(
                              onTap: () {
                                Get.bottomSheet(
                                  Wrap(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          Get.back();
                                          Get.to(() => UserImageDetail());
                                        },
                                        child: ListTile(
                                          title: Center(
                                            child: Text(
                                              '사진 확대하기',
                                              style: TextStyle(
                                                color: Color(0xff283137),
                                                fontSize: 15.sp,
                                                fontFamily: 'NotoSansCJKKR',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          // trailing: Icon(Icons.access_alarms),
                                        ),
                                      ),
                                      Divider(),
                                      InkWell(
                                        onTap: () async {
                                          await userController
                                              .selectProfileImage();
                                          Get.back();
                                        },
                                        child: ListTile(
                                          title: Center(
                                            child: Text(
                                              '앨범에서 사진 선택',
                                              style: TextStyle(
                                                color: Color(0xff283137),
                                                fontSize: 15.sp,
                                                fontFamily: 'NotoSansCJKKR',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          // trailing: Icon(Icons.access_alarms),
                                        ),
                                      ),
                                      Divider(),
                                      InkWell(
                                        onTap: () async {
                                          await userController
                                              .selectDefaultProfileImage();
                                          Get.back();
                                        },
                                        child: ListTile(
                                          title: Center(
                                            child: Text(
                                              "기본 이미지로 변경",
                                              style: TextStyle(
                                                color: Color(0xff283137),
                                                fontSize: 15.sp,
                                                fontFamily: 'NotoSansCJKKR',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  backgroundColor: Colors.white,
                                );
                              },
                              child: Stack(
                                children: [
                                  Obx(
                                    () => userController.userImageModel.value
                                                .imageUrl !=
                                            null
                                        ? ImageModel().networkImage(
                                            userController.getUserInfoModel
                                                .value.profileImage!)
                                        : userController.userImageModel.value
                                                    .image !=
                                                null
                                            ? ImageModel().circleImage(
                                                userController
                                                    .userImageModel.value.image)
                                            : ImageModel().circleImage(
                                                userController.userImageModel
                                                    .value.defaultImage!.image),
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: SvgPicture.asset(
                                      'assets/images_svg/ic_프로필변경.svg',
                                      width: 30.w,
                                      height: 30.h,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Column(
                              children: [
                                Container(
                                  height: 60.h,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 100.w,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '이메일',
                                            ),
                                            SvgPicture.asset(
                                              'assets/images_svg/ic_kakao_20.svg',
                                              width: 20.w,
                                              height: 20.h,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(userController
                                          .getUserInfoModel.value.email!),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 59.h,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 100.w,
                                        child: Text('닉네임'),
                                      ),
                                      Text(userController
                                          .getUserInfoModel.value.nickname!),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    await userController.selectAddress();
                                  },
                                  child: Container(
                                    height: 59.h,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 100.w,
                                          child: Text('주소'),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Obx(
                                                () => Expanded(
                                                  child: Text(userController
                                                      .addr1.value),
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
                                ),
                                Container(
                                  height: 59.h,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 100.w,
                                        child: Text('상세 주소'),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () async {
                                            await userController
                                                .onAddressChanged();
                                          },
                                          child: CustomTextField()
                                              .simpleTextField(
                                                  userController
                                                      .addr2Controller.value,
                                                  false,
                                                  null,
                                                  TextAlign.start,
                                                  '',
                                                  1,
                                                  1,
                                                  () {},
                                                  [],''),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 59.h,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 100.w,
                                        child: Text('전화 번호 인증'),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                '${userController.getUserInfoModel.value.phoneNumber}'),
                                            Row(
                                              children: [
                                                Text(
                                                  '인증완료',
                                                  style: TextStyle(
                                                    color: Color(0xfff93f5b),
                                                    fontFamily: 'NotoSansCJKKR',
                                                    fontSize: 14.sp,
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      await userController.clickUserInfoModify();
                    },
                    child: Container(
                      color: Color(0xfff93f5b),
                      width: double.infinity,
                      height: 70.h,
                      alignment: Alignment.center,
                      child: Text(
                        '수정 완료',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontFamily: 'NotoSansCJKKR',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => Visibility(
                  visible: userController.isFetchingData.value,
                  child: Container(
                      color: Colors.black45,
                      alignment: Alignment.center,
                      child: Loading().simpleLoading()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
