import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:movie_app/Data/DataSources/LocalDataSource/localdatasource.dart';
import 'package:movie_app/Data/DataSources/remoteDataSource/MovieRemoteDataSource.dart';
import 'package:movie_app/Data/Table/MovieTable.dart';
import 'package:movie_app/Domain/entities/CastEntity.dart';
import 'package:movie_app/Domain/entities/MovieDetails.dart';
import 'package:movie_app/Domain/entities/TrailersEntity.dart';
import 'package:movie_app/Domain/entities/movie.dart';
import 'package:movie_app/Domain/repositories/Movierepo.dart';
import 'package:movie_app/Domain/repositories/apperror.dart';

class MovieRepoImpl extends MovieRepo {
  final MovieRemoteDataSource movieRemoteDataSource;
  final LocaleDataSource localeDataSource;

  MovieRepoImpl(
      {required this.localeDataSource, required this.movieRemoteDataSource});

  @override
  Future<Either<AppError, List<MovieEntity>>> getTrending() async {
    try {
      final response = await movieRemoteDataSource.getTrending();
      return Right(response);
    } on SocketException {
      return const Left(
          AppError(AppErrorType.network)
      );
    }
    on Exception {
      return const Left(
          AppError(AppErrorType.server));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
    try {
      final response = await movieRemoteDataSource.getPlayingNow();
      return Right(response);
    } on SocketException {
      return const Left(
          AppError(AppErrorType.network)
      );
    }
    on Exception {
      return const Left(AppError(AppErrorType.server));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    try {
      final response = await movieRemoteDataSource.getPopular();
      return Right(response);
    } on SocketException {
      return const Left(
          AppError(AppErrorType.network)
      );
    }
    on Exception {
      return const Left(AppError(AppErrorType.server));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getUpcoming() async {
    try {
      final response = await movieRemoteDataSource.getUpcoming();
      return Right(response);
    } on SocketException {
      return const Left(
          AppError(AppErrorType.network)
      );
    }
    on Exception {
      return const Left(AppError(AppErrorType.server));
    }
  }

  @override
  Future<Either<AppError, MovieDetailsEntity>> getMovieDetails(int id) async {
    try {
      final moviedetail = await movieRemoteDataSource.getMovieDetails(id);
      return Right(moviedetail);
    } on SocketException {
      return const Left(
          AppError(AppErrorType.network)
      );
    }
    on Exception {
      return const Left(AppError(AppErrorType.server));
    }
  }

  @override
  Future<Either<AppError, List<CastEntity>>> getCastGroup(int id) async {
    try {
      final movieCast = await movieRemoteDataSource.getCastGroup(id);
      return Right(movieCast.cast<CastEntity>());
    } on SocketException {
      return const Left(
          AppError(AppErrorType.network)
      );
    }
    on Exception {
      return const Left(AppError(AppErrorType.server));
    }
  }

  @override
  Future<Either<AppError, List<TrailersEntity>>> getMovieTrailers(
      int id) async {
    try {
      final movieTrailers = await movieRemoteDataSource.getTrailers(id);

      return Right(movieTrailers);

    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.server));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getSearchData(
      String query) async {

    try {


      final filteredData = await movieRemoteDataSource.getSearchedMovie(query);


      return Right(filteredData);

    }
    on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.server));
    }
  }

  @override
  Future<Either<AppError, bool>> checkData(int movieid) async{
    try {
      return Right(await localeDataSource.checkData(movieid));
    } on Exception {
      return const Left(AppError(AppErrorType.DataBase));
    }
  }

  @override
  Future<Either<AppError, void>> deleteData(int movieid) async{
  try {
    final response = await localeDataSource.deleteData(movieid);
    return Right(response);
  } on Exception {
    return const Left(AppError(AppErrorType.DataBase));
  }
  }



  @override
  Future<Either<AppError, void>> saveData(MovieEntity movies) async {
    final movie = MovieTable.fromMovieEntity(movies);
    try {
      return Right(await localeDataSource.saveData(movie));
    } on Exception {
      return const Left(AppError(AppErrorType.DataBase));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getData() async{

    try {
      final movieData = await localeDataSource.getData();
      return Right(movieData);
    }
    on Exception {
      return const Left(AppError(AppErrorType.DataBase));
    }
  }
}
