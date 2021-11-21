import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GetUsersData extends GetxController {
  late int code;
  late RxString addr1; // example: 서울특별시 금천구 가산디지털1로 5
  late RxString addr2; // example: 807호
  late RxString zipcode; // example: 12345
  bool addrEditCheck = false; // 주소가 변경됐는지 확인하는 클라이언트 전용 변수.
  late String lastAgreeDateOfMarketing; // $date
  late String lastAgreeDateOfPushNotification; // $date
  late String lastAgreeDateOfServiceAndPersonalData; // $date
  late bool marketing; // 마케팅 수신 동의
  late bool pushNotification; // 앱 푸시 알림 동의
  late bool serviceAndPersonalData; // 서비스 이용약관 동의 & 개인정보 수집 및 이용 동의
  late String ageRange; // example: 20~29
  late String birth; // example: MMDD
  late String createdAt; // example: 2021-10-28
  late String email; // example: example@damo.com
  late int id; // example: 1
  late String name; // 김다모
  late String nickname; // 김모다
  late String phoneNumber; // example: 010-0000-0000
  late RxString profileImage; // example: https://~
  late String sex; // example: MALE
  late String description; // example: 성공 or 에러 메세지 or 토큰이 만료되었습니다.
  late bool result; // example: true

  Future<void>? saveUsersData(dynamic json) {
    code = json['code'];
    addr1 = json['data']['address']['addr1'].toString().obs;
    addr2 = json['data']['address']['addr2'].toString().obs;
    zipcode = json['data']['address']['zipcode'].toString().obs;
    ageRange = json['data']['ageRange'];
    lastAgreeDateOfMarketing =
        json['data']['agreements']['lastAgreeDateOfMarketing'];
    lastAgreeDateOfPushNotification =
        json['data']['agreements']['lastAgreeDateOfPushNotification'];
    lastAgreeDateOfServiceAndPersonalData =
        json['data']['agreements']['lastAgreeDateOfServiceAndPersonalData'];
    marketing = json['data']['agreements']['marketing'];
    pushNotification = json['data']['agreements']['pushNotification'];
    serviceAndPersonalData =
        json['data']['agreements']['serviceAndPersonalData'];
    birth = json['data']['birth'];
    createdAt = json['data']['createdAt'];
    email = json['data']['email'];
    id = json['data']['id'];
    name = json['data']['name'];
    nickname = json['data']['nickname'];
    phoneNumber = json['data']['phoneNumber'];
    profileImage = json['data']['profileImage'].toString().obs;
    sex = json['data']['sex'];
    description = json['description'];
    result = json['result'];
  }
}
