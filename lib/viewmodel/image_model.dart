import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageModel {
  CircleAvatar circleImage(var image) {
    return CircleAvatar(
      radius: 50.r,
      backgroundImage: image,
    );
  }

  CircleAvatar networkImage(String url) {
    return CircleAvatar(
        backgroundColor: Colors.white,
        radius: 50.r,
        backgroundImage: ExtendedImage.network(
          url,
          fit: BoxFit.fitHeight,
          cache: true,
          shape: BoxShape.circle,
        ).image);
  }
}
/*ExtendedImage.network(
        url,
        width: 100.w,
        height: 100.h,
        fit: BoxFit.fitHeight,
        cache: true,
        shape: BoxShape.circle,
      ),*/
