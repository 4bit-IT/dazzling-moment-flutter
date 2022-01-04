import 'package:damo/app/data/model/owner/owner_shop_faq_model.dart';
import 'package:damo/app/data/model/shop_faq_model.dart';
import 'package:damo/app/data/provider/owner/owner_shop_faq_api.dart';
import 'package:damo/app/data/provider/shop/shop_faq_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'owner_shop_controller.dart';

class OwnerShopFAQController extends GetxController {
  OwnerShopController ownerShopController = Get.find();
  Rx<OwnerShopGetFAQModel> ownerShopGetFAQModel = OwnerShopGetFAQModel().obs;
  Rx<TextEditingController> shopFAQQuestionController =
      TextEditingController().obs;
  Rx<TextEditingController> shopFAQAnswerController =
      TextEditingController().obs;
  Rx<TextEditingController> shopFAQQuestionAddController =
      TextEditingController().obs;
  Rx<TextEditingController> shopFAQAnswerAddController =
      TextEditingController().obs;
  RxInt shopFAQCount = 0.obs;
  RxInt currentIndex = 0.obs;

  Map<String, dynamic> toJsonInput = {};
  String sendData = '';
  var response;
  dynamic model;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await fetchShopFAQData();
  }

  Future<void> fetchShopFAQData() async {
    response = await OwnerShopFAQNetwork().getFAQ();
    if (response != null) {
      model = OwnerShopGetFAQModel.fromJson(response);

      if (model.code == 1) {
        ownerShopGetFAQModel.update((val) {
          val!.code = model.code;
          val.faqList = model.faqList;
          val.description = model.description;
          val.result = model.result;
        });
        shopFAQCount.value = ownerShopGetFAQModel.value.faqList!.length;
      } else if (model.code == 2) {
      } else {
        //토큰만료
      }
    }
  }

  void changeCurrentIndex(int index) {
    currentIndex = index.obs;
    shopFAQQuestionController = TextEditingController(
            text: ownerShopGetFAQModel.value.faqList![currentIndex.value]
                ['question'])
        .obs;
    shopFAQAnswerController = TextEditingController(
            text: ownerShopGetFAQModel.value.faqList![currentIndex.value]
                ['answer'])
        .obs;
  }

  Future<void> faqModify() async {
    Get.dialog(
      Dialog(
        child: Container(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
          alignment: Alignment.center,
          height: 190.h,
          width: 130.w,
          child: Wrap(
            alignment: WrapAlignment.center,
            /*mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,*/
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                child: Text(
                  '해당 FAQ를 수정하시겠습니까?',
                  style: TextStyle(
                      color: Color(0xff283137),
                      fontFamily: 'NotoSansCJKKR',
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                      child: Text(
                        '아니오',
                        style: TextStyle(
                            color: Color(0xff283137),
                            fontFamily: 'NotoSansCJKKR',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Get.back();
                      Get.back();
                      await faqQuestionModify();
                      await faqAnswerModify();
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                      child: Text(
                        '예',
                        style: TextStyle(
                            color: Color(0xff283137),
                            fontFamily: 'NotoSansCJKKR',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> faqQuestionModify() async {
    toJsonInput.clear();
    toJsonInput['question'] = shopFAQQuestionController.value.value.text;
    toJsonInput['faqId'] =
        ownerShopGetFAQModel.value.faqList![currentIndex.value]['faqId'];
    sendData = OwnerShopModifyFAQQuestionModel().toJson(toJsonInput);
    response = await OwnerShopFAQNetwork().patchFAQQuestion(sendData);
    model = OwnerShopModifyFAQQuestionModel.fromJson(response);

    if (model.code == 1) {
      ownerShopGetFAQModel.update((val) {
        val!.faqList![currentIndex.value]['question'] = model.question;
      });
    }
  }

  Future<void> faqAnswerModify() async {
    toJsonInput.clear();
    toJsonInput['answer'] = shopFAQAnswerController.value.value.text;
    toJsonInput['faqId'] =
        ownerShopGetFAQModel.value.faqList![currentIndex.value]['faqId'];
    sendData = OwnerShopModifyFAQAnswerModel().toJson(toJsonInput);
    response = await OwnerShopFAQNetwork().patchFAQAnswer(sendData);
    model = OwnerShopModifyFAQAnswerModel.fromJson(response);

    if (model.code == 1) {
      ownerShopGetFAQModel.update((val) {
        val!.faqList![currentIndex.value]['answer'] = model.answer;
      });
    }
  }

  void onAddFAQClicked() async {
    if (shopFAQAnswerAddController.value.value.text == '' ||
        shopFAQQuestionAddController.value.value.text == '') {
      Get.dialog(
        Dialog(
          child: Container(
            height: 100,
            child: Center(
              child: Text(
                '질문과 답변 모두 작성해주세요.',
                style: TextStyle(
                    color: Color(0xff283137),
                    fontFamily: 'NotoSansCJKKR',
                    fontSize: 20.sp,
                    height: 1,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      );
    } else {
      Get.dialog(
        Dialog(
          child: Container(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
            alignment: Alignment.center,
            height: 190.h,
            width: 120.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                  child: Text(
                    '해당 FAQ를 등록하시겠습니까?',
                    style: TextStyle(
                        color: Color(0xff283137),
                        fontFamily: 'NotoSansCJKKR',
                        fontSize: 22.sp,
                        height: 1,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                        child: Text(
                          '아니오',
                          style: TextStyle(
                              color: Color(0xff283137),
                              fontFamily: 'NotoSansCJKKR',
                              fontSize: 16.sp,
                              height: 1,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await addFAQ();
                        Get.back();
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                        child: Text(
                          '예',
                          style: TextStyle(
                              color: Color(0xff283137),
                              fontFamily: 'NotoSansCJKKR',
                              fontSize: 16.sp,
                              height: 1,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
  }

  Future<void> addFAQ() async {
    toJsonInput.clear();
    toJsonInput['answer'] = shopFAQAnswerAddController.value.value.text;
    toJsonInput['question'] = shopFAQQuestionAddController.value.value.text;
    sendData = OwnerShopAddFAQModel().toJson(toJsonInput);
    response = await OwnerShopFAQNetwork().postFAQ(sendData);
    model = OwnerShopAddFAQModel.fromJson(response);

    if (model.code == 1) {
      ownerShopGetFAQModel.update((val) {
        val!.faqList!.add({
          'answer': model.answer,
          'faqId': model.faqId,
          'question': model.question,
        });
      });
      print(ownerShopGetFAQModel.value.faqList);
    }
  }

  void onDeleteFAQClicked() async {
    Get.dialog(
      Dialog(
        child: Container(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
          alignment: Alignment.center,
          height: 190.h,
          width: 120.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                child: Text(
                  '해당 FAQ를 삭제하시겠습니까?',
                  style: TextStyle(
                      color: Color(0xff283137),
                      fontFamily: 'NotoSansCJKKR',
                      fontSize: 22.sp,
                      height: 1,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                      child: Text(
                        '아니오',
                        style: TextStyle(
                            color: Color(0xff283137),
                            fontFamily: 'NotoSansCJKKR',
                            fontSize: 16.sp,
                            height: 1,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Get.back();
                      Get.back();
                      await deleteFAQ();
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                      child: Text(
                        '예',
                        style: TextStyle(
                            color: Color(0xff283137),
                            fontFamily: 'NotoSansCJKKR',
                            fontSize: 16.sp,
                            height: 1,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> deleteFAQ() async {
    int currentFAQId = ownerShopGetFAQModel
        .value.faqList![ownerShopFAQController.currentIndex.value]['faqId'];
    response = await OwnerShopFAQNetwork().deleteFAQ();
    model = OwnerShopDeleteFAQModel.fromJson(response);
    print('pre: ${ownerShopGetFAQModel.value.faqList}');
    if (model.code == 1) {
      ownerShopGetFAQModel.update((val) {
        val!.faqList!.removeWhere((item) => item['faqId'] == currentFAQId);
      });
      print(ownerShopGetFAQModel.value.faqList);
      currentIndex.value--;
    }
  }
}

class OwnerShopFAQBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    // TODO: implement dependencies
    Get.put<OwnerShopFAQController>(OwnerShopFAQController());
  }
}
