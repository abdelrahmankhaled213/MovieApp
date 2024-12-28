import 'package:bloc/bloc.dart';
import 'package:movie_app/Domain/entities/MovieParams.dart';
import 'package:movie_app/Domain/usecases/GetTrailers.dart';
import 'package:movie_app/Presentation/blocs/MovieVideoBloc/video_event.dart';
import 'package:movie_app/Presentation/blocs/MovieVideoBloc/video_state.dart';
class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final GetTrailers getVideo;
  VideoBloc({
    required this.getVideo
}) : super(VideoInitial()) {
    on<VideoEvent>((event, emit) async{
      if(event is GetVideoEvent){
        final response=await getVideo(MovieParams(id: event.id));
        response.fold((l) => emit(VideoError(l.type))
            , (r) {
          emit(VideoLoading());
          return emit(VideoLoaded(
           r
          ));
        });
      }
    });
  }
}
