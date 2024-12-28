import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Data/dI/getit.dart';
import 'package:movie_app/Domain/repositories/apperror.dart';
import 'package:movie_app/Presentation/blocs/CastBloc/cast_bloc.dart';
import 'package:movie_app/Presentation/blocs/FavouriteBloc/favourite_bloc.dart';
import 'package:movie_app/Presentation/blocs/MovieDetailsBloc/movie_details_bloc.dart';
import 'package:movie_app/Presentation/blocs/MovieDetailsBloc/movie_details_event.dart';
import 'package:movie_app/Presentation/blocs/MovieDetailsBloc/movie_details_state.dart';
import 'package:movie_app/Presentation/blocs/MovieVideoBloc/video_bloc.dart';
import 'package:movie_app/Presentation/widgets/BigPoster.dart';
import 'package:movie_app/Presentation/widgets/ErrorCarouselWidget.dart';

class MovieDetailsScreenView extends StatefulWidget {

  final int movieId;

  const MovieDetailsScreenView({ required this.movieId});

  @override
  State<MovieDetailsScreenView> createState() => _MovieDetailsScreenViewState();

}

class _MovieDetailsScreenViewState extends State<MovieDetailsScreenView> {

  MovieDetailsBloc? movieDetailsBloc;
  CastBloc? castBloc;
  VideoBloc? videoBloc;
  FavouriteBloc? favouriteBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieDetailsBloc =getitinstance<MovieDetailsBloc>();
    castBloc=movieDetailsBloc?.castBloc;
    videoBloc=movieDetailsBloc?.videoBloc;
    favouriteBloc=movieDetailsBloc?.favouriteBloc;
    if(!(movieDetailsBloc?.isClosed==true) ||!(videoBloc?.isClosed==true)
        ||!(castBloc?.isClosed==true)) {
      movieDetailsBloc!.add(GetMovieDetailsEvent(widget.movieId));
    }
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
   providers: [

     BlocProvider<MovieDetailsBloc>.value(
        value:
           movieDetailsBloc!,
      ),
     BlocProvider<CastBloc>.value(
       value: castBloc!,
     ),
     BlocProvider<VideoBloc>.value(
       value: videoBloc!,
     ),
     BlocProvider<FavouriteBloc>.value(
       value: favouriteBloc!,
     ),
    ],
      child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          return Scaffold(
            body: whichState(state),
          );
        }
    ),
    );
  }
  Widget whichState(MovieDetailsState state){

    if(state is  MovieDetailsLoading) {
      return const
      Center(child: CircularProgressIndicator()
        ,);

    }

    if(state is  MovieDetailsLoaded) {

      return BigPoster(
          movieDetails: state.movieDetails
      );

    }

    if(state is  MovieDetailsError) {

      return CarouselWidgetError(
        text: state.type == AppErrorType.server ? "server" : "check your internet connection",
      );
    }

    return const SizedBox.shrink();
  }
  @override
  void dispose() {
    super.dispose();
    movieDetailsBloc?.close();
    castBloc?.close();
    videoBloc?.close();
    favouriteBloc?.close();
  }
}