import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

class ProductInfo extends StatelessWidget {
  final taste = ['초코', '바닐라', '딸기', '치약'];
  var currentSelectedValue;

  void onChange(String value) {
    currentSelectedValue = value;
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    if (isLiked) {
      Fluttertoast.showToast(
        msg: '찜목록에서 제거했어요!',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red[200],
        gravity: ToastGravity.BOTTOM,
        fontSize: 15.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: '찜목록에 담았어요!',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red[200],
        fontSize: 15.0,
      );
    }
    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text('설명',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CupertinoButton(
                  onPressed: () {},
                  child: LikeButton(
                    onTap: onLikeButtonTapped,
                    size: 55.0,
                    animationDuration: const Duration(milliseconds: 500),
                  ),
                ),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        15.0,
                      ),
                    ),
                  ),
                  child: MaterialButton(
                    minWidth: double.minPositive,
                    height: 60,
                    color: Colors.red[200],
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "구매하기",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2,
                                      padding: EdgeInsets.all(15),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CupertinoButton(
                                                  minSize: 0,
                                                  padding: EdgeInsets.zero,
                                                  child: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      size: 40,
                                                      color: Colors.black38),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '필수 옵션 선택',
                                              style: GoogleFonts.lato(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 0, 10, 0),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1,
                                                  color: Colors.black38,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0),
                                                ),
                                              ),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                  hint: Text("케이크 맛"),
                                                  value: currentSelectedValue,
                                                  items: taste.map((value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      currentSelectedValue =
                                                          value;
                                                      taste.remove(value);
                                                      taste.insert(0, '$value');
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CupertinoButton(
                                        padding:
                                            EdgeInsets.fromLTRB(30, 10, 30, 10),
                                        color: Colors.red[200],
                                        child: Text(
                                          '장바구니 담기',
                                          style: GoogleFonts.lato(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            Fluttertoast.showToast(
                                              msg: '장바구니에 담았어요 !',
                                              toastLength: Toast.LENGTH_SHORT,
                                            );
                                            Navigator.pop(context);
                                          });
                                        },
                                      ),
                                      CupertinoButton(
                                        padding:
                                            EdgeInsets.fromLTRB(30, 10, 30, 10),
                                        color: Colors.red[200],
                                        child: Text(
                                          '바로 구매하기',
                                          style: GoogleFonts.lato(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
