import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app/Data/DataSources/LocalDataSource/localdatasource.dart';
import 'package:movie_app/Data/DataSources/remoteDataSource/MovieRemoteDataSource.dart';
import 'package:movie_app/Data/repositories/MovieRepoImp.dart';
import 'package:movie_app/Domain/repositories/Movierepo.dart';
import 'package:movie_app/Domain/usecases/CheckMovieFavourite.dart';
import 'package:movie_app/Domain/usecases/DeleteFavouriteMovie.dart';
import 'package:movie_app/Domain/usecases/GetCastGroup.dart';
import 'package:movie_app/Domain/usecases/GetFavouriteMovie.dart';
import 'package:movie_app/Domain/usecases/GetSearchData.dart';
import 'package:movie_app/Domain/usecases/GetTrailers.dart';
import 'package:movie_app/Domain/usecases/SaveFavouriteMovie.dart';
import 'package:movie_app/Domain/usecases/getComingSoon.dart';
import 'package:movie_app/Domain/usecases/getMovieDetails.dart';
import 'package:movie_app/Domain/usecases/getPlayingNow.dart';
import 'package:movie_app/Domain/usecases/getTrending.dart';
import 'package:movie_app/Domain/usecases/getpopular.dart';
import 'package:movie_app/Presentation/blocs/CastBloc/cast_bloc.dart';
import 'package:movie_app/Presentation/blocs/FavouriteBloc/favourite_bloc.dart';
import 'package:movie_app/Presentation/blocs/MovieDetailsBloc/movie_details_bloc.dart';
import 'package:movie_app/Presentation/blocs/MovieVideoBloc/video_bloc.dart';
import 'package:movie_app/Presentation/blocs/SearchBloc/search_bloc.dart';
import 'package:movie_app/Presentation/blocs/movie_BackDropPath/backdropbloc.dart';
final getitinstance=GetIt.instance;
Future init()async {
  getitinstance.registerFactory(() => VideoBloc(getVideo: getitinstance()));
  getitinstance.registerLazySingleton(() => GetTrailers(movieRepo: getitinstance()));
  getitinstance.registerLazySingleton<Client>(() => Client());
  getitinstance.registerLazySingleton<MovieRemoteDataSource>(() =>
      MovieRemoteDataSourceImpl(getitinstance()));
  getitinstance.registerLazySingleton<LocaleDataSource>(() =>LocalDataSourceImpl());
  getitinstance.registerLazySingleton<MovieRepo>(() =>
      MovieRepoImpl(localeDataSource: getitinstance(),movieRemoteDataSource: getitinstance()));
  getitinstance.registerLazySingleton<GetPlayingNow>(() =>
      GetPlayingNow(getitinstance()));
  getitinstance.registerLazySingleton<GetTrending>(() =>
      GetTrending(getitinstance()));
  getitinstance.registerLazySingleton<GetPopular>(() =>
      GetPopular(getitinstance()));
  getitinstance.registerLazySingleton<GetComingSoon>(() =>
      GetComingSoon(getitinstance()));
  getitinstance.registerLazySingleton<MovieBackDropBloc>(() => MovieBackDropBloc(

  ));
  getitinstance.registerLazySingleton<GetMovieDeatilsUseCase>(() =>
      GetMovieDeatilsUseCase(
      movieRepo: getitinstance()
  ));
  getitinstance.registerLazySingleton(() => GetCastGroupUseCase(movieRepo: getitinstance()));
  getitinstance.registerFactory(() => CastBloc(getCastGroup: getitinstance()));
  getitinstance.registerFactory(() => MovieDetailsBloc(
    favouriteBloc: getitinstance(),
  videoBloc: getitinstance(),instance:getitinstance() , castBloc: getitinstance()));
  getitinstance.registerFactory(() => SearchBloc(getSearchedData: getitinstance()));
  getitinstance.registerLazySingleton(() => GetSearchData(movieRepo: getitinstance()));
  getitinstance.registerLazySingleton(() => GetFavouriteMovie( getitinstance()));
  getitinstance.registerLazySingleton(() => SaveFavouriteMovie( repository: getitinstance()));
  getitinstance.registerLazySingleton(() => DeleteFavouriteMovie(getitinstance()));
  getitinstance.registerLazySingleton(() => CheckMovieFavourite(getitinstance()));
  getitinstance.registerFactory(() => FavouriteBloc(
    checkMovie: getitinstance(),
    deleteFavourite: getitinstance(),
    saveFavourite: getitinstance(),
    getFavourite: getitinstance(),

  ));
}