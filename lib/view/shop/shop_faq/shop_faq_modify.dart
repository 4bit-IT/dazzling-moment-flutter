import 'package:damo/app/controller/shop_faq_controller.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShopFAQModify extends StatelessWidget {
  ShopFAQController shopFAQController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().textAppBar(context, 'FAQ 수정'),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Q: ',
                          style: TextStyle(
                            color: Color(0xff283137),
                            fontFamily: 'NotoSansCJKKR',
                            fontSize: 22.sp,
                            height: 1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
                            padding: EdgeInsets.fromLTRB(4.w, 0, 4.w, 0),
                            child: TextFormField(
                              controller: shopFAQController.shopFAQQuestionController.value,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Color(0xffd1d1d6),
                                  fontFamily: 'NotoSansCJKKR',
                                  fontSize: 14.sp,
                                  height: 1,
                                ),
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: () {
                        shopFAQController.onFAQQuestionModifyClicked();
                      },
                      child: Container(
                        height: 60.h,
                        width: 120.w,
                        alignment: Alignment.center,
                        color: Color(0xfff93f5b),
                        child: Text(
                          '질문 수정하기',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            height: 1,
                            fontFamily: 'NotoSansCJKKR',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Row(
                      children: [
                        Text(
                          'A: ',
                          style: TextStyle(
                            color: Color(0xff283137),
                            fontFamily: 'NotoSansCJKKR',
                            fontSize: 22.sp,
                            height: 1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(4.w, 0, 4.w, 0),
                            decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
                            child: TextFormField(
                              controller: shopFAQController.shopFAQAnswerController.value,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Color(0xffd1d1d6),
                                  fontFamily: 'NotoSansCJKKR',
                                  fontSize: 14.sp,
                                  height: 1,
                                ),
                              ),
                              maxLines: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    InkWell(
                      onTap: () {
                        shopFAQController.onFAQAnswerModifyClicked();
                      },
                      child: Container(
                        height: 60.h,
                        width: 110.w,
                        alignment: Alignment.center,
                        color: Color(0xfff93f5b),
                        child: Text(
                          '답변 수정하기',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            height: 1,
                            fontFamily: 'NotoSansCJKKR',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
