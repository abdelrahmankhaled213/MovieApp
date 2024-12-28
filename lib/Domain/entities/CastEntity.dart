import 'package:equatable/equatable.dart';

class CastEntity extends Equatable{
  final int id;
  final String name;
  final String? profilePath;
  final String? character;
  CastEntity({
   required this.id,
   required this.name,
    this.profilePath,
    this.character
}):assert(id != 0);

  @override
  List<Object?> get props => [id,profilePath];

}