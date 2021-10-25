import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class GetUserNickname extends StatelessWidget {
  TextEditingController nicknameController = TextEditingController();
  List<Widget> radioList = [];
  List<Widget> radioImage = [];
  List<String> radioText = [];
  Widget confirmButton = SvgPicture.asset('assets/images_svg/btn_확인_off.svg',width: 375.w,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().textAppBar(context, '회원가입'),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
        child: FutureBuilder(
          future: getList(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData == false) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Padding(
                padding: EdgeInsets.all(15),
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '닉네임',
                    style: TextStyle(
                      color: Color(0xff283137),
                      fontSize: 16,
                      fontFamily: 'NotoSansCJKKR',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    height: 52.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xffd1d1d6),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(16.w, 0, 0, 0),
                            child: TextFormField(
                              onChanged: (text) {
                                /*print(text);
                            print(RegExp(
                                r'^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$')
                                .hasMatch(
                                phoneNumberController.value.text));
                            if (RegExp(r'^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$')
                                .hasMatch(
                                phoneNumberController.value.text) ==
                                false) {
                              smsAuthButton = SvgPicture.asset(
                                'assets/images_svg/btn_인증번호받기_off.svg',
                              );
                            } else {
                              smsAuthButton = SvgPicture.asset(
                                'assets/images_svg/btn_인증번호받기_on.svg',
                              );
                            }*/
                              },
                              controller: nicknameController,
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                MaskTextInputFormatter(
                                  mask: '###-####-####',
                                )
                              ],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusColor: Colors.black,
                                hintText: '닉네임을 입력해주세요',
                                hintStyle: TextStyle(
                                    color: Color(0xffd1d1d6),
                                    fontFamily: 'NotoSansCJKKR',
                                    fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: InkWell(
                            onTap: () {
                              if (RegExp(r'^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$')
                                      .hasMatch(
                                          nicknameController.value.text) ==
                                  true) {}
                            },
                            child: SvgPicture.asset(
                              'assets/images_svg/btn_중복확인.svg',
                              width: 92.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Expanded(
                    child: Column(
                      children: radioList,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (radioImage[1] ==
                              SvgPicture.asset(
                                  'assets/images_svg/ic_radiobtn_on.svg') &&
                          radioImage[2] ==
                              SvgPicture.asset(
                                  'assets/images_svg/ic_radiobtn_on.svg')) {
                        confirmButton = SvgPicture.asset(
                          'assets/images_svg/btn_확인_on.svg',
                          width: 375.w,
                        );
                        print(1);
                      }
                    },
                    child: confirmButton,
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<dynamic> getList() async {
    for (int i = 0; i < 5; i++) {
      radioImage.add(SvgPicture.asset('assets/images_svg/ic_radiobtn_off.svg'));
    }
    radioText.add('모두 동의');
    radioText.add('서비스 이용약관 동의(필수)');
    radioText.add('개인정보의 수집 및 이용 동의(필수)');
    radioText.add('앱푸쉬 알림 동의(선택)');
    radioText.add('마케팅 수신 동의(선택)');
    radioList.add(
      Row(
        children: [
          InkWell(
              onTap: () {
                if (radioImage[0] ==
                    SvgPicture.asset('assets/images_svg/ic_radiobtn_on.svg')) {
                  for (int i = 0; i < 5; i++) {
                    radioImage[i] = SvgPicture.asset(
                        'assets/images_svg/ic_radiobtn_off.svg');
                  }
                } else {
                  for (int i = 0; i < 5; i++) {
                    radioImage[i] = SvgPicture.asset(
                        'assets/images_svg/ic_radiobtn_on.svg');
                  }
                }
              },
              child: radioImage[0]),
          SizedBox(
            width: 8.w,
          ),
          Text(
            radioText[0],
            style: TextStyle(
              color: Color(0xff283137),
              fontSize: 13,
              fontFamily: 'NotoSansCJKKR',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
    radioList.add(SizedBox(
      height: 8.h,
    ));
    for (int i = 1; i < 5; i++) {
      radioList.add(
        Row(
          children: [
            InkWell(
                onTap: () {
                  if (radioImage[i] ==
                      SvgPicture.asset(
                          'assets/images_svg/ic_radiobtn_on.svg')) {
                    radioImage[i] = SvgPicture.asset(
                        'assets/images_svg/ic_radiobtn_off.svg');
                  } else {
                    radioImage[i] = SvgPicture.asset(
                        'assets/images_svg/ic_radiobtn_on.svg');
                  }
                },
                child: radioImage[i]),
            SizedBox(
              width: 8.w,
            ),
            Text(
              radioText[i],
              style: TextStyle(
                color: Color(0xff283137),
                fontSize: 13,
                fontFamily: 'NotoSansCJKKR',
              ),
            ),
          ],
        ),
      );
      radioList.add(SizedBox(
        height: 8.h,
      ));
    }
    return true;
  }
}
