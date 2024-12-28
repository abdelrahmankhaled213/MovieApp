import 'package:dartz/dartz.dart';
import 'package:movie_app/Domain/entities/MovieDetails.dart';
import 'package:movie_app/Domain/entities/MovieParams.dart';
import 'package:movie_app/Domain/repositories/Movierepo.dart';
import 'package:movie_app/Domain/repositories/apperror.dart';
import 'package:movie_app/Domain/usecases/usecase.dart';

class GetMovieDeatilsUseCase extends UseCase<MovieDetailsEntity,MovieParams>{
  final MovieRepo movieRepo;
  GetMovieDeatilsUseCase({
   required this.movieRepo
});
  @override
  Future<Either<AppError, MovieDetailsEntity>> call(MovieParams params) async{
    return await movieRepo.getMovieDetails(params.id);
  }

}