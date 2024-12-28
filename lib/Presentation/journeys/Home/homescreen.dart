import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Data/dI/getit.dart';
import 'package:movie_app/Domain/repositories/apperror.dart';
import 'package:movie_app/Domain/usecases/getComingSoon.dart';
import 'package:movie_app/Domain/usecases/getPlayingNow.dart';
import 'package:movie_app/Domain/usecases/getTrending.dart';
import 'package:movie_app/Domain/usecases/getpopular.dart';
import 'package:movie_app/Presentation/Themes/color/appcolor.dart';
import 'package:movie_app/Presentation/blocs/MovieTab/movie_tab_bloc.dart';
import 'package:movie_app/Presentation/blocs/SearchBloc/search_bloc.dart';
import 'package:movie_app/Presentation/blocs/movie_BackDropPath/backdropbloc.dart';
import 'package:movie_app/Presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_app/Presentation/blocs/movie_carousel/movie_carousel_event.dart';
import 'package:movie_app/Presentation/blocs/movie_carousel/movie_carousel_state.dart';
import 'package:movie_app/Presentation/journeys/Drawer/Drawerhomescreen.dart';
import 'package:movie_app/Presentation/journeys/movie_tabbed/Movie_tabbar.dart';
import 'package:movie_app/Presentation/widgets/ErrorCarouselWidget.dart';
import 'package:movie_app/Presentation/widgets/MovieCarouselWidget.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

   SearchBloc? searchBloc;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchBloc=getitinstance<SearchBloc>();

  }
  @override
  void dispose() {
    super.dispose();
    searchBloc!.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [

        BlocProvider(
            create: (context) {
          return MovieCarouselBloc(
              getTrending: getitinstance<GetTrending>()
          )
            ..add(CarouselLoadedEvent());
        }),

        
        BlocProvider(create: (context) {
          return getitinstance<MovieBackDropBloc>(
          );
        }),
        
        BlocProvider(create: (context) {

    return MovieTabBloc
    (getPopular: getitinstance<GetPopular>(),
    getComingSoon: getitinstance<GetComingSoon>(),
    getPlayingNow: getitinstance<GetPlayingNow>());
    }),

        BlocProvider(create: (context) {
          return getitinstance<SearchBloc>();
        },)
      ],

      child: Scaffold(
        drawer: const DrawerHomeScreen(),
        body:
        BlocBuilder<MovieCarouselBloc,MovieCarouselState>(

          builder: (context, state) {

            if (state is MovieCarouselLoadedState) {

              return Stack(

                fit: StackFit.expand,

                children: [

                  FractionallySizedBox(

                      alignment: Alignment.topCenter,

                      heightFactor: 0.6,

                  child:MovieCarouselWidget(getTrending: state.movies,
                          defaultIndex: state.defaultindex,
                  ),
                      ),
                 const  FractionallySizedBox(
                      alignment: Alignment.bottomCenter,
                      heightFactor: 0.4,
                      child: MovieTabBarWidget(),
                  )
                ],
              );
            }

            else if (state is MovieCarouselErrorState){

              return Center(

              child: CarouselWidgetError(
                text: state.type==AppErrorType.server?" there is a server failure":" check your internet connection",

              ),
            );

            }

            return SizedBox(

              width: MediaQuery.of(context)
                  .size.width,
              height: MediaQuery.of(context).size.height,

              child: Shimmer.fromColors(
                baseColor: AppColor.royalblue,
                highlightColor: Colors.grey.shade300,
                enabled: true,
                child: const SizedBox()
              ),
            );

          }
        )
          )
  );
  }
}