abstract class MovieDetailsEvent {}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;
  GetMovieDetailsEvent(this.id);
}

