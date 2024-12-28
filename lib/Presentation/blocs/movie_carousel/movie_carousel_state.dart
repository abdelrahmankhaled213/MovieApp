import 'package:equatable/equatable.dart';
import 'package:movie_app/Domain/entities/movie.dart';
import 'package:movie_app/Domain/repositories/apperror.dart';

abstract class MovieCarouselState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class MovieCarouselInitial extends MovieCarouselState{
}
class MovieCarouselLoadingState extends MovieCarouselState{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class MovieCarouselLoadedState extends MovieCarouselState{
  final List<MovieEntity>movies;
  final int defaultindex;
  MovieCarouselLoadedState({
    required this.movies,
     this.defaultindex=0,
  }):assert(
  defaultindex>=0,"default Index Cant be less than 0"
  );
}
class MovieCarouselErrorState extends MovieCarouselState{
  final AppErrorType type;

  MovieCarouselErrorState({required this.type});
@override
  // TODO: implement props
  List<Object?> get props => [
    type
];
}