import 'package:damo/app/controller/sign_controller.dart';
import 'package:damo/view/mypage/updateAppleInfo/updateAppleInfoBirth.dart';
import 'package:damo/view/mypage/updateAppleInfo/updateAppleInfoPhoneNumber.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/get_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class UpdateAppleInfoUsername extends StatelessWidget {
  SignController signController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        FocusScope.of(context).unfocus();
        return Future(() {
          signController.usernameController.value.clear();
          signController.acceptOff(0);
          Get.back();
          return true;
        });
      },
      child: Scaffold(
        appBar: DamoAppBar().textAppBar(context, ''),
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        Text('이름을 입력해주세요'),
                        SizedBox(height: 16.h),
                        Container(
                          height: 52.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color(0xffd1d1d6),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            children: [
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 0),
                                  child: Obx(
                                    () => TextFormField(
                                      focusNode: signController
                                          .usernameFocusNode.value,
                                      onChanged: (text) {
                                        text != ''
                                            ? signController
                                                .isUsernameCheck.value = true
                                            : signController
                                                .isUsernameCheck.value = false;
                                      },
                                      controller: signController
                                          .usernameController.value,
                                      style: TextStyle(
                                        fontFamily: 'NotoSansCJKKR',
                                        fontSize: 18.sp,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '이름을 입력해주세요',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  if (signController.isUsernameCheck.value) {
                    Get.to(() => UpdateAppleInfoBirth());
                  }
                },
                child: Obx(
                  () => Container(
                    height: 60.h,
                    alignment: Alignment.center,
                    color: signController.isUsernameCheck.value
                        ? Color(0xfff93f5b)
                        : Color(0xffd1d1d6),
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
            ],
          ),
        ),
      ),
    );
  }
}
