import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField {
  ScrollController scrollController = ScrollController();

  TextFormField simpleTextField(
      TextEditingController controller,
      bool readOnly,
      TextInputType? textInputType,
      TextAlign textAlign,
      dynamic hintText,
      int maxLines,
      int minLines,
      dynamic onChanged(),
      List<TextInputFormatter> inputFormatters,
      String suffixText) {
    return TextFormField(
      keyboardType: textInputType,
      textAlign: textAlign,
      maxLines: maxLines,
      minLines: minLines,
      onChanged: (text) => onChanged(),
      inputFormatters: inputFormatters,
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
          suffixText: suffixText,
          suffixStyle: TextStyle(color: Color(0xff283137)),
          counterText: '',
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xffd1d1d6),
            fontFamily: 'NotoSansCJKKR',
            fontSize: 14.sp,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Color(0xfff93f5b)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Color(0xffd1d1d6)),
          ),
          contentPadding: EdgeInsets.fromLTRB(10.w, 20.h, 10.w, 20.h)),
      cursorColor: Colors.black,
    );
  }

  TextFormField focusTextField(
      TextEditingController controller,
      bool readOnly,
      TextInputType? textInputType,
      TextAlign textAlign,
      dynamic hintText,
      int maxLines,
      int minLines,
      dynamic onChanged(),
      List<TextInputFormatter> inputFormatters,
      String suffixText,
      FocusNode focusNode) {
    return TextFormField(
      focusNode: focusNode,
      keyboardType: textInputType,
      textAlign: textAlign,
      maxLines: maxLines,
      minLines: minLines,
      onChanged: (text) => onChanged(),
      inputFormatters: inputFormatters,
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
          suffixText: suffixText,
          suffixStyle: TextStyle(color: Color(0xff283137)),
          counterText: '',
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xffd1d1d6),
            fontFamily: 'NotoSansCJKKR',
            fontSize: 14.sp,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Color(0xfff93f5b)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Color(0xffd1d1d6)),
          ),
          contentPadding: EdgeInsets.fromLTRB(10.w, 20.h, 10.w, 20.h)),
      cursorColor: Colors.black,
    );
  }
}
