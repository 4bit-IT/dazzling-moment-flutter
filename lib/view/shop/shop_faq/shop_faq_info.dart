import 'package:damo/app/controller/owner/owner_shop_faq_controller.dart';
import 'package:damo/app/controller/shop_faq_controller.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/view/shop/shop_faq/shop_faq_modify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShopFAQInfo extends StatelessWidget {
  OwnerShopFAQController ownerShopFAQController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().textAppBar(context, 'FAQ'),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                    child: Obx(
                      () => Text(
                        ownerShopFAQController.currentIndex.value != -1
                            ? 'Q: ${ownerShopFAQController.ownerShopGetFAQModel.value.faqList![ownerShopFAQController.currentIndex.value]['question']}'
                            : '',
                        style: TextStyle(
                            color: Color(0xff283137),
                            fontFamily: 'NotoSansCJKKR',
                            fontSize: 22.sp,
                            height: 1,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2.h,
                    color: Colors.black,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                    child: Obx(
                      () => Text(
                        ownerShopFAQController.currentIndex.value != -1
                            ? 'A: ${ownerShopFAQController.ownerShopGetFAQModel.value.faqList![ownerShopFAQController.currentIndex.value]['answer']}'
                            : '',
                        style: TextStyle(
                          color: Color(0xff283137),
                          fontFamily: 'NotoSansCJKKR',
                          fontSize: 22.sp,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    Get.to(() => ShopFAQModify());
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 16.h, 0, 16.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.r, color: Colors.black38),
                    ),
                    child: Text(
                      '수정하기',
                      style: TextStyle(
                          color: Color(0xff283137),
                          fontFamily: 'NotoSansCJKKR',
                          fontSize: 20.sp,
                          height: 1,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    ownerShopFAQController.onDeleteFAQClicked();
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 16.h, 0, 16.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.r, color: Colors.black38),
                    ),
                    child: Text(
                      '삭제하기',
                      style: TextStyle(
                          color: Color(0xff283137),
                          fontFamily: 'NotoSansCJKKR',
                          fontSize: 20.sp,
                          height: 1,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
