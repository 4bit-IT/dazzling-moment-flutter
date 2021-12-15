import 'package:damo/app/controller/shop_controller.dart';
import 'package:damo/app/data/model/shop_faq_model.dart';
import 'package:damo/app/data/provider/shop/shop_faq_api.dart';
import 'package:damo/view/shop/shop_faq/shop_faq_info.dart';
import 'package:damo/view/shop/shop_faq/shop_faq_management.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShopFAQController extends GetxController {
  ShopController shopController = Get.find();
  Rx<ShopGetFAQModel> shopGetFAQModel = ShopGetFAQModel().obs;
  Rx<ShopGetFAQtoUserModel> shopGetFAQtoUserModel = ShopGetFAQtoUserModel().obs;
  Rx<TextEditingController> shopFAQQuestionController = TextEditingController().obs;
  Rx<TextEditingController> shopFAQAnswerController = TextEditingController().obs;
  Rx<TextEditingController> shopFAQQuestionAddController = TextEditingController().obs;
  Rx<TextEditingController> shopFAQAnswerAddController = TextEditingController().obs;
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
    //await fetchShopFAQData();
    await loadShopFAQ(shopController.shopGetDetailModel.value.id!);
  }

  Future<void> fetchShopFAQData() async {
    response = await ShopFAQNetwork().getFAQ();
    model = ShopGetFAQModel.fromJson(response);

    if (model.code == 1) {
      shopGetFAQModel.update((val) {
        val!.code = model.code;
        val.faqList = model.faqList;
        val.description = model.description;
        val.result = model.result;
      });
      shopFAQCount.value = shopGetFAQModel.value.faqList!.length;
    } else if (model.code == 2) {
    } else {
      //토큰만료
    }
  }

  Future<void> loadShopFAQ(int shopId) async {
    response = await ShopFAQNetwork().getFAQtoUser(shopId);
    model = ShopGetFAQtoUserModel.fromJson(response);

    if (model.code == 1) {
      shopGetFAQtoUserModel.update((val) {
        val!.code = model.code;
        val.faqList = model.faqList;
        val.description = model.description;
        val.result = model.result;
      });
    }
    if (model.code == 2) {}
    if (model.code == 3) {}
  }

  void changeCurrentIndex(int index) {
    currentIndex = index.obs;
    shopFAQQuestionController =
        TextEditingController(text: shopGetFAQModel.value.faqList![currentIndex.value]['question']).obs;
    shopFAQAnswerController =
        TextEditingController(text: shopGetFAQModel.value.faqList![currentIndex.value]['answer']).obs;
  }

  Future<void> faqModify() async {
    Get.dialog(
      Dialog(
        child: Container(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
          alignment: Alignment.center,
          height: 190.h,
          width: 130.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                child: Text(
                  '해당 FAQ를 수정하시겠습니까?',
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

  Future<void> faqQuestionModify() async {
    toJsonInput.clear();
    toJsonInput['question'] = shopFAQQuestionController.value.value.text;
    toJsonInput['faqId'] = shopGetFAQModel.value.faqList![currentIndex.value]['faqId'];
    sendData = ShopModifyFAQQuestionModel().toJson(toJsonInput);
    response = await ShopFAQNetwork().patchFAQQuestion(sendData);
    model = ShopModifyFAQQuestionModel.fromJson(response);

    if (model.code == 1) {
      shopGetFAQModel.update((val) {
        val!.faqList![currentIndex.value]['question'] = model.question;
      });
    }
  }

  Future<void> faqAnswerModify() async {
    toJsonInput.clear();
    toJsonInput['answer'] = shopFAQAnswerController.value.value.text;
    toJsonInput['faqId'] = shopGetFAQModel.value.faqList![currentIndex.value]['faqId'];
    sendData = ShopModifyFAQAnswerModel().toJson(toJsonInput);
    response = await ShopFAQNetwork().patchFAQAnswer(sendData);
    model = ShopModifyFAQAnswerModel.fromJson(response);

    if (model.code == 1) {
      shopGetFAQModel.update((val) {
        val!.faqList![currentIndex.value]['answer'] = model.answer;
      });
    }
  }

  void onAddFAQClicked() async {
    if (shopFAQAnswerAddController.value.value.text == '' || shopFAQQuestionAddController.value.value.text == '') {
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
    sendData = ShopAddFAQModel().toJson(toJsonInput);
    response = await ShopFAQNetwork().postFAQ(sendData);
    model = ShopAddFAQModel.fromJson(response);

    if (model.code == 1) {
      shopGetFAQModel.update((val) {
        val!.faqList!.add({
          'answer': model.answer,
          'faqId': model.faqId,
          'question': model.question,
        });
      });
      print(shopGetFAQModel.value.faqList);
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
    int currentFAQId = shopGetFAQModel.value.faqList![shopFAQController.currentIndex.value]['faqId'];
    response = await ShopFAQNetwork().deleteFAQ();
    model = ShopDeleteFAQModel.fromJson(response);
    print('pre: ${shopGetFAQModel.value.faqList}');
    if (model.code == 1) {
      shopGetFAQModel.update((val) {
        val!.faqList!.removeWhere((item) => item['faqId'] == currentFAQId);
      });
      print(shopGetFAQModel.value.faqList);
      currentIndex.value--;
    }
  }
}

class ShopFAQBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    // TODO: implement dependencies
    Get.put<ShopFAQController>(ShopFAQController(), permanent: true);
  }
}
