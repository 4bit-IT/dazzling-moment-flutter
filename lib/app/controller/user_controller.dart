import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GetUsersData extends GetxController {
  late int code;
  late String addr1;
  late String addr2;
  late String zipcode;
  late String lastAgreeDateOfMarketing;
  late String lastAgreeDateOfPushNotification;
  late String lastAgreeDateOfServiceAndPersonalData;
  late String marketing;
  late String pushNotification;
  late String serviceAndPersonalData;
  late String ageRange;
  late String birth;
  late String createdAt;
  late String email;
  late String id;
  late String name;
  late String nickname;
  late String phoneNumber;
  late String profileImage;
  late String sex;
  late String description;
  late bool result;

  Future<void> saveUsersData(dynamic json) async {
    code = json['code'];
    addr1 = json['data']['address']['addr1'].toString();
    addr2 = json['data']['address']['addr2'].toString();
    zipcode = json['data']['address']['zipcode'].toString();
    ageRange = json['data']['ageRange'].toString();
    lastAgreeDateOfMarketing =
        json['data']['agreements']['lastAgreeDateOfMarketing'].toString();
    lastAgreeDateOfPushNotification = json['data']['agreements']
            ['lastAgreeDateOfPushNotification']
        .toString();
    lastAgreeDateOfServiceAndPersonalData = json['data']['agreements']
            ['lastAgreeDateOfServiceAndPersonalData']
        .toString();
    marketing = json['data']['agreements']['marketing'].toString();
    pushNotification =
        json['data']['agreements']['pushNotification'].toString();
    serviceAndPersonalData =
        json['data']['agreements']['serviceAndPersonalData'].toString();
    birth = json['data']['birth'].toString();
    createdAt = json['data']['createdAt'].toString();
    email = json['data']['email'].toString();
    id = json['data']['id'].toString();
    name = json['data']['name'].toString();
    nickname = json['nickname'].toString();
    phoneNumber = json['phoneNumber'].toString();
    profileImage = json['data']['profileImage'].toString();
    sex = json['data']['sex'].toString();
    description = json['description'].toString();
    result = json['result'];
  }
}
