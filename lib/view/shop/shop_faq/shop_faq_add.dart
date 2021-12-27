import 'package:damo/app/controller/owner/owner_shop_faq_controller.dart';
import 'package:damo/app/controller/shop_faq_controller.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShopFAQAdd extends StatelessWidget {
  OwnerShopFAQController ownerShopFAQController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() {
          Get.dialog(
            Dialog(
              child: Container(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                alignment: Alignment.center,
                height: 190.h,
                width: 130.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                      child: Text(
                        'FAQ 등록을 중지하시겠습니까?',
                        style: TextStyle(
                            color: Color(0xff283137),
                            fontFamily: 'NotoSansCJKKR',
                            fontSize: 22.sp,
                            height: 1,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
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
                            child: Text(
                              '아니오',
                              style: TextStyle(
                                  color: Color(0xff283137),
                                  fontFamily: 'NotoSansCJKKR',
                                  fontSize: 16.sp,
                                  height: 1,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            ownerShopFAQController.shopFAQQuestionAddController.value.clear();
                            ownerShopFAQController.shopFAQAnswerAddController.value.clear();
                            Get.back();
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                            child: Text(
                              '예',
                              style: TextStyle(
                                  color: Color(0xff283137),
                                  fontFamily: 'NotoSansCJKKR',
                                  fontSize: 16.sp,
                                  height: 1,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
          return true;
        });
      },
      child: Scaffold(
        appBar: DamoAppBar().textAppBar(context, 'FAQ 추가'),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
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
                                style: TextStyle(
                                  fontFamily: 'NotoSansCJKKR',
                                  fontSize: 20.sp,
                                  height: 1,
                                ),
                                controller: ownerShopFAQController.shopFAQQuestionAddController.value,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'FAQ의 제목을 입력해주세요.',
                                  hintStyle: TextStyle(
                                    color: Color(0xffd1d1d6),
                                    fontFamily: 'NotoSansCJKKR',
                                    fontSize: 20.sp,
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
                                style: TextStyle(
                                  fontFamily: 'NotoSansCJKKR',
                                  fontSize: 20.sp,
                                  height: 1,
                                ),
                                controller: ownerShopFAQController.shopFAQAnswerAddController.value,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'FAQ의 답변을 입력해주세요.',
                                  hintStyle: TextStyle(
                                    color: Color(0xffd1d1d6),
                                    fontFamily: 'NotoSansCJKKR',
                                    fontSize: 20.sp,
                                    height: 1,
                                  ),
                                ),
                                maxLines: 20,
                              ),
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
              onTap: () {
                ownerShopFAQController.onAddFAQClicked();
              },
              child: Container(
                color: Color(0xfff93f5b),
                width: double.infinity,
                height: 70.h,
                alignment: Alignment.center,
                child: Text(
                  'FAQ 등록하기',
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
    );
  }
}
