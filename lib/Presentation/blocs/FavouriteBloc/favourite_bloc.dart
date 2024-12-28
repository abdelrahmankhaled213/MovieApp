import 'package:bloc/bloc.dart';
import 'package:movie_app/Domain/usecases/CheckMovieFavourite.dart';
import 'package:movie_app/Domain/usecases/DeleteFavouriteMovie.dart';
import 'package:movie_app/Domain/usecases/GetFavouriteMovie.dart';
import 'package:movie_app/Domain/usecases/SaveFavouriteMovie.dart';
import 'package:movie_app/Domain/usecases/noparams.dart';
import 'package:movie_app/Presentation/blocs/FavouriteBloc/favourite_event.dart';
import 'package:movie_app/Presentation/blocs/FavouriteBloc/favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {

  final GetFavouriteMovie getFavourite;
  final SaveFavouriteMovie saveFavourite;
  final CheckMovieFavourite checkMovie;
  final DeleteFavouriteMovie deleteFavourite;
  FavouriteBloc({
    required this.getFavourite,
  required this.saveFavourite,
  required this.checkMovie,
  required this.deleteFavourite
}) : super(FavouriteInitial()) {

    on<FavouriteEvent>((event, emit)async {




 if(event is ToggleFavouriteMovieEvent){

   await checkFav(event);

final response=await checkMovie(event.movieEntity.id);

response.fold((l) => emit(IsFavStateError(type: l.type)), (r) =>
    emit(IsFavState(isFav: r)));
 }

if(event is LoadFavouriteMovieEvent){

  final response=await getFavourite(NoParams());

  return response.fold((l) => emit(FavouriteMovieErrorState(appErrorType: l.type)),
          (r) => emit(FavouriteMovieSuccessState(movieEntityList: r)));
}
if(event is DeleteFavouriteMovieEvent){

 await deleteFavourite(event.movieid);

}
if(event is CheckIfFavouriteMovieEvent){

  final response=await checkMovie(event.movieId);
  response.fold((l) => emit(IsFavStateError(type: l.type))
      , (r) => emit(IsFavState(isFav: r)));
}
    }
    );
  }

  Future<void> checkFav(ToggleFavouriteMovieEvent event) async {

    if(event.isFav){

      await deleteFavourite(event.movieEntity.id);
    }
    else{
      await saveFavourite(event.movieEntity);
    }
  }
}
