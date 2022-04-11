import 'package:damo/view/mypage/updateAppleInfo/updateAppleInfoPhoneNumber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../viewmodel/bar/app_bar.dart';
import '../../../viewmodel/bar/drawer.dart';
import '../../sign/sign.dart';

class UpdateAppleInfoSex extends StatelessWidget {
  const UpdateAppleInfoSex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        FocusScope.of(context).unfocus();
        return Future(() {
          signController.sexValue.value = 0;
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
                        Text('성별을 선택해주세요'),
                        SizedBox(height: 16.h),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => (ElevatedButton(
                                  onPressed: () {
                                    (signController.sexValue.value == 2)
                                        ? signController.sexValue.value = 1
                                        : signController.sexValue.value = 1;
                                    signController.isSexCheck.value = true;
                                  },
                                  child: Text("남자"),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    primary: signController.sexValue.value == 1
                                        ? Color(0xfff93f5b)
                                        : Color(0xffd1d1d6),
                                    // onPrimary: Color(0xfff93f5b),
                                    // onSurface: Color.fromARGB(255, 44, 20, 24),
                                    fixedSize: Size(168.w, 52.h),
                                  ),
                                )),
                              ),
                              SizedBox(width: 10.w),
                              Obx(
                                () => (ElevatedButton(
                                  onPressed: () {
                                    (signController.sexValue.value == 1)
                                        ? signController.sexValue.value = 2
                                        : signController.sexValue.value = 2;
                                    signController.isSexCheck.value = true;
                                  },
                                  child: Text("여자"),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    primary: signController.sexValue.value == 2
                                        ? Color(0xfff93f5b)
                                        : Color(0xffd1d1d6),
                                    // onPrimary: Color(0xfff93f5b),
                                    // onSurface: Color.fromARGB(255, 44, 20, 24),
                                    fixedSize: Size(168.w, 52.h),
                                  ),
                                )),
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
                  if (signController.isSexCheck.value) {
                    // Get.to(() => UpdateAppleInfoPhoneNumber());
                    await signController.onAppleInfoUpdate();
                  }
                },
                child: Obx(
                  () => Container(
                    height: 60.h,
                    alignment: Alignment.center,
                    color: (signController.sexValue.value == 1 ||
                            signController.sexValue.value == 2)
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
