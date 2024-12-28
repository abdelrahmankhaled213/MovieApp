import 'package:dartz/dartz.dart';
import 'package:movie_app/Domain/repositories/Movierepo.dart';
import 'package:movie_app/Domain/repositories/apperror.dart';
import 'package:movie_app/Domain/usecases/usecase.dart';

class DeleteFavouriteMovie implements UseCase<void, int> {
  final MovieRepo movieRepo;
  DeleteFavouriteMovie(this.movieRepo);
  @override
  Future<Either<AppError, void>> call(int movieid) async {
    return await movieRepo.deleteData(movieid);
  }

}