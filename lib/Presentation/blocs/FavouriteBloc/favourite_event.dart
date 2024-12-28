import 'package:equatable/equatable.dart';
import 'package:movie_app/Domain/entities/movie.dart';

abstract class FavouriteEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class LoadFavouriteMovieEvent extends FavouriteEvent{

}

class DeleteFavouriteMovieEvent extends FavouriteEvent{

  final int movieid;
  DeleteFavouriteMovieEvent({
   required this.movieid
});
  @override
  // TODO: implement props
  List<Object?> get props => [movieid];
}

class ToggleFavouriteMovieEvent extends FavouriteEvent{
  final MovieEntity movieEntity;
  final bool isFav;
  ToggleFavouriteMovieEvent({
   required this.movieEntity,
   required this.isFav
});
  @override
  // TODO: implement props
  List<Object?> get props => [movieEntity,isFav];
}
class CheckIfFavouriteMovieEvent extends FavouriteEvent{
  final int movieId;
  CheckIfFavouriteMovieEvent({
   required this.movieId
});
  @override
  // TODO: implement props
  List<Object?> get props => [movieId];

}