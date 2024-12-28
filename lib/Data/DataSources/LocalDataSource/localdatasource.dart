import 'package:hive/hive.dart';
import 'package:movie_app/Data/Table/MovieTable.dart';
import 'package:movie_app/Domain/entities/movie.dart';
abstract class LocaleDataSource{
  Future<void>saveData(MovieTable movie);

  Future<List<MovieEntity>>getData();

  Future<void>deleteData(int movieId);
  Future<bool>checkData(int movieId);
}
class LocalDataSourceImpl implements LocaleDataSource{

  @override
  Future<bool> checkData(int movieId) async{

    final movieBox=await Hive.openBox<MovieTable>('moviebox');

    return  movieBox.containsKey(movieId);

  }

  @override
  Future<void> deleteData(int movieId) async{

    final movieBox=await Hive.openBox<MovieTable>("moviebox");

    await movieBox.delete(movieId);

  }
  @override
  Future<List<MovieEntity>> getData() async{

  final movieBox=await Hive.openBox<MovieTable>('moviebox');

final movieIds =movieBox.keys.toList();

List<MovieEntity> movies=[];

  for(int id in movieIds){
    movies.add(movieBox.get(id)!);
  }

  return movies;

  }

  @override
  Future<void> saveData(MovieTable movie)async {

    final movieBox=await Hive.openBox<MovieTable>('moviebox');

   await movieBox.put(movie.id, movie);
  }
}