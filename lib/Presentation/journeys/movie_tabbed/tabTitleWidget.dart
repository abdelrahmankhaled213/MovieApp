import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Presentation/Themes/Size/sizeconstants.dart';
import 'package:movie_app/Presentation/Themes/color/appcolor.dart';
import 'package:movie_app/common/extension/size_extension.dart';

class TabTitleWidget extends StatelessWidget {
final String title;
final bool isSelected;
final Function() onTap;

const TabTitleWidget(
      {Key? key, required this.title
        , required this.isSelected
        , required this.onTap,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector( onTap:onTap,
        child: Container(
          margin:   EdgeInsets.symmetric(
            horizontal: Sizes.dimen_14.w
          ),
              decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: isSelected ?
            AppColor.royalblue : Colors.transparent,
            width: Sizes.dimen_1.h,
          ),
        ),
              ),
           child: Text(title.intelliTirm(),style: isSelected ?
           Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColor.royalblue,fontSize: 25.sp) : TextStyle(
             fontWeight: FontWeight.w500,
             color: Colors.white,
             fontSize: 15.sp
           ),)
              ,
            )
    );
  }
}
