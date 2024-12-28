import 'package:dartz/dartz.dart';
import 'package:movie_app/Domain/entities/movie.dart';
import 'package:movie_app/Domain/repositories/Movierepo.dart';
import 'package:movie_app/Domain/repositories/apperror.dart';
import 'package:movie_app/Domain/usecases/usecase.dart';

class SaveFavouriteMovie extends UseCase<void,MovieEntity>{
  final MovieRepo repository;
  SaveFavouriteMovie({required this.repository});
  @override
  Future<Either<AppError, void>> call(MovieEntity movie) async{
    return await repository.saveData(movie);
  }
}