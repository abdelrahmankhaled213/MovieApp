import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Domain/entities/movie.dart';
import 'package:movie_app/Presentation/Themes/Size/sizeconstants.dart';
import 'package:movie_app/Presentation/blocs/movie_BackDropPath/backdropbloc.dart';
import 'package:movie_app/Presentation/blocs/movie_BackDropPath/backdropevent.dart';
import 'package:movie_app/Presentation/widgets/AnimatedMoviecard.dart';

class MoviePageView extends StatefulWidget {

  final int defaultIndex;
  final List<MovieEntity>getTrending;

 const MoviePageView({
    required this.defaultIndex,
    required this.getTrending,
  super.key
  }):assert(defaultIndex>=0,"initial page cant be less than 0");

  @override
  State<MoviePageView> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {

  late PageController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=PageController(
        initialPage: widget.defaultIndex,
        keepPage: false,
        viewportFraction: 0.7
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height* 0.3,
        margin: EdgeInsets.symmetric(
            vertical: Sizes.dimen_10.h,
        ),
        child: PageView.builder(controller: controller,itemBuilder: (context, index) {
          return AnimatedMovieCard(
            index: index,
            pageController: controller,
            movieId: widget.getTrending[index].id,
            posterPath: widget.getTrending[index].posterPath!,
          );
        },
          pageSnapping: true,
          itemCount: widget.getTrending.length??0,
          onPageChanged: (i){
            context.read<MovieBackDropBloc>().
            add(MovieBackDropChangedEvent(movieEntity: widget.getTrending[i]));
          },
        )

    );
  }


}