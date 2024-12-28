import 'package:dartz/dartz.dart';
import 'package:movie_app/Domain/repositories/Movierepo.dart';
import 'package:movie_app/Domain/repositories/apperror.dart';
import 'package:movie_app/Domain/usecases/usecase.dart';
class CheckMovieFavourite implements UseCase<bool, int> {
  final MovieRepo movieRepo;
  CheckMovieFavourite(this.movieRepo);
  @override
  Future<Either<AppError, bool>> call(int params) async {
    return await movieRepo.checkData(params);
  }
}