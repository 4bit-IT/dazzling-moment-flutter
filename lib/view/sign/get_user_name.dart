import 'package:damo/app/controller/sign_controller.dart';
import 'package:damo/view/main/home_main.dart';
import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class GetUserNickname extends StatelessWidget {
  final SignController signController = Get.put(SignController());
  TextEditingController nicknameController = TextEditingController();
  List<Widget> radioList = [];
  List<Widget> radioImage = [];
  List<String> radioText = [];
  Widget confirmButton = SvgPicture.asset(
    'assets/images_svg/btn_확인_off.svg',
    width: 375.w,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().textAppBar(context, '회원가입'),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      '닉네임',
                      style: TextStyle(
                        color: Color(0xff283137),
                        fontSize: 16.sp,
                        height: 1,
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
                                controller:
                                    signController.nicknameController.value,
                                textAlign: TextAlign.start,
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
                                signController.doubleCheckClicked();
                              },
                              child: SvgPicture.asset(
                                'assets/images_svg/btn_중복확인.svg',
                                width: 92.w,
                                height: 52.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 16.h, 0, 12.h),
                      child: Text(
                        '* 닉네임은 한글, 숫자, 영문으로 된 2~8자로 구성해주세요.',
                        style: TextStyle(
                          color: Color(0xfff93f5b),
                          fontSize: 14.sp,
                          height: 1,
                          fontFamily: 'NotoSansCJKKR',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Container(
                      height: 132.h,
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Obx(
                                () => Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          signController.acceptClicked(index);
                                        },
                                        child: signController
                                            .acceptList[index].value.ic),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    index == 0
                                        ? Text(
                                            '${signController.acceptList[index].value.description}',
                                            style: TextStyle(
                                              color: Color(0xff283137),
                                              fontSize: 13.sp,
                                              height: 1,
                                              fontFamily: 'NotoSansCJKKR',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        : Text(
                                            '${signController.acceptList[index].value.description}',
                                            style: TextStyle(
                                              color: Color(0xff283137),
                                              fontSize: 13.sp,
                                              height: 1,
                                              fontFamily: 'NotoSansCJKKR',
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (signController.acceptList[1].value.check &&
                  signController.acceptList[2].value.check &&
                  signController.isNicknameCheck.value) {
                //회원가입 api 호출한 뒤
                Get.offAll(() => HomeMain());
              }
            },
            child: Obx(() => signController.getConfirmButton.value),
          )
        ],
      ),
    );
  }
}
