import 'package:equatable/equatable.dart';
import 'package:movie_app/Domain/entities/movie.dart';

abstract class BackDropEvent extends Equatable {

}

class MovieBackDropChangedEvent extends BackDropEvent {
  final MovieEntity movieEntity;
  MovieBackDropChangedEvent({required this.movieEntity});

  @override
  // TODO: implement props
  List<Object?> get props => [movieEntity];
}
