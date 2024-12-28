import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/Domain/entities/movie.dart';
import 'package:movie_app/Domain/repositories/Movierepo.dart';
import 'package:movie_app/Domain/repositories/apperror.dart';
import 'package:movie_app/Domain/usecases/usecase.dart';

class GetSearchData extends UseCase<List<MovieEntity>,MovieSearchParams> {
  final MovieRepo movieRepo;
  GetSearchData({
    required this.movieRepo
  });

  @override
  Future<Either<AppError, List<MovieEntity>>> call(MovieSearchParams params) async{
    return await movieRepo.getSearchData(params.query);
  }
}
class MovieSearchParams extends Equatable {
  final String query;
  MovieSearchParams({
   required this.query
});

  @override
  // TODO: implement props
  List<Object?> get props => [query];
}