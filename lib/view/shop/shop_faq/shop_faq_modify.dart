import 'package:damo/app/controller/owner/owner_shop_faq_controller.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/custom_textfield.dart';
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
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
                              child: CustomTextField().simpleTextField(
                                  ownerShopFAQController
                                      .shopFAQQuestionController.value,
                                  false,
                                  null,
                                  TextAlign.start,
                                  null,
                                  2,
                                  2,
                                  () {},
                                  [],
                                  ''),
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
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Expanded(
                              child: CustomTextField().simpleTextField(
                                  ownerShopFAQController
                                      .shopFAQAnswerController.value,
                                  false,
                                  null,
                                  TextAlign.start,
                                  null,
                                  20,
                                  20,
                                  () {},
                                  [],
                                  ''),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                FocusScope.of(context).unfocus();
                await ownerShopFAQController.faqModifyClicked();
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
      ),
    );
  }
}
