import 'package:dartz/dartz.dart';
import 'package:movie_app/Domain/entities/movie.dart';
import 'package:movie_app/Domain/repositories/Movierepo.dart';
import 'package:movie_app/Domain/repositories/apperror.dart';
import 'package:movie_app/Domain/usecases/noparams.dart';
import 'package:movie_app/Domain/usecases/usecase.dart';

class GetPlayingNow extends UseCase<List<MovieEntity>,NoParams>{
  final MovieRepo movieRepo;
  GetPlayingNow(this.movieRepo);
  @override
  Future<Either<AppError,List<MovieEntity>>> call(NoParams params) async{
    return await movieRepo.getPlayingNow();
  }
}