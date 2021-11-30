// import 'package:damo/app/controller/token_controller.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;


// TokenController tokenController = Get.find();
// const baseUri = ('https://www.damoforyou.com/api');
// final headers = {
//   'Content-Type': 'application/json',
//   'token':tokenController.token!['accessToken']!;
// };

// class ReviewNetwork {
//   Future<void> getReview() async {
//     try {
//       http.Response response = await http.get(
//           Uri.parse(
//             baseUri + '/review',
//           ),
//           headers: headers,
//           body: sendData);
//       return jsonDecode(utf8.decode(response.bodyBytes));
//     } catch (e) {
//       print('postOauthKakaoLogin 예외발생');
//       print(e);
//     }
//   }
// }
