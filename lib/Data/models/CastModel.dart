import 'package:movie_app/Domain/entities/CastEntity.dart';
  import 'dart:convert';

  class MovieCastModel  {
  int id;
  List<Cast> cast;
  List<Cast> crew;
  MovieCastModel({
  required this.id,
  required this.cast,
  required this.crew,
  });
  factory MovieCastModel.fromRawJson(String str) => MovieCastModel.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());
  factory MovieCastModel.fromJson(Map<String, dynamic> json) => MovieCastModel(
  id: json["id"],
  cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
  crew: List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
  "id": id,
  "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
  "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
  };
  }

  class Cast extends CastEntity {
  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String? profilePath;
  int? castId;
  String character;
  String creditId;
  int? order;
  String? department;
  String? job;

  Cast({
  required this.adult,
  required this.gender,
  required this.id,
  required this.knownForDepartment,
  required this.name,
  required this.originalName,
  required this.popularity,
  required this.profilePath,
  this.castId,
  required this.character,
  required this.creditId,
  this.order,
  this.department,
  this.job,
  }): super(
  id: id,
  name: name,
  profilePath: profilePath ,
    character: character
  );
  factory Cast.fromRawJson(String str) => Cast.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
  adult: json["adult"],
  gender: json["gender"],
  id: json["id"],
  knownForDepartment: json["known_for_department"],
  name: json["name"],
  originalName: json["original_name"],
  popularity: json["popularity"]?.toDouble(),
  profilePath: json["profile_path"]??"",
  castId: json["cast_id"],
  character: json["character"]??"",
  creditId: json["credit_id"],
  order: json["order"],
  department: json["department"],
  job: json["job"],
  );

  Map<String, dynamic> toJson() => {
  "adult": adult,
  "gender": gender,
  "id": id,
  "known_for_department": knownForDepartment,
  "name": name,
  "original_name": originalName,
  "popularity": popularity,
  "profile_path": profilePath,
  "cast_id": castId,
  "character": character,
  "credit_id": creditId,
  "order": order,
  "department": department,
  "job": job,
  };
  }
