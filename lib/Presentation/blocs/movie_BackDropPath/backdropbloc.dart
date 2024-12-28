import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Presentation/blocs/movie_BackDropPath/backdropevent.dart';
import 'package:movie_app/Presentation/blocs/movie_BackDropPath/backdropstate.dart';

class MovieBackDropBloc extends Bloc<BackDropEvent, BackDropState> {
MovieBackDropBloc() : super(BackdropInitial()){

  on<MovieBackDropChangedEvent>((event, emit) async{
    if(event.movieEntity!=null){
      emit(BackdropLoadedState(event.movieEntity));
    }

  } );
}

}