import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kakao_flutter_sdk/all.dart';

class KakaoData {
  String? nickName;
  String? accountEmail;
}

class Network {
  final String url;
  AccessTokenResponse token;
  Network(this.url, this.token);

  Future<void> getJsonData() async{
    Map data = {'kakaoToken': token.accessToken};
    var body = json.encode(data);
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      String jsonData = response.body;
      print(jsonData);
      var parsingData = jsonDecode(jsonData);
      print(parsingData);
    }
    else{
      print('sex');
    }
  }
}