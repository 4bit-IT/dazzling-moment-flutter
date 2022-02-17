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
      appBar: DamoAppBar().suffixAppBar(context, 'FAQ 수정', '삭제', () => ownerShopFAQController.onDeleteFAQClicked()),
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
                  child: Column(
                    children: [
                      CustomTextField().simpleTextField(ownerShopFAQController.shopFAQQuestionController.value, false,
                          null, TextAlign.start, null, 2, 2, () {
                        if (ownerShopFAQController.shopFAQAnswerController.value.text == '' ||
                            ownerShopFAQController.shopFAQQuestionController.value.text == '')
                          ownerShopFAQController.modifyWriteColor.value = Color(0xffd1d1d6);
                        else
                          ownerShopFAQController.modifyWriteColor.value = Color(0xff283137);
                      }, [], ''),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextField().simpleTextField(ownerShopFAQController.shopFAQAnswerController.value, false,
                          null, TextAlign.start, null, 20, 20, () {
                        if (ownerShopFAQController.shopFAQAnswerController.value.text == '' ||
                            ownerShopFAQController.shopFAQQuestionController.value.text == '')
                          ownerShopFAQController.modifyWriteColor.value = Color(0xffd1d1d6);
                        else
                          ownerShopFAQController.modifyWriteColor.value = Color(0xff283137);
                      }, [], ''),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                FocusScope.of(context).unfocus();
                await ownerShopFAQController.faqModifyClicked();
              },
              child: Obx(
                () => Container(
                  height: 60.h,
                  alignment: Alignment.center,
                  color: ownerShopFAQController.modifyWriteColor.value,
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
            ),
          ],
        ),
      ),
    );
  }
}
