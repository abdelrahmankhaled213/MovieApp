import 'package:dartz/dartz.dart';
import 'package:movie_app/Domain/entities/movie.dart';
import 'package:movie_app/Domain/repositories/Movierepo.dart';
import 'package:movie_app/Domain/repositories/apperror.dart';
import 'package:movie_app/Domain/usecases/noparams.dart';
import 'package:movie_app/Domain/usecases/usecase.dart';

class GetPopular extends UseCase<List<MovieEntity>,NoParams>{
  final MovieRepo movieRepo;
  GetPopular(this.movieRepo);
  Future<Either<AppError,List<MovieEntity>>> call(NoParams noParams) async{
    return await movieRepo.getUpcoming();
  }
}