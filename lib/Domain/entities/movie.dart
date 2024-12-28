import 'package:equatable/equatable.dart';
import 'package:movie_app/Domain/entities/MovieDetails.dart';
class MovieEntity extends Equatable {
  final int id;
  final String title;
   String? overview;
    String? backdropPath;
  final String? posterPath;
   num? voteAverage;
   String? releaseDate;
  MovieEntity({
    required this.id,
    required this.title,
     this.overview,
     this.backdropPath,
    required this.posterPath,
     this.voteAverage,
     this.releaseDate,

  }):assert(id != null,"Movie id cannot be null");

  @override
  // TODO: implement props
  List<Object?> get props => [id,title];

  @override
  bool get stringify => true;



factory MovieEntity.fromMovieDetails(MovieDetailsEntity movieDetails){
  return MovieEntity(
    posterPath: movieDetails.posterpath!,
      id: movieDetails.id,
    title: movieDetails.title,
  );
}
}