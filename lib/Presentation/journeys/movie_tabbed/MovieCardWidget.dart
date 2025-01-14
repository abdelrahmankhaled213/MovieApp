import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Core/api_constants.dart';
import 'package:movie_app/Presentation/Themes/Size/sizeconstants.dart';
import 'package:movie_app/common/extension/size_extension.dart';

class MovieTabCardWidget extends StatelessWidget {

  final int movieId;
  final String title,
      posterPath;

 const  MovieTabCardWidget({
   required this.movieId
   ,required this.title
   ,required this.posterPath,
   super.key
 });

 @override
  Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
          child: ClipRRect(
        borderRadius: BorderRadius.circular(Sizes.dimen_16.sp),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: "${ApiConstants.imageBaseUrl}"+"$posterPath",

        ),
      )
      ),
      Padding(padding: EdgeInsets.only(top: 8.h)
          ,child: Text(title.intelliTirm(),
            style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400),))
    ],
  );
  }
}