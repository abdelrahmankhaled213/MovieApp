import 'package:bloc/bloc.dart';
import 'package:movie_app/Domain/usecases/GetSearchData.dart';
import 'package:movie_app/Presentation/blocs/SearchBloc/search_event.dart';
import 'package:movie_app/Presentation/blocs/SearchBloc/search_state.dart';
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchData getSearchedData;

  SearchBloc({required this.getSearchedData}) : super(SearchInitial()) {

    on<SearchEvent>((event, emit) async {
   if(event is StartSearch){

if(event.query.length>0&&event.query.length<3){
  return emit(SearchLoading());
}
final getData=await getSearchedData(
    MovieSearchParams(query: event.query)
);

getData.fold((l) => emit(
    SearchError(
  type: l.type
)), (r) =>
    emit(SearchSuccess(filtereddata: r)));
   }

    });
  }
}
