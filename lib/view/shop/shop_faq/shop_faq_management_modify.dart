import 'package:damo/app/controller/owner/owner_shop_faq_controller.dart';
import 'package:damo/app/controller/shop_faq_controller.dart';
import 'package:damo/view/shop/shop_faq/shop_faq_add.dart';
import 'package:damo/view/shop/shop_faq/shop_faq_modify.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/view/shop/shop_faq/shop_faq_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopFAQManagementModify extends StatelessWidget {
  TextEditingController faqTitleController = TextEditingController();
  TextEditingController faqDocumentController = TextEditingController();
  OwnerShopFAQController ownerShopFAQController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamoAppBar().suffixAppBar(context, 'FAQ', '취소', () {}),
      body: SingleChildScrollView(
        child: Obx(
          () => ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: ownerShopFAQController.ownerShopGetFAQModel.value.faqList == null
                ? 0
                : ownerShopFAQController.ownerShopGetFAQModel.value.faqList!.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  ownerShopFAQController.changeCurrentIndex(index);
                  Get.to(() => ShopFAQModify());
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(16.w, 28.h, 16.w, 28.h),
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
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${ownerShopFAQController.ownerShopGetFAQModel.value.faqList![index]['question']}',
                              style: TextStyle(
                                color: Color(0xff283137),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/images_svg/ic_바로가기.svg',
                              width: 20.w,
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(height: 0);
            },
          ),
        ),
      ),
    );
  }
}
