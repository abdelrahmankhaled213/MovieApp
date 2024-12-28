import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Presentation/blocs/movie_BackDropPath/backdropbloc.dart';
import 'package:movie_app/Presentation/blocs/movie_BackDropPath/backdropstate.dart';

class MovieDataWidget extends StatelessWidget {

  const MovieDataWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MovieBackDropBloc,BackDropState>

      (builder:(context, state) {

      if(state is BackdropLoadedState){

        return Text(state.movie.title,textAlign: TextAlign.center,

            maxLines: 1,

          overflow: TextOverflow.ellipsis,

          style: TextStyle(

            fontWeight: FontWeight.w700,

            color: Colors.white,

            fontSize: 20.sp

          ),
        );
      }
      return const SizedBox.shrink();

      },

    );

  }
}
