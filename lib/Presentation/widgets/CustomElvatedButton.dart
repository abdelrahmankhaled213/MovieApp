import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Presentation/Themes/Size/sizeconstants.dart';
import 'package:movie_app/Presentation/Themes/color/appcolor.dart';
class CustomElevatedButton extends StatelessWidget {

  final String text;
final  void Function() onTap;

const CustomElevatedButton({required this.onTap,required this.text,super.key});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap:onTap,

      child: Container(
        height: 40.h,
        width: 130.w,

        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_16.w,
          vertical: Sizes.dimen_8.h
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.dimen_24.sp),
          gradient: const LinearGradient(
            colors: [
           AppColor.royalblue,
              AppColor.violet
            ]
          )
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: Sizes.dimen_16.sp
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
