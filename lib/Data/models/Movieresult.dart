import 'dart:convert';

import 'package:movie_app/Domain/entities/movie.dart';

class MovieResult {
  List<MovieModel> results;
  MovieResult({
    required this.results,
  });

  factory MovieResult.fromRawJson(String str) => MovieResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MovieResult.fromJson(Map<String, dynamic> json) => MovieResult(

    results: List<MovieModel>.from(json["results"].map((x) => MovieModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) =>  x.toJson())),

  };
}

class MovieModel extends MovieEntity {
  final String backdropPath;
  final int id;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final bool adult;
  final String title;
  final OriginalLanguage originalLanguage;
  final  List<int> genreIds;
  final num popularity;
  final String releaseDate;
  final bool video;
  final num voteAverage;
 final int voteCount;

  MovieModel({
    required this.backdropPath,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.adult,
    required this.title,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  }): super(
id: id,
    title: title,
    overview: overview,
    posterPath: posterPath,
    backdropPath: backdropPath,
    voteAverage: voteAverage,
releaseDate: releaseDate,
  );

  factory MovieModel.fromRawJson(String str) => MovieModel.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());
  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    backdropPath: json["backdrop_path"]??"",
    id: json["id"],
    originalTitle: json["original_title"]??"",
    overview: json["overview"]??'',
    posterPath: json["poster_path"]??"",
    adult: json["adult"],
    title: json["title"],
    originalLanguage: originalLanguageValues.map[json["original_language"]]
        ??OriginalLanguage.EN,
    genreIds: List<int>.from(json["genre_ids"].map((x) => x))??[],
    popularity: json["popularity"]?.toDouble(),
    releaseDate: json["release_date"]??"",
    video: json["video"]??"",
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"]??"",
  );

  Map<String, dynamic> toJson() => {
    "backdrop_path": backdropPath,
    "id": id,
    "original_title": originalTitle,
    "overview": overview,
    "poster_path": posterPath,
    "adult": adult,
    "title": title,
    "original_language": originalLanguageValues.reverse[originalLanguage],
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "popularity": popularity,
    "release_date": "${releaseDate}",
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };
}

enum MediaType {
  MOVIE
}

final mediaTypeValues = EnumValues({
  "movie": MediaType.MOVIE
});

enum OriginalLanguage {
  EN,
  FR,
  JA
}

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "fr": OriginalLanguage.FR,
  "ja": OriginalLanguage.JA
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
