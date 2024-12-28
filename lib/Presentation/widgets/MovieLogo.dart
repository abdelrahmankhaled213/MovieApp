import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieLogo extends StatelessWidget {
final double height;
 MovieLogo({required this.height}):assert(
height!=null,'height must not be null',

);
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/png/logo.png",
      color: Colors.white,
      height: height.h,
        );
  }
}
