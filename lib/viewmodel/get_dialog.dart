import 'package:damo/view/mypage/updateAppleInfo/updateAppleInfoNickname.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GetDialog {
  void alternativeDialog(String text, Future<void> func()) {
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
              dialogBottom(func, '아니오', '예'),
            ],
          ),
        ),
      ),
    );
  }

  Widget dialogBottom(Future<void> func(), String reject, String accept) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
            child: Text(reject),
          ),
        ),
        InkWell(
          onTap: () async {
            Get.back();
            await func();
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
            child: Text(accept),
          ),
        )
      ],
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

  Future<bool> backButtonDialog(dynamic func()) async {
    bool returnValue = false;
    await Get.dialog(
      Dialog(
        child: Container(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                child: Text(
                  '종료하시겠습니까?',
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
                      returnValue = false;
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                      child: Text('아니오'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      returnValue = true;
                      func();
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
    print(returnValue);
    return returnValue;
  }

  Future<dynamic> onAdditionalInformationApple() async {
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)), //테두리 둥글기
      title: Text("[애플 회원가입]\n추가 정보를 입력하셔야 합니다.\n\n이동하시겠습니까?"),
      actions: [
        TextButton(
          child: Text(
            "예",
            style: TextStyle(fontFamily: 'NotoSans', color: Colors.red[400]),
          ),
          onPressed: () async {
            Get.back();
            Get.to(
              () => UpdateAppleInfoNickname(),
            );
          },
        ),
        TextButton(
            child: Text(
              "아니오",
              style: TextStyle(fontFamily: 'NotoSans', color: Colors.red[400]),
            ),
            onPressed: () {
              Get.back();
            }),
      ],
    ));
  }
}
