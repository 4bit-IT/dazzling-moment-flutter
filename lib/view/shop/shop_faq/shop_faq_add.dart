import 'package:damo/app/controller/owner/owner_shop_faq_controller.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/custom_textfield.dart';
import 'package:damo/viewmodel/get_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShopFAQAdd extends StatelessWidget {
  final OwnerShopFAQController ownerShopFAQController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() {
          FocusScope.of(context).unfocus();
          return GetDialog()
              .backButtonDialog(ownerShopFAQController.cancelFAQRegistration);
        });
      },
      child: Scaffold(
        appBar: DamoAppBar().textAppBar(context, 'FAQ 작성'),
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
                        CustomTextField().simpleTextField(
                            ownerShopFAQController
                                .shopFAQQuestionAddController.value,
                            false,
                            null,
                            TextAlign.start,
                            '질문을 입력하세요',
                            2,
                            2, () {
                          if(ownerShopFAQController.shopFAQAnswerAddController
                                          .value.text ==
                                      '' ||
                                  ownerShopFAQController
                                          .shopFAQQuestionAddController
                                          .value
                                          .text ==
                                      '')
                              ownerShopFAQController.addWriteColor.value =
                                  Color(0xffd1d1d6);
                              else ownerShopFAQController.addWriteColor.value =
                                  Color(0xff283137);
                        }, [], ''),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextField().simpleTextField(
                            ownerShopFAQController
                                .shopFAQAnswerAddController.value,
                            false,
                            null,
                            TextAlign.start,
                            '답변을 입력하세요',
                            20,
                            20, () {
                          if(ownerShopFAQController.shopFAQAnswerAddController
                                          .value.text ==
                                      '' ||
                                  ownerShopFAQController
                                          .shopFAQQuestionAddController
                                          .value
                                          .text ==
                                      '')
                              ownerShopFAQController.addWriteColor.value =
                                  Color(0xffd1d1d6);

                          else ownerShopFAQController.addWriteColor.value =
                                  Color(0xff283137);
                        }, [], ''),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  ownerShopFAQController.onAddFAQClicked();
                },
                child: Obx(
                  () => Container(
                    color: ownerShopFAQController.addWriteColor.value,
                    width: double.infinity,
                    height: 70.h,
                    alignment: Alignment.center,
                    child: Text(
                      '작성',
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
      ),
    );
  }
}
