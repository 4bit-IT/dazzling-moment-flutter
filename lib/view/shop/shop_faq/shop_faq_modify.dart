import 'package:damo/app/controller/owner/owner_shop_faq_controller.dart';
import 'package:damo/app/controller/shop_faq_controller.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShopFAQModify extends StatelessWidget {
  OwnerShopFAQController ownerShopFAQController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().textAppBar(context, 'FAQ 수정'),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
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
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
                              padding: EdgeInsets.fromLTRB(4.w, 0, 4.w, 0),
                              child: TextFormField(
                                controller: ownerShopFAQController.shopFAQQuestionController.value,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Color(0xffd1d1d6),
                                    fontFamily: 'NotoSansCJKKR',
                                    fontSize: 14.sp,
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'NotoSansCJKKR',
                                  fontSize: 20.sp,
                                ),
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ],
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
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(4.w, 0, 4.w, 0),
                              decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
                              child: TextFormField(
                                controller: ownerShopFAQController.shopFAQAnswerController.value,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Color(0xffd1d1d6),
                                    fontFamily: 'NotoSansCJKKR',
                                    fontSize: 14.sp,
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'NotoSansCJKKR',
                                  fontSize: 20.sp,
                                ),
                                maxLines: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h,),
                    ],
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              await ownerShopFAQController.faqModify();
            },
            child: Container(
              height: 60.h,
              alignment: Alignment.center,
              color: Color(0xfff93f5b),
              child: Text(
                '수정완료',
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
    );
  }
}
