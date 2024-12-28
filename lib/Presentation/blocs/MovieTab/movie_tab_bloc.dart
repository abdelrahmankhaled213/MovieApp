import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/Domain/entities/movie.dart';
import 'package:movie_app/Domain/repositories/apperror.dart';
import 'package:movie_app/Domain/usecases/getComingSoon.dart';
import 'package:movie_app/Domain/usecases/getPlayingNow.dart';
import 'package:movie_app/Domain/usecases/getpopular.dart';
import 'package:movie_app/Domain/usecases/noparams.dart';
part 'movie_tab_event.dart';
part 'movie_tab_state.dart';

class MovieTabBloc extends Bloc<MovieTabEvent, MovieTabState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;
  MovieTabBloc({
    required this.getPopular,
    required this.getComingSoon,
    required this.getPlayingNow
}) : super(MovieTabInitial()) {
    on<MovieTabEvent>((event, emit) async{
      if(event is MovieTabChanged){
        Either<AppError,List<MovieEntity>>? moviesEither;
        switch(event.index){
          case 0:{
            moviesEither=await getPopular(NoParams());
            break;
          }
          case 1:{
            moviesEither=await getPlayingNow(NoParams());
            break;
          }
          case 2:{
            moviesEither=await getComingSoon(NoParams());
            break;
          }
        }
   return moviesEither!.fold((error) => emit(MovieTabErrorState(index: event.index)),
           (movie) => emit(MovieTabChangedState(
           index: event. index , movies: movie)));
      }
    });
  }
}
