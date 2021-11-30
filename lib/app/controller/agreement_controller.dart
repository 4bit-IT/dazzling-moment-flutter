import 'package:damo/app/controller/user_controller.dart';
import 'package:damo/app/data/model/agreement_model.dart';
import 'package:damo/app/data/provider/agreement_api.dart';
import 'package:get/get.dart';

class AgreementController extends GetxController {
  UserController userController = Get.find();
  Future<void> onChangedAgreementMarketing() async {
    var jsonResponse = await AgreementNetwork().patchAgreementMarketing();
    var model = AgreementModel.fromJson(jsonResponse);

    if (model.code == 1) {
      if (userController.getUserInfoModel.value.marketing == true) {
        userController.getUserInfoModel.value.marketing = false;
        userController.getUserInfoModel.refresh();
        print('마케팅 수신동의 거절');
        return;
      }
      if (userController.getUserInfoModel.value.marketing == false) {
        userController.getUserInfoModel.value.marketing = true;
        userController.getUserInfoModel.refresh();
        print('마케팅 수신동의 수락');
        return;
      }
    }
    if (model.code == 2) {}
    if (model.code == 3) {}
  }

  Future<void> onChangedAgreementPush() async {
    var jsonResponse = await AgreementNetwork().patchAgreementPush();
    var model = AgreementModel.fromJson(jsonResponse);

    if (model.code == 1) {
      if (userController.getUserInfoModel.value.pushNotification == true) {
        userController.getUserInfoModel.value.pushNotification = false;
        userController.getUserInfoModel.refresh();
        print('푸쉬 알림 수신동의 거절');
        return;
      }
      if (userController.getUserInfoModel.value.pushNotification == false) {
        userController.getUserInfoModel.value.pushNotification = true;
        userController.getUserInfoModel.refresh();
        print('푸쉬 알림 수신동의 수락');
        return;
      }
    }
    if (model.code == 2) {}
    if (model.code == 3) {}
  }
}
