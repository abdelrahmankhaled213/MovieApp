import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable{
}
class StartSearch extends SearchEvent{
  final String query;
  StartSearch({
   required this.query
});
  @override
  // TODO: implement props
  List<Object?> get props => [query];

}

