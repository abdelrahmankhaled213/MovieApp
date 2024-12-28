import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/Domain/entities/CastEntity.dart';
import 'package:movie_app/Domain/entities/MovieParams.dart';
import 'package:movie_app/Domain/repositories/apperror.dart';
import 'package:movie_app/Domain/usecases/GetCastGroup.dart';
import 'package:movie_app/Presentation/blocs/CastBloc/cast_bloc.dart';
import 'package:movie_app/Presentation/blocs/CastBloc/cast_event.dart';
import 'package:movie_app/Presentation/blocs/CastBloc/cast_state.dart';
class CastBloc extends Bloc<CastEvent, CastState> {
  final GetCastGroupUseCase getCastGroup;
  CastBloc(
  {
    required this.getCastGroup
}
      ) : super(CastInitial()) {
    on<CastEvent>((event, emit) async{
      if(event is GetCastEvent){
var result =
await getCastGroup.call(MovieParams(id: event.id));
result.fold((l) => emit(CastError(l.type)),
        (r) => emit(CastLoaded(r)));
      }
    });
  }
}
