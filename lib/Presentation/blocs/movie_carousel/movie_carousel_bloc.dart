import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Data/dI/getit.dart';
import 'package:movie_app/Domain/usecases/getTrending.dart';
import 'package:movie_app/Domain/usecases/noparams.dart';
import 'package:movie_app/Presentation/blocs/movie_BackDropPath/backdropbloc.dart';
import 'package:movie_app/Presentation/blocs/movie_BackDropPath/backdropevent.dart';
import 'package:movie_app/Presentation/blocs/movie_carousel/movie_carousel_event.dart';
import 'package:movie_app/Presentation/blocs/movie_carousel/movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent,MovieCarouselState>{
final GetTrending getTrending;
final MovieBackDropBloc movieBackDropBloc=getitinstance<MovieBackDropBloc>();
  MovieCarouselBloc(
      {
  required this.getTrending,
}
      ):super(MovieCarouselInitial()){
    on<MovieCarouselEvent>((event, emit) async{
      if(event is CarouselLoadedEvent){

        final movieEither=await getTrending(NoParams());

        movieEither.fold((error) => emit( MovieCarouselErrorState(
          type:  error.type
        )),
                (movies) {
        movieBackDropBloc  .add( MovieBackDropChangedEvent
          (movieEntity: movies[event.defaultindex]));
       return  emit(MovieCarouselLoadedState(
              movies: movies));
                }
        );}

    } );

  }
}
