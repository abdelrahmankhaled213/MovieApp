import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Domain/entities/movie.dart';
import 'package:movie_app/Presentation/widgets/Divider.dart';
import 'package:movie_app/Presentation/widgets/MovieAppBar.dart';
import 'package:movie_app/Presentation/widgets/MovieBackDropPathWidget.dart';
import 'package:movie_app/Presentation/widgets/MovieDataWidget.dart';
import 'package:movie_app/Presentation/widgets/MoviePageView.dart';

class MovieCarouselWidget extends StatelessWidget {

  final int defaultIndex;
final List<MovieEntity>getTrending;

const MovieCarouselWidget({
  required this.getTrending,
required this.defaultIndex,
  super.key
}):assert(
defaultIndex>=0,"default index cant be less than 0",
);
  @override
  Widget build(BuildContext context) {

    return Stack(

        fit: StackFit.expand,

        children: [


       const MovieBackDropPathWidget(),

       Column(
        children: [

          const MovieAppBar(),

          MoviePageView(

          getTrending: getTrending
            , defaultIndex: defaultIndex ,
          ),

SizedBox(height: 8.h,),

          const MovieDataWidget(),

          MovieDividerWidget()
        ],
      ),
   ] );
  }
}

