import 'package:damo/app/data/model/user_model.dart';
import 'package:damo/app/data/provider/kakao.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  GetUserInfoModel? getUserInfoModel;
  AccessTokenAvailableCheckModel? accessTokenAvailableCheckModel;
  ChangeAddressModel? changeAddressModel;
  NicknameDoubleCheckModel? nicknameDoubleCheckModel;
  CheckOwnerModel? checkOwnerModel;
  UserPhoneNumberModel? userPhoneNumberModel;
  ChangeProfileImageModel? changeProfileImageModel;
  ChangeDefaultProfileImageModel? changeDefaultProfileImageModel;
  RefreshAccessTokenModel? refreshAccessTokenModel;

  void isAvailableAccessToken() {

  }

}
