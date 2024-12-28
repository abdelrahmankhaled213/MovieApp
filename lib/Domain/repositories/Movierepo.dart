import 'package:dartz/dartz.dart';
import 'package:movie_app/Domain/entities/CastEntity.dart';
import 'package:movie_app/Domain/entities/MovieDetails.dart';
import 'package:movie_app/Domain/entities/TrailersEntity.dart';
import 'package:movie_app/Domain/entities/movie.dart';
import 'package:movie_app/Domain/repositories/apperror.dart';
abstract class MovieRepo{

  Future<Either<AppError,List<MovieEntity>>> getTrending();
  Future<Either<AppError,List<MovieEntity>>> getPopular();
  Future<Either<AppError,List<MovieEntity>>> getUpcoming();
  Future<Either<AppError,List<MovieEntity>>> getPlayingNow();
  Future<Either<AppError,MovieDetailsEntity>> getMovieDetails(int id);
  Future<Either<AppError,List<CastEntity>>> getCastGroup(int id);
  Future<Either<AppError,List<TrailersEntity>>>getMovieTrailers(
      int id
      );
  Future<Either<AppError,List<MovieEntity>>>getSearchData(String query);
  Future<Either<AppError, bool>>checkData(int movieid);
  Future<Either<AppError, void>>deleteData(int movieid);
  Future<Either<AppError, void>>saveData(MovieEntity movies);
  Future<Either<AppError, List<MovieEntity>>> getData();
}