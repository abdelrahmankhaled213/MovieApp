

import 'package:movie_app/Domain/entities/MovieDetails.dart';
import 'package:movie_app/Domain/repositories/apperror.dart';

abstract class MovieDetailsState {}

 class MovieDetailsInitial extends MovieDetailsState {}
class MovieDetailsLoading extends MovieDetailsState {}
class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetailsEntity movieDetails;
  MovieDetailsLoaded(this.movieDetails);
}
class MovieDetailsError extends MovieDetailsState {
  final AppErrorType type;
  MovieDetailsError(this.type);
}
