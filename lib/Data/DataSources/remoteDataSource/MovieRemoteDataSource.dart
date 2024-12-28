import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:movie_app/Core/api_constants.dart';
import 'package:movie_app/Data/models/CastModel.dart';
import 'package:movie_app/Data/models/MovieDetails.dart';
import 'package:movie_app/Data/models/MovieVideoModel.dart';
import 'package:movie_app/Data/models/Movieresult.dart';
abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getUpcoming();
  Future<List<MovieModel>> getPlayingNow();
  Future<MovieDetails> getMovieDetails(int id);
  Future<List<Cast>> getCastGroup(int id);
  Future<List<Trailer>>getTrailers(int id);
  Future<List<MovieModel>>getSearchedMovie(String query);
}
class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Client _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get
      (Uri.parse(ApiConstants.baseUrl +
        "trending/movie/day?api_key=${ApiConstants.apiKey}"),
        headers: {
          'Contetnt-Type': 'application/json'
        }

    );
    if (response.statusCode == 200) {
      final responsebody = json.decode(response.body);
      final movieresult = MovieResult
          .fromJson(responsebody)
          .results;
      return movieresult;
    }
    else {
      throw Exception(response.reasonPhrase);
    }
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get(
        Uri.parse("${ApiConstants.baseUrl}" +
            "movie/popular?api_key=${ApiConstants.apiKey}"));
    if (response.statusCode == 200) {
      final responsebody = json.decode(response.body);
      final movieresult = MovieResult
          .fromJson(responsebody)
          .results;
      return Future.value(movieresult);
    }
    else {
      throw Exception(response.reasonPhrase);
    }
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await
    _client.get(Uri.parse("${ApiConstants.baseUrl}" +
        "movie/now_playing?api_key=${ApiConstants.apiKey}"));
    if (response.statusCode == 200) {
      final responsebody = json.decode(response.body);
      final movieresult = MovieResult
          .fromJson(responsebody)
          .results;
      return Future.value(movieresult);
    }
    else {
      throw Exception(response.reasonPhrase);
    }
  }

  @override
  Future<List<MovieModel>> getUpcoming() async {
    final response = await _client.get
      (Uri.parse(
        ApiConstants.baseUrl + "movie/upcoming?api_key=${ApiConstants.apiKey}"),
        headers: {
          'Contetnt-Type': 'application/json'
        }

    );
    if (response.statusCode == 200) {
      final responsebody = json.decode(response.body);
      final movieresult = MovieResult
          .fromJson(responsebody)
          .results;
      return movieresult;
    }
    else {
      throw Exception(response.reasonPhrase);
    }
  }

  @override
  Future<MovieDetails> getMovieDetails(int id) async {
    final response = await
    _client.get(Uri.parse("${ApiConstants.baseUrl}" +
        "movie/$id?api_key=${ApiConstants.apiKey}"));
    if (response.statusCode == 200) {
      final responsebody = await json.decode(response.body);
      final movieDetail = MovieDetails.fromJson(responsebody);
      return movieDetail;
    }
    else {
      throw Exception(response.reasonPhrase);
    }
  }

  @override
  Future<List<Cast>> getCastGroup(int id) async {
    final response = await _client.get(
        Uri.parse("${ApiConstants.baseUrl}" + "movie"
            "/$id/credits?api_key=${ApiConstants.apiKey}"));
    if (response.statusCode == 200) {
      final responsebody = json.decode(response.body);
      print(responsebody['cast']);
      final movieCastModel = MovieCastModel.fromJson(responsebody);
      return movieCastModel.cast;
    }
    else {
      throw Exception(response.reasonPhrase);
    }
  }

  @override
  Future<List<Trailer>> getTrailers(int id) async {
    final response = await _client.get(Uri.parse(ApiConstants.baseUrl +
        "movie/$id/videos?api_key=${ApiConstants.apiKey}"));
    if (response.statusCode == 200) {
    final jsondata =  json.decode(response.body) ;
     print(jsondata['results']);
   final movievideomodel=MovieVideoModel.fromJson(jsondata);
   return movievideomodel.results;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  @override
  Future<List<MovieModel>> getSearchedMovie(String query) async{
   final response=await
   _client.get
     (Uri.parse(
       ApiConstants.baseUrl+"search/movie?api_key=${ApiConstants.apiKey}&query=$query"));

   if(response.statusCode==200){
     final jsondecode=json.decode(response.body);
     final filteredmovies= await MovieResult
         .fromJson(jsondecode)
         .results;
     print(jsondecode['results']);
     return filteredmovies;
   }
   else{
     throw Exception(response.statusCode);
   }
  }
}