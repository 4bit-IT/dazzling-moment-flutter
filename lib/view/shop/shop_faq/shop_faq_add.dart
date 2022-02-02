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
          return GetDialog().backButtonDialog(ownerShopFAQController.cancelFAQRegistration);
        });
      },
      child: Scaffold(
        appBar: DamoAppBar().textAppBar(context, 'FAQ 추가'),
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
                                      .shopFAQQuestionAddController.value,
                                  false,
                                  null,
                                  TextAlign.start,
                                  'FAQ의 제목을 입력해주세요',
                                  2,
                                  2,
                                  null,
                                  []),
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
                                      .shopFAQAnswerAddController.value,
                                  false,
                                  null,
                                  TextAlign.start,
                                  'FAQ의 답변을 입력해주세요',
                                  20,
                                  20,
                                  null,
                                  []),
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
                  FocusScope.of(context).unfocus();
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
    );
  }
}
