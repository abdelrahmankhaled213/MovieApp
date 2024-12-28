import 'package:equatable/equatable.dart';
import 'package:movie_app/Domain/entities/movie.dart';

abstract class BackDropState extends Equatable{}
class BackdropInitial extends BackDropState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class BackdropLoadedState extends BackDropState{
  final MovieEntity movie;
  BackdropLoadedState(this.movie);
  @override
  // TODO: implement props
  List<Object?> get props => [movie];
}