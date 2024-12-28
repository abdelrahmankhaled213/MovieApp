import 'package:dartz/dartz.dart';
import 'package:movie_app/Domain/entities/CastEntity.dart';
import 'package:movie_app/Domain/entities/MovieParams.dart';
import 'package:movie_app/Domain/repositories/Movierepo.dart';
import 'package:movie_app/Domain/repositories/apperror.dart';
import 'package:movie_app/Domain/usecases/usecase.dart';

class GetCastGroupUseCase extends UseCase<List<CastEntity>,MovieParams>{
  final MovieRepo movieRepo;
  GetCastGroupUseCase({required this.movieRepo});
  @override
  Future<Either<AppError, List<CastEntity>>> call(MovieParams params) async{
    return await movieRepo.getCastGroup(params.id);
  }
}