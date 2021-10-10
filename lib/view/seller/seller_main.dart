import 'package:damo/ViewModel/bar/app_bar.dart';
import 'package:damo/view/seller/seller_chat_management.dart';
import 'package:damo/view/seller/seller_order_management.dart';
import 'package:damo/view/seller/seller_preview.dart';
import 'package:damo/view/seller/seller_product_main.dart';
import 'package:damo/view/seller/seller_review_management.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'seller_faq_management.dart';

class SellerMain extends StatefulWidget {
  @override
  _SellerMainState createState() => _SellerMainState();
}

class _SellerMainState extends State<SellerMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamoAppBar().sellerAppBar(context),
      body: Container(
        padding: EdgeInsets.fromLTRB(40, 0, 20, 0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Icon(
                    Icons.wallet_giftcard,
                    color: Colors.redAccent[200],
                  ),
                  CupertinoButton(
                    child: Text(
                      '내 상품 관리하기',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Get.to(() => SellerProductMain());
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.border_color,
                    color: Colors.redAccent[200],
                  ),
                  CupertinoButton(
                    child: Text(
                      '주문 관리하기',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Get.to(() => SellerOrderManagement());
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.history,
                    color: Colors.redAccent[200],
                  ),
                  CupertinoButton(
                    child: Text(
                      '판매 내역 보기',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.messenger_outlined,
                    color: Colors.redAccent[200],
                  ),
                  CupertinoButton(
                    child: Text(
                      '쪽지 관리하기',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Get.to(() => SellerChatManagement());
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.reviews_outlined,
                    color: Colors.redAccent[200],
                  ),
                  CupertinoButton(
                    child: Text(
                      '리뷰 관리하기',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Get.to(() => SellerReviewManagement());
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.read_more,
                    color: Colors.redAccent[200],
                  ),
                  CupertinoButton(
                    child: Text(
                      '내 판매 페이지 미리보기',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Get.to(() => SellerPreview());
                    },
                  ),
                ],
              ),
              Row(children: [
                Icon(
                  Icons.query_stats,
                  color: Colors.redAccent[200],
                ),
                CupertinoButton(
                  child: Text(
                    'FAQ 관리하기',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => SellerFAQManagement());
                  },
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
