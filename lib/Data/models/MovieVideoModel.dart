import 'dart:convert';
import 'package:movie_app/Domain/entities/TrailersEntity.dart';

class MovieVideoModel {
  int id;
  List<Trailer> results;

  MovieVideoModel({
    required this.id,
    required this.results,
  });

  factory MovieVideoModel.fromRawJson(String str)
  => MovieVideoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MovieVideoModel.fromJson(Map<String, dynamic> json) => MovieVideoModel(
    id: json["id"],
    results: List<Trailer>.from(json["results"].map((x) => Trailer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Trailer  extends TrailersEntity{
  String iso6391;
  String iso31661;
  String name;
  String key;
  String site;
  int size;
  String type;
  bool official;
  DateTime publishedAt;
  String id;

  Trailer({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  }):super(
title: name,
    type: type,
    key: key!
  );

  factory Trailer.fromRawJson(String str) => Trailer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Trailer.fromJson(Map<String, dynamic> json) => Trailer(
    iso6391: json["iso_639_1"],
    iso31661: json["iso_3166_1"],
    name: json["name"]??"",
    key: json["key"]??"",
    site: json["site"]??"",
    size: json["size"]??"",
    type: json["type"]??"",
    official: json["official"],
    publishedAt: DateTime.parse(json["published_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "iso_639_1": iso6391,
    "iso_3166_1": iso31661,
    "name": name,
    "key": key,
    "site": site,
    "size": size,
    "type": type,
    "official": official,
    "published_at": publishedAt.toIso8601String(),
    "id": id,
  };
}
