import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class PurchaseHistory extends StatelessWidget {
  const PurchaseHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          '구매 내역'
        ),
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: InkWell(
              onTap: Get.back,
              child: SvgPicture.asset(
                'assets/images_svg/ic_back.svg',
                width: 30.w,
                height: 30.h,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 1.h,
            decoration: BoxDecoration(
              color: Color(0xfff1f3f5),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(24.w, 0, 12.w, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 22.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '2020/10/5',
                          style: TextStyle(
                            color: Color(0xff8e97a0),
                            fontSize: 12.sp,
                            height: 1,
                            fontFamily: 'NotoSansCJKKR',
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          '주문확인중',
                          style: TextStyle(
                            color: Color(0xfff93f5b),
                            fontSize: 12.sp,
                            height: 1,
                            fontFamily: 'NotoSansCJKKR',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 60.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xfff1f3f5),
                              width: 1.h,
                            ),
                            borderRadius: BorderRadius.circular(56.r),
                          ),
                          child: Text(
                            '주문상세',
                            style: TextStyle(
                              color: Color(0xff283137),
                              fontSize: 12.sp,
                              height: 1,
                              fontFamily: 'NotoSansCJKKR',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        SvgPicture.asset(
                          'assets/images_svg/ic_옵션보기.svg',
                          width: 30.w,
                          height: 30.h,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  '플루트 딸기가득 케이크',
                  style: TextStyle(
                    color: Color(0xff283137),
                    fontFamily: 'NotoSansCJKKR',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    height: 1,
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '-레터링케이크 2호',
                          style: TextStyle(
                            color: Color(0xff283137),
                            fontSize: 12.sp,
                            height: 1,
                            fontFamily: 'NotoSansCJKKR',
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          '-크림추가(+6000원)',
                          style: TextStyle(
                            color: Color(0xff283137),
                            fontSize: 12.sp,
                            height: 1,
                            fontFamily: 'NotoSansCJKKR',
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          '29,500원',
                          style: TextStyle(
                            color: Color(0xff283137),
                            fontFamily: 'NotoSansCJKKR',
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/img@3x.png',
                      height: 70.h,
                      width: 70.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 1.h,
                  decoration: BoxDecoration(
                    color: Color(0xfff1f3f5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
