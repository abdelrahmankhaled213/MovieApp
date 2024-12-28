import 'package:equatable/equatable.dart';
import 'package:movie_app/Domain/entities/movie.dart';
import 'package:movie_app/Domain/repositories/apperror.dart';
abstract class SearchState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
 class SearchInitial extends SearchState {}
class SearchLoading extends SearchState{
}
class SearchSuccess extends SearchState{
  List<MovieEntity>filtereddata;
  SearchSuccess({
   required this.filtereddata
});
  @override
  // TODO: implement props
  List<Object?> get props => [filtereddata];
}
class SearchError extends SearchState{
  final AppErrorType type;
  SearchError({
   required this.type
});
  @override
  // TODO: implement props
  List<Object?> get props => [type];
}
