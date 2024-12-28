
abstract class VideoEvent {}

class GetVideoEvent extends VideoEvent {
  final int id;
  GetVideoEvent(this.id);
}
