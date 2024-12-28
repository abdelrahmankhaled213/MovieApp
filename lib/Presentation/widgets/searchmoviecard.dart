import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Core/api_constants.dart';
import 'package:movie_app/Domain/entities/movie.dart';
import 'package:movie_app/Presentation/Themes/Size/sizeconstants.dart';
import 'package:movie_app/Presentation/Themes/color/appcolor.dart';
import 'package:movie_app/Presentation/journeys/MovieDetails/MovieDetailsScreenView.dart';

class SearchMovieCard extends StatelessWidget {

  final MovieEntity movie;

const SearchMovieCard({
  required this.movie,
  super.key,
});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 10.sp,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: SearchMovieCardContent(

        title: movie.title??"",
        description: movie.overview??"",
        image: movie.posterPath??"", moveId:  movie.id,
      ),
    );
  }
}
class SearchMovieCardContent extends StatelessWidget{
  final int moveId;
  final String title;
  final String image;
  final String description;
  SearchMovieCardContent({
    required this.moveId,
   required this.title,
    required this.description,
    required this.image,

  });
  @override
  Widget build(BuildContext context) {
    return Row(
children: [
  ClipRRect(borderRadius: BorderRadius.circular(15.r),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) {

            return MovieDetailsScreenView(movieId: moveId,);
          },
          )
          );
        },
        child: CachedNetworkImage(imageUrl: ApiConstants.imageBaseUrl
            +image,
          placeholder: (context, url) {
            return Image.asset("assets/png/Animation - 1720792156981 (1).gif");
          },height: Sizes.dimen_100.h,
        errorWidget: (context, url, error) {
            return Icon(Icons.error,color: AppColor.royalblue,size: 100.sp,);
        },
        ),
      )),
  SizedBox(
    width: Sizes.dimen_14.w,
  ),
  Expanded(
    child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(title,style: TextStyle(
        color: Colors.grey,fontSize: 8.sp
        ,fontWeight: FontWeight.w700
      ),),
      SizedBox(
        height: 10.h,
      ) ,
        Text(description,style:TextStyle(
          fontSize: 6.sp,
          color: Colors.grey,
          fontWeight: FontWeight.w300
        ),
        maxLines: 3,overflow: TextOverflow.ellipsis,)
      ],
    ),
  )
],
    );
  }


}