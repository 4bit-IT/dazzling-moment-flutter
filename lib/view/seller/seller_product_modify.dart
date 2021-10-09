import 'package:damo/ViewModel/bar/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:image_picker/image_picker.dart';

class SellerProductModify extends StatefulWidget {
  @override
  _SellerProductModifyState createState() => _SellerProductModifyState();
}

class _SellerProductModifyState extends State<SellerProductModify> {
  // ImagePicker _picker = ImagePicker(); // 카메라/갤러리에서 사진 가져올 때 사용함 (image_picker)
  // XFile? file;
  String result = '';
  TextEditingController sellerNameController = TextEditingController();
  TextEditingController sellerMainController = TextEditingController();

  String? sellerName = '업체명';
  String? sellerMain = '업체 설명';
  Image? sellerImage = Image.asset('assets/images/logo.png');
  List? sellerDetail;

  // List<XFile> resultImages = <XFile>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sellerNameController = TextEditingController(text: sellerName);
    sellerMainController = TextEditingController(text: sellerMain);
  }

  takeMultiImage(mContext) {
    return showDialog(
        context: mContext,
        builder: (context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            title: Text('상품 이미지를 선택해 주세요',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
            children: <Widget>[
/*              SimpleDialogOption(
                child: Text('Capture Image with Camera',
                    style: TextStyle(color: Colors.black)),
                onPressed: () {},
              ),*/
              SimpleDialogOption(
                child: Text('갤러리에서 사진 가져오기',
                    style: TextStyle(color: Colors.black)),
                onPressed: () async {
                  // Navigator.pop(context);
                  // List<XFile> pickedImages = [];
                  // try {
                  //   pickedImages = (await ImagePicker().pickMultiImage())!;
                  // } catch (e) {
                  //   print(e.toString());
                  // }
                  // setState(() {
                  //   if (pickedImages.isNotEmpty) resultImages = pickedImages;
                  // });
                },
              ),
              SimpleDialogOption(
                child: Text('취소', style: TextStyle(color: Colors.redAccent)),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }

  takeImage(mContext) {
    return showDialog(
        context: mContext,
        builder: (context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            title: Text('업체를 대표하는 이미지를 \n선택해 주세요',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
            children: <Widget>[
/*              SimpleDialogOption(
                child: Text('Capture Image with Camera',
                    style: TextStyle(color: Colors.black)),
                onPressed: () {},
              ),*/
              SimpleDialogOption(
                child: Text('갤러리에서 사진 가져오기',
                    style: TextStyle(color: Colors.black)),
                onPressed: () async {
                  // Navigator.pop(context);
                  // final pickedFile = await _picker.pickImage(
                  //   source: ImageSource.gallery,
                  //   maxWidth: 600,
                  //   maxHeight: 700,
                  // );
                  setState(() {
                    // if (pickedFile != null) file = pickedFile;
                  });
                },
              ),
              SimpleDialogOption(
                child: Text('취소', style: TextStyle(color: Colors.redAccent)),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 80,
            backgroundColor: Colors.white,
            child: Image.asset(
              'assets/images/DAMO_logo-01.png',
            ),
          ),
          // child: file == null
          //     ? Image.asset('assets/images/DAMO_logo-01.png')
          //     : Image.file(
          //         File(file!.path),
          //         fit: BoxFit.fill,
          //         width: double.infinity,
          //       )),
          Positioned(
              bottom: 5,
              right: 5,
              child: InkWell(
                onTap: () {
                  takeImage(context);
                },
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.black38,
                  size: 40,
                ),
              ))
        ],
      ),
    );
  }

  Future<bool> onBackClicked() async {
    bool returnContext = true;
    await showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "이전 화면으로 돌아가시겠습니까 ?",
                ),
              ],
            ),
            actions: <Widget>[
              CupertinoButton(
                child: Text("확인"),
                onPressed: () {
                  //데이터 저장 후 넘기기
                  Get.back();
                  returnContext = true;
                },
              ),
              CupertinoButton(
                child: Text("취소"),
                onPressed: () {
                  Get.back();
                  returnContext = false;
                },
              ),
            ],
          );
        });
    if (returnContext)
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: WillPopScope(
        onWillPop: onBackClicked,
        child: Scaffold(
          appBar: DamoAppBar().sellerAppBar(context),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: ListView(
              children: <Widget>[
                imageProfile(),
                SizedBox(height: 20),
                TextFormField(
                  enableSuggestions: false,
                  controller: sellerNameController,
                  maxLength: 20,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                        width: 2,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.blueAccent,
                    ),
                    labelText: '업체명(10자 이내)',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: sellerMainController,
                  maxLength: 50,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                  ],
                  maxLines: 4,
                  maxLengthEnforcement:
                      MaxLengthEnforcement.truncateAfterCompositionEnds,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                        width: 2,
                      ),
                    ),
                    prefixIcon: Icon(
                      CupertinoIcons.doc_plaintext,
                      color: Colors.blueAccent,
                    ),
                    labelText: '업체 설명(50자 이내)',
                  ),
                ),
                CupertinoButton(
                  child: Text(
                    '상품 사진 수정하기',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    takeMultiImage(context);
                  },
                ),
                /*Container(
                  padding: EdgeInsets.all(30),
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      // for (int i = 0; i < resultImages.length; i++)
                      //   Image.file(
                      //     File(
                      //       resultImages[i].path,
                      //     ),
                      //     width: MediaQuery.of(context).size.width / 2,
                      //     height: MediaQuery.of(context).size.height / 2,
                      //   ),
                    ],
                  ),
                ),*/
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Theme.of(context).accentColor),
                        onPressed: () {},
                        child: Text(
                          '수정 완료',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
