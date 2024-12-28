import 'package:equatable/equatable.dart';

class MovieDetailsEntity extends Equatable{
  final int id;
  final String title;
  final String OverView;
  final String releaseDate;
  final num voteaverage;
  final String backdropPath;
  final String? posterpath;
  MovieDetailsEntity({
   required this.id,
   required this.title,
   required this.backdropPath,
   required this.OverView,
   required this.posterpath,
   required this.releaseDate,
   required this.voteaverage
});
  @override
  // TODO: implement props
  List<Object?> get props => [id];

}