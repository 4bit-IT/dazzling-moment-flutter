import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          '찜 목록',
          style: TextStyle(
            color: Color(0xff283137),
            fontSize: 16,
            fontFamily: 'NotoSansCJKKR',
            fontWeight: FontWeight.w700,
          ),
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
      body: GridView.builder(
        itemCount: 100,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 294.h,
          crossAxisCount: 2,
          crossAxisSpacing: 5.w,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Stack(
                children: [
                  Image.asset(
                    'assets/images/img.png',
                    fit: BoxFit.fill,
                    width: 185.w,
                    height: 185.h,
                  ),
                  Positioned(
                    left: 10.w,
                    bottom: 10.h,
                    child: SvgPicture.asset(
                      'assets/images_svg/ic_new.svg',
                      width: 38.w,
                      height: 20.h,
                    ),
                  ),
                  Positioned(
                    right: 5.w,
                    bottom: 5.h,
                    child: SvgPicture.asset(
                      'assets/images_svg/ic_wish_on.svg',
                      width: 30.w,
                      height: 30.h,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '이로아케이크',
                      style: TextStyle(
                        color: Color(0xff283137),
                        fontSize: 10.sp,
                        height: 1,
                        fontFamily: 'NotoSansCJKKR',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    Text(
                      '플루트 딸기가득 케이크',
                      style: TextStyle(
                        color: Color(0xff283137),
                        fontSize: 13.sp,
                        height: 1,
                        fontFamily: 'NotoSansCJKKR',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      '서울에서 입소문난 수제디저트 공방...',
                      style: TextStyle(
                        color: Color(0xff283137),
                        fontSize: 11.sp,
                        height: 1,
                        fontFamily: 'NotoSansCJKKR',
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images_svg/ic_review_10.svg',
                              width: 10.w,
                              height: 10.h,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              '4.9',
                              style: TextStyle(
                                color: Color(0xff283137),
                                fontSize: 12.sp,
                                height: 1,
                                fontFamily: 'NotoSansCJKKR',
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              '(1,234)',
                              style: TextStyle(
                                color: Color(0xff8e97a0),
                                fontSize: 12.sp,
                                height: 1,
                                fontFamily: 'NotoSansCJKKR',
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '29,500',
                          style: TextStyle(
                              color: Color(0xff283137),
                              fontFamily: 'NotoSansCJKKR',
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                              height: 1),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),

      /*Column(
        children: [
          Container(
            height: 1.h,
            decoration: BoxDecoration(
              color: Color(0xfff1f3f5),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Stack(
            children: [
              Image.asset(
                'assets/images/img@3x.png',
                width: 185.w,
                height: 185.h,
              ),
              Positioned(
                left: 10.w,
                bottom: 10.h,
                child: SvgPicture.asset(
                  'assets/images_svg/ic_new.svg',
                  width: 38.w,
                  height: 20.h,
                ),
              ),
              Positioned(
                child: SvgPicture.asset(
                  'assets/images_svg/ic_wish_on.svg',
                  width: 30.w,
                  height: 30.h,
                ),
              ),
            ],
          )
        ],
      ),*/
    );
  }
}
