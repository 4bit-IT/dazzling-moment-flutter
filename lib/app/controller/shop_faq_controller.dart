import 'package:damo/app/controller/shop_controller.dart';
import 'package:damo/app/data/model/shop_faq_model.dart';
import 'package:damo/app/data/provider/shop/shop_faq_api.dart';
import 'package:get/get.dart';

class ShopFAQController extends GetxController {
  ShopController shopController = Get.find();
  Rx<ShopGetFAQtoUserModel> shopGetFAQtoUserModel = ShopGetFAQtoUserModel().obs;

  Map<String, dynamic> toJsonInput = {};
  String sendData = '';
  var response;
  dynamic model;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    await loadShopFAQ(shopController.shopGetDetailModel.value.id!);
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
}

class ShopFAQBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    // TODO: implement dependencies
    Get.put<ShopFAQController>(ShopFAQController(), permanent: true);
  }
}
