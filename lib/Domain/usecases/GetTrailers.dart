import 'package:dartz/dartz.dart';
import 'package:movie_app/Domain/entities/MovieParams.dart';
import 'package:movie_app/Domain/entities/TrailersEntity.dart';
import 'package:movie_app/Domain/repositories/Movierepo.dart';
import 'package:movie_app/Domain/repositories/apperror.dart';
import 'package:movie_app/Domain/usecases/usecase.dart';

class GetTrailers implements UseCase<List<TrailersEntity>,MovieParams>{
  final MovieRepo movieRepo;
  GetTrailers({
   required this.movieRepo
});

  @override
  Future<Either<AppError, List<TrailersEntity>>> call(MovieParams params) async{
 return await movieRepo.getMovieTrailers(params.id);
  }
  }

