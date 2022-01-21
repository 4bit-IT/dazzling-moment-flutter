import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/app/data/model/owner/owner_shop_faq_model.dart';
import 'package:damo/app/data/provider/owner/owner_shop_faq_api.dart';
import 'package:damo/viewmodel/get_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'owner_shop_controller.dart';

class OwnerShopFAQController extends GetxController {
  TokenController tokenController = Get.find();
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
        await tokenController.refreshGetAccessToken();
        await fetchShopFAQData();
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

  Future<void> faqModifyClicked() async {
    GetDialog().alternativeDialog('해당 FAQ를 수정하시겠습니까?', () => modifyFAQ());
  }

  void modifyFAQ() async {
    await faqQuestionModify();
    await faqAnswerModify();
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
    } else if (model.code == 2) {
    } else {
      await tokenController.refreshGetAccessToken();
      await faqQuestionModify();
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
      Get.back();
      Get.back();
    } else if (model.code == 2) {
    } else {
      await tokenController.refreshGetAccessToken();
      await faqAnswerModify();
    }
  }

  void onAddFAQClicked() async {
    if (shopFAQAnswerAddController.value.value.text == '' ||
        shopFAQQuestionAddController.value.value.text == '') {
      GetDialog().simpleDialog('질문과 답변 모두 작성해주세요.');
    } else {
      GetDialog()
          .alternativeDialog('해당 FAQ를 등록하시겠습니까?', () async => await addFAQ());
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
      Get.back();
    } else if (model.code == 2) {
    } else {
      await tokenController.refreshGetAccessToken();
      await addFAQ();
    }
  }

  void onDeleteFAQClicked() async {
    GetDialog()
        .alternativeDialog('해당 FAQ를 삭제하시겠습니까?', () async => await deleteFAQ());
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
      Get.back();
    } else if (model.code == 2) {
    } else {
      await tokenController.refreshGetAccessToken();
      await deleteFAQ();
    }
  }

  void cancelFAQRegistration() {
    shopFAQQuestionAddController.value.clear();
    shopFAQAnswerAddController.value.clear();
    Get.back();
  }
}

class OwnerShopFAQBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<OwnerShopFAQController>(OwnerShopFAQController());
  }
}
