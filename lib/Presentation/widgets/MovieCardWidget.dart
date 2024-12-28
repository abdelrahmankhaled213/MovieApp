import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Core/api_constants.dart';
import 'package:movie_app/Presentation/Themes/Size/sizeconstants.dart';
import 'package:movie_app/Presentation/journeys/MovieDetails/MovieDetailsScreenView.dart';
class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;
  final int index;

 const  MovieCardWidget({
   required this.movieId,
   required this.posterPath,
    required this.index,
   super.key,
});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MovieDetailsScreenView(
           movieId: movieId,
          );
        },));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
        child: CachedNetworkImage(imageUrl: ApiConstants.imageBaseUrl+posterPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
