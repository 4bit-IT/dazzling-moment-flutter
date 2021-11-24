import 'package:damo/app/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_star_rating/simple_star_rating.dart';
import 'package:vertical_barchart/vertical-barchart.dart';
import 'package:vertical_barchart/vertical-barchartmodel.dart';
import 'package:get/get.dart';

class ProductReview extends StatelessWidget {
  ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    List<VBarChartModel> bardata = [
      VBarChartModel(
        index: 0,
        label: "5.0",
        colors: [Color(0xfff93f5b), Color(0xfff93f5b)],
        jumlah: productController.reviewCount[productController.index.value]*1.0,
        tooltip: "${(productController.reviewCount[productController.index.value]*0.6).round()}",
      ),
      VBarChartModel(
        index: 1,
        label: "4.0",
        colors: [Color(0xfff93f5b), Color(0xfff93f5b)],
        jumlah: productController.reviewCount[productController.index.value]*0.23,
        tooltip: "${(productController.reviewCount[productController.index.value]*0.23).round()}",
      ),
      VBarChartModel(
        index: 2,
        label: "3.0",
        colors: [Color(0xfff93f5b), Color(0xfff93f5b)],
        jumlah: productController.reviewCount[productController.index.value]*0.13,
        tooltip: "${(productController.reviewCount[productController.index.value]*0.13).round()}",
      ),
      VBarChartModel(
        index: 3,
        label: "2.0",
        colors: [Color(0xfff93f5b), Color(0xfff93f5b)],
        jumlah: productController.reviewCount[productController.index.value]*0.03,
        tooltip: "${(productController.reviewCount[productController.index.value]*0.03).round()}",
      ),
      VBarChartModel(
        index: 4,
        label: "1.0",
        colors: [Color(0xfff93f5b), Color(0xfff93f5b)],
        jumlah: productController.reviewCount[productController.index.value]*0.01,
        tooltip: "${(productController.reviewCount[productController.index.value]*0.01).round()}",
      ),
    ];
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 10.h, 0.w, 0.h),
      child: ListView(
        children: [
          Row(
            children: [
              Text(
                'Review',
                style: TextStyle(
                  color: Color(0xff283137),
                  fontSize: 18.sp,
                  fontFamily: 'NotoSansCJKKR',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                '총 ${productController.reviewCount[productController.index.value]}개 리뷰',
                style: TextStyle(
                  color: Color(0xff8e97a0),
                  fontFamily: 'NotoSansCJKKR',
                ),
              ),
            ],
          ),
          SizedBox(height: 25.5.h),
          Container(
            height: 0.5.h,
            decoration: BoxDecoration(
              color: Color(0xfff1f3f5),
            ),
          ),
          Row(
            children: [
              SizedBox(width: 16.w),
              SvgPicture.asset(
                'assets/images_svg/ic_review_40.svg',
                width: 40.w,
                height: 40.h,
              ),
              SizedBox(width: 9.w),
              Text(
                '${productController.rating[productController.index.value]}',
                style: TextStyle(
                  color: Color(0xff283137),
                  fontSize: 30.sp,
                  fontFamily: 'NotoSansCJKKR',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 3.w),
              Text(
                '/5',
                style: TextStyle(
                  color: Color(0xff283137),
                  fontFamily: 'NotoSansCJKKR',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 45.w),
              Flexible(
                child: Container(
                  width: 260.w,
                  child: _buildGrafik(bardata),
                ),
              ),
            ],
          ),
          SizedBox(height: 23.5.h),
          Container(
            height: 0.5.h,
            decoration: BoxDecoration(
              color: Color(0xfff1f3f5),
            ),
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.fromLTRB(0.w, 0.h, 16.w, 0.h),
            child: Row(
              children: [
                Image.asset("assets/images/img_프로필.png",
                    height: 50.h, width: 50.w),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '김다모',
                      style: TextStyle(
                        color: Color(0xff283137),
                        fontSize: 16.sp,
                        fontFamily: 'NotoSansCJKKR',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '10/05 (수)',
                      style: TextStyle(
                        color: Color(0xff8e97a0),
                        fontSize: 12.sp,
                        fontFamily: 'NotoSansCJKKR',
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 140.w),
                Row(
                  children: [
                    SimpleStarRating(
                      allowHalfRating: true,
                      starCount: 5,
                      rating: 3.0,
                      size: 10.w,
                      isReadOnly: true,
                      spacing: 2.w,
                    ),
                    SizedBox(width: 5.0.w),
                    Text(
                      '3.0',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'NotoSansCJKKR',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 35.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '플루트 딸기가득 케이크 + 크림추가',
                style: TextStyle(
                  color: Color(0xff283137),
                  fontFamily: 'NotoSansCJKKR',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 17.h),
              Text(
                '남친과 함께 즐거운 시간을 가질 수 있어서 좋았습니다.\n만족스러운 기념일을 만들어 주셔서 감사합니다.\n추천합니다.',
                style: TextStyle(
                  color: Color(0xff283137),
                  fontFamily: 'NotoSansCJKKR',
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                width: 250.w,
                height: 250.h,
                child:
                    Image.asset('assets/images/img@3x.png', fit: BoxFit.cover),
              ),
            ],
          ),
          SizedBox(height: 15.5.h),
          Container(
            height: 0.5.h,
            decoration: BoxDecoration(
              color: Color(0xfff1f3f5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrafik(List<VBarChartModel> bardata) {
    return VerticalBarchart(
      background: Colors.transparent,
      labelColor: Color(0xff283137),
      tooltipColor: Color(0xff8e97a0),
      maxX: productController.reviewCount[productController.index.value].roundToDouble(),
      data: bardata,
      barStyle: BarStyle.DEFAULT,
    );
  }
}
