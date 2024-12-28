import 'package:hive/hive.dart';
import 'package:movie_app/Domain/entities/movie.dart';
@HiveType(typeId: 0)
class MovieTable extends MovieEntity {

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String posterPath;

  MovieTable({
    required this.id,
    required this.title, required this.posterPath
  }) : super(id: id, title: title, posterPath: posterPath);

  factory MovieTable.fromMovieEntity(MovieEntity movieEntity){
    return MovieTable(
        id: movieEntity.id,
        title: movieEntity.title,
        posterPath: movieEntity.posterPath!
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'posterPath': posterPath
    };
  }
}