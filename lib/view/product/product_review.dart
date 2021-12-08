import 'package:damo/app/controller/review_controller.dart';
import 'package:damo/app/controller/shop_controller.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:simple_star_rating/simple_star_rating.dart';
import 'package:vertical_barchart/vertical-barchart.dart';
import 'package:vertical_barchart/vertical-barchartmodel.dart';

ShopController shopController = Get.find();
RefreshController _refreshController = RefreshController(initialRefresh: true);

class ProductReview extends StatelessWidget {
  int pageNumber = 1;
  ReviewController reviewController = Get.put(ReviewController());
  void _onLoading() async {
    print("리뷰 데이터를 불러옵니다.");
    await reviewController.loadReview(pageNumber);
    pageNumber++;
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    List<VBarChartModel> bardata = [
      VBarChartModel(
        index: 0,
        label: "5.0",
        colors: [Color(0xfff93f5b), Color(0xfff93f5b)],
        jumlah: 10,
        tooltip: "(10)",
      ),
      VBarChartModel(
        index: 1,
        label: "4.0",
        colors: [Color(0xfff93f5b), Color(0xfff93f5b)],
        jumlah: 20,
        tooltip: "(20)",
      ),
      VBarChartModel(
        index: 2,
        label: "3.0",
        colors: [Color(0xfff93f5b), Color(0xfff93f5b)],
        jumlah: 30,
        tooltip: "(30)",
      ),
      VBarChartModel(
        index: 3,
        label: "2.0",
        colors: [Color(0xfff93f5b), Color(0xfff93f5b)],
        jumlah: 40,
        tooltip: "(40)",
      ),
      VBarChartModel(
        index: 4,
        label: "1.0",
        colors: [Color(0xfff93f5b), Color(0xfff93f5b)],
        jumlah: 50,
        tooltip: "(50)",
      ),
    ];
    return SmartRefresher(
      enablePullDown: false,
      enablePullUp: true,
      controller: _refreshController,
      onLoading: _onLoading,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 20.h, 0.w, 0.h),
        child: Wrap(
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
                  '총 ' +
                      shopController.shopGetDetailModel.value.reviewCount
                          .toString() +
                      '개 리뷰',
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
                  shopController.shopGetDetailModel.value.rating!.toString(),
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
            Container(
              height: 1.5.h,
              decoration: BoxDecoration(
                color: Color(0xfff1f3f5),
              ),
            ),
            //여기서 부터 리뷰
            Obx(
              () => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: reviewController.stroageReview.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.w, 0.h, 16.w, 0.h),
                          child: Row(
                            children: [
                              ExtendedImage.network(
                                reviewController.stroageReview[index]
                                    ['profileImage'],
                                width: 50.w,
                                height: 50.h,
                                fit: BoxFit.cover,
                                cache: true,
                                shape: BoxShape.circle,
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    reviewController.stroageReview[index]
                                        ['nickname'],
                                    style: TextStyle(
                                      color: Color(0xff283137),
                                      fontSize: 16.sp,
                                      fontFamily: 'NotoSansCJKKR',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    reviewController.stroageReview[index]
                                        ['createdAt'],
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
                                    rating: reviewController
                                            .stroageReview[index]['rating'] *
                                        1.0,
                                    size: 10.w,
                                    isReadOnly: true,
                                    spacing: 2.w,
                                  ),
                                  SizedBox(width: 5.0.w),
                                  Text(
                                    reviewController.stroageReview[index]
                                            ['rating']
                                        .toString(),
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
                        SizedBox(height: 20.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              reviewController.stroageReview[index]['options'],
                              style: TextStyle(
                                color: Color(0xff283137),
                                fontFamily: 'NotoSansCJKKR',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              reviewController.stroageReview[index]['content'],
                              style: TextStyle(
                                color: Color(0xff283137),
                                fontFamily: 'NotoSansCJKKR',
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Container(
                              width: 250.w,
                              height: 250.h,
                              child: ExtendedImage.network(
                                reviewController.stroageReview[index]
                                    ['reviewImage'],
                                width: 50.w,
                                height: 50.h,
                                fit: BoxFit.cover,
                                cache: true,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.5.h),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 16.6.w, 0),
                          child: Container(
                            height: 3.h,
                            decoration: BoxDecoration(
                              color: Color(0xfff1f3f5),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGrafik(List<VBarChartModel> bardata) {
    return VerticalBarchart(
      background: Colors.transparent,
      labelColor: Color(0xff283137),
      tooltipColor: Color(0xff8e97a0),
      maxX: 150,
      data: bardata,
      barStyle: BarStyle.DEFAULT,
    );
  }
}
