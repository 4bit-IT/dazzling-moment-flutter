import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SellerController extends GetxController {
  final ImagePicker _picker = ImagePicker();
/*  late ShopRegistrationModel shopRegistrationModel;
  late ShopGetDetailModel shopGetDetailModel;
  late ShopImageRegistrationModel shopImageRegistrationModel;
  late ShopImageDeleteModel shopImageDeleteModel;
  late ShopChangeMainImageModel shopChangeMainImageModel;
  late ShopGetMeModel shopGetMeModel;
  late ShopOptionRegistration shopOptionRegistration;
  late String accessToken;
  late String refreshToken;*/

  late int shopImageCount;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    //shopGetMeModel = await ShopNetwork().getShopMe();
    shopImageCount = 5;
  }

  void onChangeSellerMainImage() async {}
}
