import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GetDialog {
  void alternativeDialog(String text, dynamic func()) {
    Get.dialog(
      Dialog(
        child: Container(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                child: Text(
                  text,
                  style: TextStyle(
                      color: Color(0xff283137),
                      fontFamily: 'NotoSansCJKKR',
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                      child: Text('아니오'),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await func();
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                      child: Text('예'),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void simpleDialog(String text) {
    Get.dialog(
      Dialog(
        child: Container(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                child: Text(
                  text,
                  style: TextStyle(
                      color: Color(0xff283137),
                      fontFamily: 'NotoSansCJKKR',
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 32.h),
              Container(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () async {
                    Get.back();
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                    child: Text('확인'),
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
