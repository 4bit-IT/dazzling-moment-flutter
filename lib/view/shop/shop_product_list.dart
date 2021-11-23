import 'package:damo/view/shop/shop_product_main.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ShopProductList extends StatelessWidget {
  const ShopProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().textAppBar(context, '내 상품'),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(
              height: 1.h,
              color: Color(0xfff1f3f5),
            ),
            InkWell(
              onTap: () {
                Get.to(()=>ShopProductMain());
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 16.w,
                      ),
                      Expanded(
                        child: Text(
                          '케이크',
                          style: TextStyle(
                            color: Color(0xff283137),
                            fontFamily: 'NotoSansCJKKR',
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/images_svg/ic_바로가기.svg',
                        width: 20.w,
                        height: 20.h,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                ],
              ),
            ),
            Divider(
              height: 1.h,
              color: Color(0xfff1f3f5),
            ),
          ],
        ),
      ),
    );
  }
}
