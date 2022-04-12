import 'package:damo/app/controller/sign_controller.dart';
import 'package:damo/view/sign/get_user_number.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/custom_textfield.dart';
import 'package:damo/viewmodel/get_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GetUserNickname extends StatelessWidget {
  final signController = Get.find<SignController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        FocusScope.of(context).unfocus();
        return Future(() {
          return GetDialog().backButtonDialog(() {
            signController.nicknameController.value.clear();
            signController.nicknameCheckString.value =
                '* 닉네임은 한글, 숫자, 영문으로 된 2~8자로 구성해주세요.';
          });
        });
      },
      child: Scaffold(
        appBar: DamoAppBar().textAppBar(context, '회원가입'),
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      Text(
                        '닉네임을 입력해주세요',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 16.h),
                      CustomTextField().simpleTextField(
                          signController.nicknameController.value,
                          false,
                          TextInputType.text,
                          TextAlign.center,
                          "닉네임",
                          1,
                          1, () {
                        signController.isNicknameCheck.value = false;
                        signController.doubleCheckClicked();
                      }, [], ""),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 16.h, 0, 12.h),
                        child: Obx(
                          () => Text(
                            '${signController.nicknameCheckString.value}',
                            style: TextStyle(
                              color: Color(0xfff93f5b),
                              fontSize: 14.sp,
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      InkWell(
                        onTap: () async {
                          /*if (signController.acceptList[1].value.check &&
                              signController.acceptList[2].value.check &&
                              signController.isNicknameCheck.value) {
                            await signController.signUpClicked();
                          }*/
                          Get.to(() => GetUserNumber());
                        },
                        child: Obx(
                              () => Container(
                            height: 60.h,
                            alignment: Alignment.center,
                            color: signController.confirmButtonColor,
                            child: Text(
                              '확인',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontFamily: 'NotoSansCJKKR',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      )
                      /*Container(
                        height: 132.h,
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Obx(
                                  () => Row(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            signController.acceptList[index]
                                                        .value.check ==
                                                    true
                                                ? signController
                                                    .acceptOff(index)
                                                : signController
                                                    .acceptOn(index);
                                          },
                                          child: signController
                                              .acceptList[index].value.ic),
                                      SizedBox(width: 8.w),
                                      index == 0
                                          ? Text(
                                              '${signController.acceptList[index].value.description}',
                                              style: TextStyle(
                                                color: Color(0xff283137),
                                                fontSize: 13.sp,
                                                fontFamily: 'NotoSansCJKKR',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            )
                                          : Text(
                                              '${signController.acceptList[index].value.description}',
                                              style: TextStyle(
                                                color: Color(0xff283137),
                                                fontSize: 13.sp,
                                                fontFamily: 'NotoSansCJKKR',
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8.h),
                              ],
                            );
                          },
                        ),
                      ),*/
                    ],
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
