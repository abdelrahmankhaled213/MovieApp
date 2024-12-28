
import 'package:movie_app/Data/models/MovieVideoModel.dart';
import 'package:movie_app/Domain/entities/CastEntity.dart';
import 'package:movie_app/Domain/entities/TrailersEntity.dart';
import 'package:movie_app/Domain/repositories/apperror.dart';

abstract class VideoState {}
class VideoInitial extends VideoState {}
class VideoLoading extends VideoState {}
class VideoLoaded extends VideoState {
  final List<TrailersEntity>? trailers;
  VideoLoaded(this.trailers);
}
class VideoError extends VideoState {
  final AppErrorType type;
  VideoError(this.type);
}
