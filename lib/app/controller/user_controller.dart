import 'package:damo/app/controller/token_controller.dart';
import 'package:damo/app/data/model/user_model.dart';
import 'package:damo/app/data/provider/user/user_api.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  TokenController tokenController = Get.find();
  Rx<GetUserInfoModel>? getUserInfoModel;
  Rx<AccessTokenAvailableCheckModel>? accessTokenAvailableCheckModel;
  Rx<ChangeAddressModel>? changeAddressModel;
  Rx<NicknameDoubleCheckModel>? nicknameDoubleCheckModel;
  Rx<CheckOwnerModel>? checkOwnerModel;
  Rx<UserPhoneNumberModel>? userPhoneNumberModel;
  Rx<ChangeProfileImageModel>? changeProfileImageModel;
  Rx<ChangeDefaultProfileImageModel>? changeDefaultProfileImageModel;
  Rx<RefreshAccessTokenModel>? refreshAccessTokenModel;
  RxBool? addrEditCheck = false.obs;

  Map<String, dynamic> input = {};
  String sendData = '';
  var response;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    if(tokenController.isAutoLogin!.value == true){
      input.clear();
      response = await UserNetwork().getUsers();
      getUserInfoModel = GetUserInfoModel.fromJson(response).obs;
      print(getUserInfoModel!.value);
      print(getUserInfoModel!.value);

      if (getUserInfoModel!.value.code == 1) {

      } else if (getUserInfoModel!.value.code == 2) {

      } else {
        tokenController.reGetAccessToken();
      }
    }

  }

  void isAvailableAccessToken() {}

  Future<void> registerAddress() async {
    input.clear();
    input['addr1'] = getUserInfoModel!.value.addr1;
    input['addr2'] = getUserInfoModel!.value.addr2;
    input['zipcode'] = getUserInfoModel!.value.zipcode;
    sendData = ChangeAddressModel().toJson(input);
    response = await UserNetwork().postUsersAddress(sendData);
    changeAddressModel = ChangeAddressModel.fromJson(response).obs;

    if(changeAddressModel!.value.code == 3){
      tokenController.reGetAccessToken();
    }
  }
}
