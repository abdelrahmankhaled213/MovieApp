import 'package:equatable/equatable.dart';

class TrailersEntity extends Equatable{
  final String
  title,
      key
  ,type;
  TrailersEntity({
   required this.title,
   required this.type,
   required this.key
});
  @override
  // TODO: implement props
  List<Object?> get props => [title];
}