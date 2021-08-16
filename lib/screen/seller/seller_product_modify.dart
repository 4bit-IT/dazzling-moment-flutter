import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class SellerProductModify extends StatefulWidget {
  @override
  _SellerProductModifyState createState() => _SellerProductModifyState();
}

class _SellerProductModifyState extends State<SellerProductModify> {
  ImagePicker _picker = ImagePicker(); // 카메라/갤러리에서 사진 가져올 때 사용함 (image_picker)
  XFile? file;
  HtmlEditorController controller = HtmlEditorController();
  String result = '';
  TextEditingController sellerNameController = TextEditingController();
  TextEditingController sellerMainController = TextEditingController();

  String? sellerName = '업체명';
  String? sellerMain = '업체 설명';
  Image? sellerImage = Image.asset('assets/images/logo.png');
  List? sellerDetail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sellerNameController = TextEditingController(text: sellerName);
    sellerMainController = TextEditingController(text: sellerMain);
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
                onPressed: pickImageFromGallery,
              ),
              SimpleDialogOption(
                child: Text('취소', style: TextStyle(color: Colors.redAccent)),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }

  pickImageFromGallery() async {
    Navigator.pop(context);
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
      maxHeight: 700,
    );
    setState(() {
      file = pickedFile;
    });
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
              radius: 80,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                child:  file == null
                    ? Image.asset('assets/images/logo.png')
                    : ClipRRect(
                  borderRadius: BorderRadius.circular(
                    79.0,
                  ),
                  child: Image.file(
                    File(file!.path),
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                ),
                radius: 79,
                backgroundColor: Colors.white,
              )),
          Positioned(
              bottom: 20,
              right: 20,
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(title: Text('업체 페이지')),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: ListView(
              children: <Widget>[
                imageProfile(),
                SizedBox(height: 20),
                TextFormField(
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
                    labelText: '업체명(20자 이내)',
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
                Container(
                  padding: EdgeInsets.all(40.0),
                  child: HtmlEditor(
                    controller: controller,
                    htmlEditorOptions: HtmlEditorOptions(
                      hint: 'Your text here...',
                    ),
                    htmlToolbarOptions: HtmlToolbarOptions(
                      toolbarPosition: ToolbarPosition.aboveEditor,
                      //by default
                      toolbarType: ToolbarType.nativeScrollable,
                      //by default
                      onButtonPressed: (ButtonType type, bool? status,
                          Function()? updateStatus) {
                        print(
                            "button '${describeEnum(type)}' pressed, the current selected status is $status");
                        return true;
                      },
                      onDropdownChanged: (DropdownType type, dynamic changed,
                          Function(dynamic)? updateSelectedItem) {
                        print(
                            "dropdown '${describeEnum(type)}' changed to $changed");
                        return true;
                      },
                      mediaLinkInsertInterceptor:
                          (String url, InsertFileType type) {
                        print(url);
                        return true;
                      },
                      mediaUploadInterceptor:
                          (PlatformFile file, InsertFileType type) async {
                        print(file.name); //filename
                        print(file.size); //size in bytes
                        print(file.extension); //file extension (eg jpeg or mp4)
                        return true;
                      },
                    ),
                    otherOptions: OtherOptions(height: 550),
                    callbacks: Callbacks(
                        onBeforeCommand: (String? currentHtml) {
                          print('html before change is $currentHtml');
                        }, onChangeContent: (String? changed) {
                      print('content changed to $changed');
                    }, onChangeCodeview: (String? changed) {
                      print('code changed to $changed');
                    }, onChangeSelection: (EditorSettings settings) {
                      print('parent element is ${settings.parentElement}');
                      print('font name is ${settings.fontName}');
                    }, onDialogShown: () {
                      print('dialog shown');
                    }, onEnter: () {
                      print('enter/return pressed');
                    }, onFocus: () {
                      print('editor focused');
                    }, onBlur: () {
                      print('editor unfocused');
                    }, onBlurCodeview: () {
                      print('codeview either focused or unfocused');
                    }, onInit: () {
                      print('init');
                    },
                        //this is commented because it overrides the default Summernote handlers
                        onImageLinkInsert: (String? url) {
                          print(url ?? "unknown url");
                        }, onImageUpload: (FileUpload file) async {
                      print(file.name);
                      print(file.size);
                      print(file.type);
                      print(file.base64);
                    }, onImageUploadError: (FileUpload? file, String? base64Str,
                        UploadError error) {
                      print(describeEnum(error));
                      print(base64Str ?? '');
                      if (file != null) {
                        print(file.name);
                        print(file.size);
                        print(file.type);
                      }
                    }, onKeyDown: (int? keyCode) {
                      print('$keyCode key downed');
                    }, onKeyUp: (int? keyCode) {
                      print('$keyCode key released');
                    }, onMouseDown: () {
                      print('mouse downed');
                    }, onMouseUp: () {
                      print('mouse released');
                    }, onPaste: () {
                      print('pasted into editor');
                    }, onScroll: () {
                      print('editor scrolled');
                    }),
                    plugins: [
                      SummernoteAtMention(
                          getSuggestionsMobile: (String value) {
                            var mentions = <String>['test1', 'test2', 'test3'];
                            return mentions
                                .where((element) => element.contains(value))
                                .toList();
                          },
                          mentionsWeb: ['test1', 'test2', 'test3'],
                          onSelect: (String value) {
                            print(value);
                          }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Theme.of(context).accentColor),
                        onPressed: () async {
                          var txt = await controller.getText();
                          print(txt);
                          if (txt.contains('src=\"data:')) {
                            txt =
                            '<text removed due to base-64 data, displaying the text could cause the app to crash>';
                          }
                          setState(() {
                            result = txt;
                          });
                        },
                        child: Text(
                          'Submit',
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
