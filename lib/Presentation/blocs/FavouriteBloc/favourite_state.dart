import 'package:equatable/equatable.dart';
import 'package:movie_app/Domain/entities/movie.dart';
import 'package:movie_app/Domain/repositories/apperror.dart';
abstract class FavouriteState extends Equatable{
  @override
  List<Object> get props => [];
}
class FavouriteInitial extends FavouriteState {}
class FavouriteMovieSuccessState extends FavouriteState{
  List<MovieEntity>movieEntityList;
  FavouriteMovieSuccessState({
    required this.movieEntityList
});
  @override
  // TODO: implement props
  List<Object> get props => [movieEntityList];
}
class FavouriteMovieErrorState extends FavouriteState{
 final AppErrorType appErrorType;
  FavouriteMovieErrorState({
  required this.appErrorType
  });
  @override
  // TODO: implement props
  List<Object> get props => [appErrorType];
}
class IsFavState extends FavouriteState{
  final bool isFav;
  IsFavState({
   required this.isFav
});
  @override
  // TODO: implement props
  List<Object> get props => [isFav];
}
class IsFavStateError extends FavouriteState{
  final AppErrorType type;
  IsFavStateError({
    required this. type
  });
  @override
  // TODO: implement props
  List<Object> get props => [type];
}