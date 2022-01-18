import 'package:damo/app/controller/owner/owner_review_comment_controller.dart';
import 'package:damo/app/controller/owner/owner_review_controller.dart';
import 'package:damo/app/controller/owner/owner_shop_controller.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/custom_textfield.dart';
import 'package:damo/viewmodel/get_dialog.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:simple_star_rating/simple_star_rating.dart';
import 'package:vertical_barchart/vertical-barchart.dart';
import 'package:vertical_barchart/vertical-barchartmodel.dart';

OwnerShopController ownerShopController = Get.find();
RefreshController _refreshController = RefreshController(initialRefresh: true);

class ShopReviewManagement extends StatelessWidget {
  int pageNumber = 1;
  final OwnerReviewController ownerReviewController = Get.find();
  final OwnerReviewCommentController ownerReviewCommentController = Get.find();

  void _onLoading() async {
    print("리뷰 데이터를 불러옵니다.");
    await ownerReviewController.loadOwnerReview(pageNumber);
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamoAppBar().textAppBar(context, '리뷰 관리'),
      body: SmartRefresher(
        enablePullDown: false,
        enablePullUp: true,
        controller: _refreshController,
        onLoading: _onLoading,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 0.h),
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
                    Obx(
                      () => Text(
                        '총 ${ownerShopController.shopGetMeModel.value.reviewCount}개 리뷰',
                        style: TextStyle(
                          color: Color(0xff8e97a0),
                          fontFamily: 'NotoSansCJKKR',
                        ),
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
                    Obx(
                      () => Text(
                        '${ownerShopController.shopGetMeModel.value.rating!}',
                        style: TextStyle(
                          color: Color(0xff283137),
                          fontSize: 30.sp,
                          fontFamily: 'NotoSansCJKKR',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      '/5',
                      style: TextStyle(
                        color: Color(0xff283137),
                        fontFamily: 'NotoSansCJKKR',
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                        height: 1,
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
                    itemCount: ownerReviewController
                        .ownerReviewModel.value.reviewList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                          Row(
                            children: [
                              ExtendedImage.network(
                                ownerReviewController.ownerReviewModel.value
                                    .reviewList[index]['profileImage'],
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
                                    ownerReviewController.ownerReviewModel.value
                                        .reviewList[index]['nickname']
                                  ),
                                  Text(
                                    ownerReviewController.ownerReviewModel.value
                                        .reviewList[index]['createdAt'],
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
                                    rating: ownerReviewController.ownerReviewModel
                                            .value.reviewList[index]['rating'] *
                                        1.0,
                                    size: 10.w,
                                    isReadOnly: true,
                                    spacing: 2.w,
                                  ),
                                  SizedBox(width: 5.0.w),
                                  Text(
                                    ownerReviewController.ownerReviewModel.value
                                        .reviewList[index]['rating']
                                        .toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'NotoSansCJKKR',
                                      fontSize: 14.sp,
                                      height: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ownerReviewController.ownerReviewModel.value
                                    .reviewList[index]['options'],
                                style: TextStyle(
                                  color: Color(0xff283137),
                                  fontFamily: 'NotoSansCJKKR',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                ownerReviewController.ownerReviewModel.value
                                    .reviewList[index]['content'],
                                style: TextStyle(
                                  color: Color(0xff283137),
                                  fontFamily: 'NotoSansCJKKR',
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(height: 16.h),
                              /* Visibility(
                                  visible: ownerReviewController.ownerReviewModel.value.reviewList[index]
                                                  ['reviewImage'].toString() ==
                                              '' ||
                                          ownerReviewController.ownerReviewModel.value.reviewList[index]['reviewImage'].toString() ==
                                              'null' ||
                                          ownerReviewController.ownerReviewModel.value.reviewList[index]['reviewImage'] ==
                                              null
                                      ? false
                                      : true,
                                  child: Container(
                                    width: 250.w,
                                    height: 250.h,
                                    child: ExtendedImage.network(
                                      ownerReviewController.ownerReviewModel.value.reviewList[index]['reviewImage'],
                                      width: 50.w,
                                      height: 50.h,
                                      fit: BoxFit.cover,
                                      cache: true,
                                    ),
                                  ),
                                ),*/
                            ],
                          ),
                          SizedBox(height: 15.5.h),
                          Obx(
                            () => ExpansionTile(
                              title: Text(
                                ownerReviewController.ownerReviewModel.value
                                        .reviewList[index]['hasComment']
                                    ? '답글보기'
                                    : '답글달기'
                              ),
                              expandedAlignment: Alignment.centerLeft,
                              children: [
                                CustomTextField().simpleTextField(
                                    ownerReviewController
                                        .commentModel[index].commentController!,
                                    false,
                                    null,
                                    TextAlign.start,
                                    ownerReviewController.ownerReviewModel.value
                                            .reviewList[index]['hasComment']
                                        ? null
                                        : '리뷰의 답글을 작성해주세요(최대 100자)',
                                    6,
                                    6,
                                    null,
                                    []),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        if (ownerReviewController
                                            .ownerReviewModel
                                            .value
                                            .reviewList[index]['hasComment']) {
                                          //수정
                                          if (ownerReviewController
                                                  .commentModel[index]
                                                  .commentController!
                                                  .value
                                                  .text ==
                                              '') {
                                            FocusScope.of(context).unfocus();
                                            GetDialog().simpleDialog(
                                                '리뷰의 수정할 답글을 작성해주세요.');
                                          } else {
                                            FocusScope.of(context).unfocus();
                                            GetDialog().alternativeDialog(
                                                '리뷰 답글을 수정하시겠습니까?',
                                                () async =>
                                                    await ownerReviewCommentController
                                                        .updateReviewComment(
                                                            index));
                                          }
                                        } else {
                                          //작성
                                          if (ownerReviewController
                                                  .commentModel[index]
                                                  .commentController!
                                                  .value
                                                  .text ==
                                              '') {
                                            FocusScope.of(context).unfocus();
                                            GetDialog()
                                                .simpleDialog('리뷰의 답글을 작성해주세요.');
                                          } else {
                                            FocusScope.of(context).unfocus();
                                            GetDialog().alternativeDialog(
                                                '리뷰 답글을 작성하시겠습니까?',
                                                () async =>
                                                    await ownerReviewCommentController
                                                        .createReviewComment(
                                                            index));
                                          }
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(
                                            16.w, 16.h, 16.w, 16.h),
                                        margin: EdgeInsets.fromLTRB(
                                            16.w, 16.h, 16.w, 16.h),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black45)),
                                        child: Text(
                                          ownerReviewController
                                                  .ownerReviewModel
                                                  .value
                                                  .reviewList[index]['hasComment']
                                              ? '수정'
                                              : '작성'
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16.w,
                                    ),
                                    Visibility(
                                      visible: ownerReviewController
                                          .ownerReviewModel
                                          .value
                                          .reviewList[index]['hasComment'],
                                      child: InkWell(
                                        onTap: () async {
                                          FocusScope.of(context).unfocus();
                                          GetDialog().alternativeDialog(
                                              '리뷰 답글을 삭제하시겠습니까?',
                                              () async =>
                                                  await ownerReviewCommentController
                                                      .deleteReviewComment(
                                                          index));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(
                                              16.w, 16.h, 16.w, 16.h),
                                          margin: EdgeInsets.fromLTRB(
                                              16.w, 16.h, 16.w, 16.h),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black45)),
                                          child: Text(
                                            '삭제'
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                              onExpansionChanged: (bool expanded) async {
                                if (ownerReviewController.ownerReviewModel.value
                                        .reviewList[index]['hasComment'] &&
                                    expanded &&
                                    ownerReviewController
                                            .commentModel[index].isFetch ==
                                        false) {
                                  await ownerReviewCommentController
                                      .loadReviewComment(index);
                                  ownerReviewController.commentModel[index]
                                          .commentController!.text =
                                      ownerReviewCommentController
                                          .getReviewCommentModel.value.comment!;
                                  ownerReviewController
                                          .commentModel[index].reviewCommentId =
                                      ownerReviewCommentController
                                          .getReviewCommentModel
                                          .value
                                          .reviewCommentId;
                                  ownerReviewController
                                      .commentModel[index].isFetch = true;
                                }
                              },
                              tilePadding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
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
