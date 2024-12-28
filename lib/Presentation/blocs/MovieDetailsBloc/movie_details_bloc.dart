import 'package:bloc/bloc.dart';
import 'package:movie_app/Domain/entities/MovieParams.dart';
import 'package:movie_app/Domain/usecases/getMovieDetails.dart';
import 'package:movie_app/Presentation/blocs/CastBloc/cast_bloc.dart';
import 'package:movie_app/Presentation/blocs/CastBloc/cast_event.dart';
import 'package:movie_app/Presentation/blocs/FavouriteBloc/favourite_bloc.dart';
import 'package:movie_app/Presentation/blocs/FavouriteBloc/favourite_event.dart';
import 'package:movie_app/Presentation/blocs/MovieDetailsBloc/movie_details_event.dart';
import 'package:movie_app/Presentation/blocs/MovieDetailsBloc/movie_details_state.dart';
import 'package:movie_app/Presentation/blocs/MovieVideoBloc/video_bloc.dart';
import 'package:movie_app/Presentation/blocs/MovieVideoBloc/video_event.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDeatilsUseCase instance;
  final CastBloc castBloc;
  final VideoBloc videoBloc;
  final FavouriteBloc favouriteBloc;

  MovieDetailsBloc({required this.favouriteBloc,required this.videoBloc,required this.instance,required this.castBloc}) : super(MovieDetailsInitial()) {
    on<GetMovieDetailsEvent>((event, emit) async {

      if (event is GetMovieDetailsEvent) {

        final result = await instance(
            MovieParams(id: event.id));
              result.fold(
                (l) => emit(MovieDetailsError(l.type)), (r) {
                  favouriteBloc.add(
                      CheckIfFavouriteMovieEvent(movieId: event.id)
                  );

          castBloc.add(GetCastEvent(event.id));
          videoBloc.add(GetVideoEvent(event.id));
          return emit(MovieDetailsLoaded(r));
        }
       );
      }

    }
    );
  }
}
