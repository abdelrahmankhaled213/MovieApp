import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Core/api_constants.dart';
import 'package:movie_app/Domain/entities/CastEntity.dart';
import 'package:movie_app/Presentation/Themes/Size/sizeconstants.dart';
import 'package:movie_app/Presentation/Themes/color/appcolor.dart';

class CastWidget extends StatelessWidget {
  final CastEntity cast;
  const CastWidget({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0.sp),
      child: Stack(
        children: [
          Container(
            width: 100.w,
            height: 150.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0.r),
            ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: CachedNetworkImage(

                  imageUrl: ApiConstants.imageBaseUrl + cast.profilePath!,
                  errorWidget: (context, url, error) {
                  return const Icon(
                    Icons.error,size: Sizes.dimen_150,
                    color: AppColor.royalblue,

                  );
                },
                placeholder: (context, url) {
                  return Image.asset( "assets/png/Animation - 1720792156981 (1).gif"
                    ,fit: BoxFit.cover,height: Sizes.dimen_100.h,);
                },),
              )
          ),
          Positioned (
            bottom: 0,
            child: Container(
                height: 30.h,
                decoration: const
                BoxDecoration(
                  color: Colors.black45,
                ),
                width: 100.w,

                child: Center(child: Align(alignment: Alignment.center,
                    child: Text(cast.name,style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.white
                    ),)))),
          ),
        ],
      ),
    );
  }
}
