import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Presentation/Themes/Size/sizeconstants.dart';
import 'package:movie_app/Presentation/Themes/color/appcolor.dart';
class MovieDividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
     height: Sizes.dimen_1.h,
     width: Sizes.dimen_80.w,
     padding: EdgeInsets.only(
       top: Sizes.dimen_2.h,
       bottom: Sizes.dimen_6.h
     ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.violet,
            AppColor.royalblue
          ]
        )
      ),
    );
  }
}
