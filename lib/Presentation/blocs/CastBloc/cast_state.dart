import 'package:equatable/equatable.dart';
import 'package:movie_app/Domain/entities/CastEntity.dart';
import 'package:movie_app/Domain/repositories/apperror.dart';

abstract class CastState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

 class CastInitial extends CastState {}

 class CastLoading extends CastState {
 }
 class CastLoaded extends CastState {
  final List<CastEntity> cast;
  CastLoaded(this.cast);
  @override
  // TODO: implement props
  List<Object?> get props => [cast];
 }
 class CastError extends CastState {
  final AppErrorType type;
  CastError(this.type);
  @override
  // TODO: implement props
  List<Object?> get props => [type];
 }
