import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Core/api_constants.dart';
import 'package:movie_app/Presentation/Themes/Size/sizeconstants.dart';
import 'package:movie_app/Presentation/blocs/movie_BackDropPath/backdropbloc.dart';
import 'package:movie_app/Presentation/blocs/movie_BackDropPath/backdropstate.dart';
class MovieBackDropPathWidget extends StatelessWidget {

  const MovieBackDropPathWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return FractionallySizedBox(
      alignment: Alignment.topCenter,
      heightFactor: 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(Sizes.dimen_40.w)),
        child: Stack(
          children: [
         FractionallySizedBox(
            heightFactor: 1,
            widthFactor: 1,
            child: BlocBuilder<MovieBackDropBloc, BackDropState>(
                builder: (context, state) {
              if(state is BackdropLoadedState){
                return CachedNetworkImage(imageUrl:
                ApiConstants.imageBaseUrl+state.movie.backdropPath!,
                              fit: BoxFit.fitHeight,
                );
              }
              return const SizedBox.shrink();

            }),
          ),
            BackdropFilter(filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0)
              ,
              child: Container(
               width: double.infinity,
                height: 1,
                color: Colors.transparent,
              ),)
        ]    ),
      ),
    );
  }
}
