// import 'package:damo/screen/bar/app_bar.dart';
// import 'package:damo/screen/seller/seller_product_modify.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SellerProductMain extends StatefulWidget {
//   const SellerProductMain({Key? key}) : super(key: key);

//   @override
//   _SellerProductMainState createState() => _SellerProductMainState();
// }

// class _SellerProductMainState extends State<SellerProductMain> {
//   late Widget sellerMainImage; //업체 대표 사진
//   late String sellerName; //업체 이름
//   late String sellerDescription; //업체 설명(50자 이내)
//   List<dynamic> receivedData = [];
//   List<Widget> productImages = <Widget>[];

//   @override
//   void initState() {
//     // TODO: implement initState
//     sellerMainImage = Image.asset(
//       'assets/images/DAMO_logo-01.png',
//       width: 200,
//       height: 200,
//     );
//     sellerName = '김다모';
//     sellerDescription = '설명설명';
//     receivedData.add(sellerMainImage);
//     receivedData.add(sellerName);
//     receivedData.add(sellerDescription);

//     for (int i = 0; i < 3; i++) {
//       productImages.add(
//         Image.asset(
//           'assets/images/pro.JPG',
//         ),
//       );
//       productImages.add(
//         Image.asset(
//           'assets/images/DAMO_logo-01.png',
//         ),
//       );
//       productImages.add(
//         Image.asset(
//           'assets/images/DAMO_logo-03.png',
//         ),
//       );
//     }

//     super.initState();
//   }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: DamoAppBar().sellerAppBar(context),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   sellerMainImage,
//                 ],
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height / 20,
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     width: 1,
//                     color: Colors.black38
//                   ),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Text(
//                   '업체명: $sellerName',
//                   style: GoogleFonts.lato(
//                     fontSize: 25,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                       width: 1,
//                       color: Colors.black38
//                   ),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Text(
//                   '업체 설명: $sellerDescription 설명설명 설명설명 설명설명 설명설명 설명설명 설명설명 설명설명 설명설명 설명설명 설명설명 설명설명 설명설명 ',
//                   style: GoogleFonts.lato(fontSize: 20),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                       width: 1,
//                       color: Colors.black38
//                   ),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             '상품 이미지',
//                             style: GoogleFonts.lato(
//                               fontSize: 20,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 20,),
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height / 2,
//                       child: ListView(
//                         scrollDirection: Axis.horizontal,
//                         shrinkWrap: true,
//                         children: productImages,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     child: CupertinoButton(
//                       padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.blue[100],
//                       child: Text(
//                         '수정하기',
//                         style: GoogleFonts.lato(
//                           fontSize: 20,
//                           color: Colors.black,
//                         ),
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => SellerProductModify(),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
