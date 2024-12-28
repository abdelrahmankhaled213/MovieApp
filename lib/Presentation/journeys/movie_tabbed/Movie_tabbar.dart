import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Presentation/Themes/Size/sizeconstants.dart';
import 'package:movie_app/Presentation/blocs/MovieTab/movie_tab_bloc.dart';
import 'package:movie_app/Presentation/journeys/movie_tabbed/movieListView.dart';
import 'package:movie_app/Presentation/journeys/movie_tabbed/movietabbedconstants.dart';
import 'package:movie_app/Presentation/journeys/movie_tabbed/tabTitleWidget.dart';

class MovieTabBarWidget extends StatefulWidget {


  const MovieTabBarWidget({Key? key}) : super(key: key);

  @override
  State<MovieTabBarWidget> createState() => _MovieTabBarWidgetState();
}

class _MovieTabBarWidgetState extends State<MovieTabBarWidget> with
    SingleTickerProviderStateMixin {

  MovieTabBloc get movieTabBloc => BlocProvider.of<MovieTabBloc>(context);
  int currentIndex=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieTabBloc.add( MovieTabChanged(
      index: currentIndex
    ));
  }
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MovieTabBloc, MovieTabState>(builder: (context, state) {

      return Padding(
          padding: const EdgeInsets.only(top: Sizes.dimen_4),
        child:Column(
         children: [
           SingleChildScrollView(
            scrollDirection: Axis.horizontal,
           child: Row(
           mainAxisSize: MainAxisSize.max,
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               for (var i = 0; i < MovieAppTabbedConstants.tabList.length; i++)
                 TabTitleWidget(
                    title: MovieAppTabbedConstants.tabList[i].title,
                     isSelected: isSelected(i,state), onTap: (){
                  state.currentTabIndex = i;
                      movieTabBloc.add(MovieTabChanged(index: i));
                    }
                    )
            ],
          ),
        ),
          if(state is MovieTabChangedState)
        Expanded(child: MovieListViewWidget(movieList: state.movies))
      ],
      )
      );
    },
    );
  }
  bool isSelected(int index,MovieTabState state) {
    return state.currentTabIndex == MovieAppTabbedConstants.tabList[index].index;
  }
}
