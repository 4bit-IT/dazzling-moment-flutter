import 'package:damo/app/controller/shop_faq_controller.dart';
import 'package:damo/view/shop/shop_faq/shop_faq_add.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/view/shop/shop_faq/shop_faq_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopFAQManagement extends StatelessWidget {
  TextEditingController faqTitleController = TextEditingController();
  TextEditingController faqDocumentController = TextEditingController();
  ShopFAQController shopFAQController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamoAppBar().textAppBar(context, 'FAQ'),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
                child: Obx(
                  () => ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount:
                        shopFAQController.shopGetFAQModel.value.faqList!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          shopFAQController.changeCurrentIndex(index);
                          Get.to(() => ShopFAQInfo());
                        },
                        child: Container(
                          width: 375.w,
                          padding: EdgeInsets.fromLTRB(0, 16.h, 0, 16.h),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Q: ${shopFAQController.shopGetFAQModel.value.faqList![index]['question']}',
                                  style: TextStyle(
                                      color: Color(0xff283137),
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.sp,
                                      height: 1),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      color: Color(0xfff1f3f5),
                      thickness: 1.h,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              shopFAQController.shopFAQAnswerAddController.value.clear();
              shopFAQController.shopFAQQuestionAddController.value.clear();
              Get.to(() => ShopFAQAdd());
            },
            child: Container(
              color: Color(0xfff93f5b),
              width: double.infinity,
              height: 70.h,
              alignment: Alignment.center,
              child: Text(
                'FAQ 추가하기',
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
    );
  }
}
