import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Presentation/Themes/Size/sizeconstants.dart';
import 'package:movie_app/Presentation/Themes/Styles/styles.dart';
import 'package:movie_app/Presentation/widgets/CustomElvatedButton.dart';


class CarouselWidgetError extends StatelessWidget {

  final String text;


 const CarouselWidgetError({
   required this.text,
    super.key,

});

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: Padding(

          padding:  EdgeInsets.symmetric(horizontal:8.w ),
           child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: ThemeText.whiteBodyText2?.copyWith(
                      fontSize: Sizes.dimen_16.sp
                    ),
                  )
              ),

              SizedBox(
                height: 12.h,
              ),

              CustomElevatedButton( text: "retry", onTap: () {

              }
              )
            ],
          ),
        ),
      ),
    );
  }
}
