import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Presentation/Themes/Size/sizeconstants.dart';
import 'package:movie_app/Presentation/widgets/MovieCardWidget.dart';
class AnimatedMovieCard extends StatefulWidget {
  final int index;
  final int movieId;
  final String posterPath;
   final PageController pageController;

  const AnimatedMovieCard({
    required this.index,
    required this.movieId,
    required this.posterPath,
    required this.pageController,
    super.key
});

  @override
  State<AnimatedMovieCard> createState() => _AnimatedMovieCardState();
}

class _AnimatedMovieCardState extends State<AnimatedMovieCard> {

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.pageController

        ,builder: (context, child)
    {
      double value = 1;
      if (widget.pageController.position.haveDimensions)
      {
        value = widget.pageController.page! - widget.index;
        value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
        return Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: Curves.easeIn.transform(value) * MediaQuery
                .of(context)
                .size
                .height * 0.35,
            width: Sizes.dimen_230.w,
            child: child,
          ),
        );
      }
    else{
      return Align(
        alignment: Alignment.topCenter,
        child: Container(

          height: Curves.easeIn.transform

            (widget.index==0?value:value*0.5)*MediaQuery.of(context).size.height*0.35,
          width:Sizes.dimen_230.w,
          child: child,
        ),
      );
      }
    },
    child: MovieCardWidget(index: widget.index,movieId: widget.movieId, posterPath:widget.posterPath ));
  }
}
