part of 'movie_tab_bloc.dart';

abstract class MovieTabState extends Equatable {
   int? currentTabIndex;
   MovieTabState({ this.currentTabIndex=0});
  @override
  List<Object> get props => [currentTabIndex!];
}
 class MovieTabInitial extends MovieTabState {
}
class MovieTabChangedState extends MovieTabState {
  final List<MovieEntity>movies;
  final int index;
MovieTabChangedState({
  required this.index ,required this.movies
}):super(currentTabIndex:index);
  @override
  List<Object> get props => [index,movies];
}
class MovieTabErrorState extends MovieTabState {
  MovieTabErrorState({required int index}):super(currentTabIndex:index);
}