
abstract class CastEvent {

}
class GetCastEvent extends CastEvent{
  final int id;
  GetCastEvent(this.id):assert(id!=0);
}
