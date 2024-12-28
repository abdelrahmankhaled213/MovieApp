import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Data/Table/MovieTable.dart';
import 'package:movie_app/Data/dI/getit.dart';
import 'package:path_provider/path_provider.dart'as path_provider;
import 'package:movie_app/MovieApp.dart';
import 'package:hive/hive.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
   init();

   final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();

Hive.init(appDocumentDirectory.path);

  Hive
    .registerAdapter(MovieTableAdapter());

   SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
     DeviceOrientation.portraitDown
   ]);
  Bloc.observer=  MyBlocObserver();
  runApp( const MovieApp()
  );
}
class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {

    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {

    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}
class MovieTableAdapter extends TypeAdapter<MovieTable> {
  @override
  final typeId = 0;
  @override
  MovieTable read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieTable(
      id: fields[0] as int,
      title: fields[1] as String,
      posterPath:fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieTable obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)..
      writeByte(2)
      ..write(obj.posterPath);
  }
}