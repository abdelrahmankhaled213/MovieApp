import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/Presentation/Themes/Size/sizeconstants.dart';
import 'package:movie_app/Presentation/Themes/Styles/styles.dart';
import 'package:movie_app/Presentation/Themes/color/appcolor.dart';
import 'package:movie_app/Presentation/blocs/SearchBloc/search_bloc.dart';
import 'package:movie_app/Presentation/blocs/SearchBloc/search_event.dart';
import 'package:movie_app/Presentation/blocs/SearchBloc/search_state.dart';
import 'package:movie_app/Presentation/widgets/MovieLogo.dart';
import 'package:movie_app/Presentation/widgets/searchmoviecard.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shimmer/shimmer.dart';

class MovieAppBar extends StatelessWidget {

const MovieAppBar({super.key});

@override
  Widget build(BuildContext context) {
    return Padding(
      padding:
    EdgeInsets.only(
      top:Sizes.dimen_20.h,
   right: Sizes.dimen_16.w,
        left: Sizes.dimen_16.w
    ),

   child: Row(
        children: [
IconButton(
   onPressed: () {
Scaffold.of(context).openDrawer();
   },
 icon: SvgPicture.asset(
   "assets/Svg/menu.svg",
   height: Sizes.dimen_16.h,
 ),
),
          Expanded(
              child: MovieLogo(height: Sizes.dimen_16.h,)
          ),
          IconButton(
            onPressed: () {
              showSearch(context: context,
                  delegate: CustomSearchDelegate(
                    searchBloc:
                    BlocProvider
                        .of<SearchBloc>(context),
                    mQuery: BehaviorSubject<String>(),
                  )
              );
            },
            icon: Icon(Icons.search,
            color:  Colors.white,
            size: Sizes.dimen_20.h,),
          ),
      ],
    ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {

  final SearchBloc searchBloc;

  final  BehaviorSubject<String>  mQuery;

  CustomSearchDelegate({ required this.searchBloc, required this.mQuery}){

    mQuery.debounceTime(
        const Duration(milliseconds: 300)).
    distinct()
        .listen((query){

      searchBloc.add(StartSearch(query: query));

    }

    );
  }

@override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return Theme.of(context).copyWith(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: ThemeText.vulcanBodyText2?.copyWith(color: Colors.grey,fontSize: 14.sp),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
    floatingLabelAlignment: FloatingLabelAlignment.center,
        contentPadding: EdgeInsets.symmetric(
          vertical: Sizes.dimen_10.h,
          horizontal: Sizes.dimen_10.w ,
        ),

      )
    );
  }
  @override
  List<Widget>? buildActions(BuildContext context) {

    return <Widget>[
     IconButton(
         onPressed: query.isEmpty?null:
    (){
       query="";
    }
     , icon: Icon(Icons.clear,color: query.isEmpty?Colors.grey:AppColor.royalblue,))
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
return GestureDetector(onTap: (){
  close(context,null);
},child: Icon(Icons.arrow_back,color: Colors.white,size: Sizes.dimen_14.h));
  }

  @override
  Widget buildResults(BuildContext context) {
return const SizedBox();
  }


  @override
  Widget buildSuggestions(BuildContext context) {
     mQuery.add(query);
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: searchBloc,
      builder: (context, state) {
        if(state is SearchLoading ){
          return Center(
            child: Image.asset("assets/png/Animation - 1711847019535.gif",
              fit: BoxFit.cover,height: Sizes.dimen_200.h,),
          );
        }
        if(state is SearchSuccess){
          if(state.filtereddata.length==0){
            return Center(
                child: Shimmer.fromColors(
              baseColor: AppColor.violet,
              highlightColor: Colors.grey.shade300,
              enabled: true,
              child: Shimmer.fromColors(
                  baseColor: AppColor.royalblue,
                  highlightColor: Colors.grey.shade300,
                  enabled: true,
                  child: const Center(
                      child: Text("No results found ",
                        style:
                        TextStyle(color: AppColor.royalblue,letterSpacing: 1.5),)
                  )
              )
                )
            );
          }
          return Padding(

            padding:  EdgeInsets.symmetric(horizontal: 8.w),

            child: ListView.builder(itemCount: state.filtereddata.length,
              shrinkWrap: true

              ,itemBuilder: (context, index) {
                return SearchMovieCard(movie: state.filtereddata[index]);
              },
            ),
          );
        }
        if(state is SearchError){
          return Center(
            child: Text(state.type.name=="server"?

            "server error":"check your internet connection"),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

}
