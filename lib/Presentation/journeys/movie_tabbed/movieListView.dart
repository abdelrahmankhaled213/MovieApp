import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Domain/entities/movie.dart';
import 'package:movie_app/Presentation/Themes/Size/sizeconstants.dart';
import 'package:movie_app/Presentation/journeys/MovieDetails/MovieDetailsScreenView.dart';
import 'package:movie_app/Presentation/journeys/movie_tabbed/MovieCardWidget.dart';

class MovieListViewWidget extends StatelessWidget {

  final List<MovieEntity>movieList;

  const MovieListViewWidget({required this.movieList,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Sizes.dimen_6.h
      ),
      child: SizedBox(
        child: ListView.separated(
            itemBuilder: (context,index){
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MovieDetailsScreenView(movieId:  movieList[index].id);
              },
              )
              );
            },
            child: MovieTabCardWidget(
              movieid: movieList[index].id,
              title: movieList[index].title,
              posterPath: movieList[index].posterPath!,
            ),
          );
        },
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
        itemCount: movieList.length,
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: Sizes.dimen_14.w,)
        ),
      ),
    );
  }
}
