import 'package:dartz/dartz.dart';
import 'package:movie_app/Domain/repositories/apperror.dart';

abstract class UseCase<T,Params>{
  Future<Either<AppError, T>> call(Params params);
}