import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Presentation/Themes/Size/sizeconstants.dart';
import 'package:movie_app/Presentation/Themes/color/appcolor.dart';
import 'package:movie_app/Presentation/widgets/CustomElvatedButton.dart';

class CustomDialog extends StatelessWidget {

  final String text;
  final String description;

  const CustomDialog({
    super.key,
   required this.text,
    required this.description
});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.vulcan,
      elevation: Sizes.dimen_32.sp,
      insetPadding: EdgeInsets.all(Sizes.dimen_32.sp),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.dimen_8.sp),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
       Text(text,
         textAlign: TextAlign.center,style: TextStyle(
         fontWeight: FontWeight.w400,
         fontSize: Sizes.dimen_8.sp,
       ),
       ),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: Sizes.dimen_8.h),
            child: SizedBox(
              height: Sizes.dimen_64.h,
              child: Image.asset("assets/png/tmdb_logo.png")
            ),
          ),
          Text(description,style:  TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: Sizes.dimen_16.sp,


          ),),
          SizedBox(
            height: Sizes.dimen_8.h,
          ),

    CustomElevatedButton(text: "okay",onTap: (){
      Navigator.pop(context);
    },)

        ],
      ),
    );
  }
}
