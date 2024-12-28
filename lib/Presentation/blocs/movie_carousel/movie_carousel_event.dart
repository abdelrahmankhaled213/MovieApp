import 'package:equatable/equatable.dart';

abstract class MovieCarouselEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class CarouselLoadedEvent extends MovieCarouselEvent{
   int defaultindex;
   CarouselLoadedEvent({
     this.defaultindex=0
}):assert(
   defaultindex>=0,"defaultindex cant be less than 0"
   );
   @override
  // TODO: implement props
  List<Object?> get props => [defaultindex];
}