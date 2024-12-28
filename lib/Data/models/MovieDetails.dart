import 'package:movie_app/Data/models/MovieDetails.dart';
import 'package:movie_app/Domain/entities/MovieDetails.dart';
import 'package:movie_app/Domain/entities/movie.dart';
class MovieDetails extends MovieDetailsEntity {
  final bool adult;
  final String backdropPath;
   BelongsToCollection? belongsToCollection;
  final int budget;
  final List<Genre>?genres;
  final String homepage;
  final int id;
  final String? imdbId;
  final List<String>? originCountry;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
   String? posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final num voteAverage;
  final int voteCount;

  MovieDetails({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  }) :super(
   id: id,
    title: title,
    posterpath: posterPath!,
    backdropPath:  backdropPath,
    releaseDate: releaseDate,
    OverView: overview,
    voteaverage: voteAverage,
  );
  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(adult: json['adult'] as bool
        , backdropPath: json['backdrop_path'] ??""
        , belongsToCollection: json['belongs_to_collection'] != null
            ? BelongsToCollection.fromJson(json['belongs_to_collection']) : null
        , budget: json['budget'] as int
        , genres: json['genres'] !=null?
        (json['genres'] as List).map((e) => Genre.fromJson(e)).toList():null
         , homepage: json['homepage'] as String
        , id: json['id'] as int
        , imdbId: json['imdb_id']  ??""
        ,  originCountry: json['origin_country'] !=null? (json['origin_country'] as List).map((e) => e as String).toList():null
        , originalLanguage: json['original_language'] as String
        , originalTitle: json['original_title'] as String
        , overview: json['overview'] as String
        , popularity: json['popularity'] as double
        , posterPath: json['poster_path'] ??""
        , productionCompanies: (json['production_companies'] as List).map((e) => ProductionCompany.fromJson(e)).toList()
        , productionCountries: (json['production_countries'] as List).map((e) => ProductionCountry.
       fromJson (e)).toList(),
        releaseDate: json['release_date'] as String
        , revenue: json['revenue'] as int
        , runtime: json['runtime'] as int
        , spokenLanguages:
        (json['spoken_languages'] as List).map((e) => SpokenLanguage.fromJson(e)).toList()
        ,status: json['status'] as String
        , tagline: json['tagline'] as String
        , title: json['title'] as String
        , video:  json['video'] as bool
        , voteAverage: json['vote_average'] as num
        , voteCount: json['vote_count'] as int);
  }
}

class BelongsToCollection {
  final int id;
  final String name;
  final String posterPath;
  final String backdropPath;

  BelongsToCollection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });
 factory  BelongsToCollection.fromJson(Map<String, dynamic> json){
    return BelongsToCollection(
        id: json['id']
        , name: json['name']??"",
        posterPath: json['poster_path']??"",
        backdropPath: json['backdrop_path']??"");

  }

}

class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });
  factory Genre.fromJson(Map<String, dynamic> json){
    return Genre(
        id: json['id']
        , name: json['name']);
  }

}

class ProductionCompany {
  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });
  factory ProductionCompany.fromJson(Map<String, dynamic> json){
    return ProductionCompany(
      id: json['id'],
      logoPath: json['logo_path']??"",
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }

}

class ProductionCountry {
  final String iso31661;
  final String name;

  ProductionCountry({
    required this.iso31661,
    required this.name,
  });
 factory ProductionCountry.fromJson(Map<String, dynamic> json){
   return ProductionCountry(
       iso31661: json['iso_3166_1'],
       name: json['name']
   );
 }
}

class SpokenLanguage {
  final String englishName;
  final String iso6391;
  final String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });
  factory SpokenLanguage.fromJson(Map<String, dynamic> json){
    return SpokenLanguage(
        englishName :json['english_name'],
    iso6391 : json['iso_639_1'],
    name :json['name']
    );
  }

}
