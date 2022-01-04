import 'package:damo/app/controller/shop_faq_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class ProductQnA extends StatelessWidget {
  ShopFAQController shopFAQController = Get.put(ShopFAQController());
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16.w, 20.h, 0, 26.h),
          child: Text(
            'FAQ',
            style: TextStyle(
              color: Color(0xff283137),
              fontSize: 18.sp,
              fontFamily: 'NotoSansCJKKR',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          height: 1.5,
          margin: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
          ),
          decoration: BoxDecoration(
            color: Color(0xfff1f3f5),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        if (shopFAQController.shopGetFAQtoUserModel.value.faqList.length == 0)
          Padding(
            padding: EdgeInsets.fromLTRB(0, 100.h, 0, 0),
            child: Center(
              child: Text(
                '아직 등록된 F&Q가 없습니다.',
                style: TextStyle(
                  color: Color(0xff283137),
                  fontFamily: 'NotoSansCJKKR',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount:
                shopFAQController.shopGetFAQtoUserModel.value.faqList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: ExpansionTile(
                      expandedAlignment: Alignment.centerLeft,
                      collapsedIconColor: Color(0xff283137),
                      iconColor: Color(0xff283137),
                      title: Row(
                        children: [
                          Text(
                            'Q ' + (index + 1).toString(),
                            style: TextStyle(
                              color: Color(0xfff93f5b),
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Text(
                            shopFAQController.shopGetFAQtoUserModel.value
                                .faqList[index]['question'],
                            style: TextStyle(
                              color: Color(0xff283137),
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      children: [
                        Container(
                          width: 375.w,
                          color: Color(0xfff1f3f5),
                          child: Padding(
                            padding:
                                EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 26.h),
                            child: Text(
                              shopFAQController.shopGetFAQtoUserModel.value
                                  .faqList[index]['answer'],
                              style: TextStyle(
                                color: Color(0xff283137),
                                fontFamily: 'NotoSansCJKKR',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ],
    );
  }
}
