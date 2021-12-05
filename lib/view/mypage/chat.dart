import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/bar/bottom_navigaton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(
        selectedBottomNavigationBarIndex: 2,
      ),
      backgroundColor: Colors.white,
      appBar: DamoAppBar().textAppBar(context, '김모다님과의 대화'),
      body: Container(
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
                          Image.asset(
                            'assets/images_temp/1.jpg',
                            width: 70.w,
                            height: 70.h,
                          ),
                          SizedBox(width: 14.w),
                          Container(
                            width: 196.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                      height: 1),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  '29,500원',
                                  style: TextStyle(
                                      color: Color(0xff283137),
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.sp,
                                      height: 1),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 30.h,
                            width: 60.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xfff1f3f5),
                                width: 1.w,
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
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                        height: 1.h,
                        decoration: BoxDecoration(
                          color: Color(0xfff1f3f5),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 16.w,
                          ),
                          Expanded(
                            child: Divider(
                              color: Color(0xfff1f3f5),
                              thickness: 1.h,
                            ),
                          ),
                          SizedBox(
                            width: 9.w,
                          ),
                          Text(
                            '2021년 11월 25일',
                            style: TextStyle(
                              color: Color(0xff8e8e93),
                              fontSize: 18.sp,
                              fontFamily: 'NotoSansCJKKR',
                              height: 1,
                            ),
                          ),
                          SizedBox(
                            width: 9.w,
                          ),
                          Expanded(
                            child: Divider(
                              color: Color(0xfff1f3f5),
                              thickness: 1.h,
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/img_프로필.png',
                                width: 31.w,
                                height: 31.h,
                              ),
                              SizedBox(
                                width: 9.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '김모다',
                                    style: TextStyle(
                                      color: Color(0xff283137),
                                      fontSize: 12.sp,
                                      height: 1,
                                      fontFamily: 'NotoSansCJKKR',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 89.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      color: Color(0xfff1f3f5),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Text(
                                      '안녕하세용',
                                      style: TextStyle(
                                        color: Color(0xff283137),
                                        fontSize: 14.sp,
                                        height: 1,
                                        fontFamily: 'NotoSansCJKKR',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 133.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      color: Color(0xfff1f3f5),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Text(
                                      '주문하고 싶습니다!',
                                      style: TextStyle(
                                        color: Color(0xff283137),
                                        fontSize: 14.sp,
                                        height: 1,
                                        fontFamily: 'NotoSansCJKKR',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 62.h,
                              width: 200.w,
                              decoration: BoxDecoration(
                                color: Color(0xfff93f5b),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Text(
                                '네 감사합니다. 무슨 상품을 보셨을까\n요? 확인이 안되네요...',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'NotoSansCJKKR',
                                  fontSize: 14.sp,
                                  height: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TextFormField(
              maxLines: 1,
              enableSuggestions: false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(16.w, 0, 0, 0),
                hintText: '메시지를 입력하세요',
                hintStyle: TextStyle(
                  color: Color(0xffd1d1d6),
                  fontFamily: 'NotoSansCJKKR',
                ),
                suffix: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 8.w, 0),
                  child: SvgPicture.asset(
                    'assets/images_svg/보내기_off.svg',
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.redAccent,
                    width: 2,
                  ),
                ),
              ),
            ),
            SizedBox()
          ],
        ),
      ),
    );
  }
}
