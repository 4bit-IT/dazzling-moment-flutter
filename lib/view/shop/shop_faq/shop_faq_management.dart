import 'package:damo/app/controller/owner/owner_shop_faq_controller.dart';
import 'package:damo/app/controller/shop_faq_controller.dart';
import 'package:damo/view/shop/shop_faq/shop_faq_add.dart';
import 'package:damo/view/shop/shop_faq/shop_faq_management_modify.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/view/shop/shop_faq/shop_faq_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopFAQManagement extends StatelessWidget {
  TextEditingController faqTitleController = TextEditingController();
  TextEditingController faqDocumentController = TextEditingController();
  OwnerShopFAQController ownerShopFAQController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamoAppBar().suffixAppBar(context, 'FAQ', '수정', () => Get.to(() => ShopFAQManagementModify())),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Obx(
                () => ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: ownerShopFAQController.ownerShopGetFAQModel.value.faqList == null
                      ? 0
                      : ownerShopFAQController.ownerShopGetFAQModel.value.faqList!.length,
                  itemBuilder: (context, index) {
                    return ExpansionTile(
                        iconColor: Colors.black45,
                        title: Container(
                          width: 375.w,
                          padding: EdgeInsets.fromLTRB(0, 16.h, 0, 16.h),
                          child: Row(
                            children: [
                              Text(
                                'Q${index + 1}',
                                style: TextStyle(
                                  color: Color(0xfff93f5b),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Text(
                                '${ownerShopFAQController.ownerShopGetFAQModel.value.faqList![index]['question']}',
                                style: TextStyle(
                                  color: Color(0xff283137),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                            width: double.infinity,
                            color: Color(0xfff1f3f5),
                            child:
                                Text('${ownerShopFAQController.ownerShopGetFAQModel.value.faqList![index]['answer']}'),
                          )
                        ]);
                  },
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              ownerShopFAQController.shopFAQAnswerAddController.value.clear();
              ownerShopFAQController.shopFAQQuestionAddController.value.clear();
              Get.to(() => ShopFAQAdd());
            },
            child: Container(
              color: Color(0xff283137),
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
