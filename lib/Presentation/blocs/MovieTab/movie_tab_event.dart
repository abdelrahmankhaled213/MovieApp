part of 'movie_tab_bloc.dart';
 abstract class MovieTabEvent extends Equatable {
  const MovieTabEvent();
}
class MovieTabChanged extends MovieTabEvent{
  final int index;
  const MovieTabChanged({this.index=0});
  @override
  // TODO: implement props
  List<Object?> get props => [index];
}
