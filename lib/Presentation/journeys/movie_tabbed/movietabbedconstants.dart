import 'package:movie_app/Presentation/journeys/movie_tabbed/Tabmodel.dart';
class MovieAppTabbedConstants{
  MovieAppTabbedConstants._();
  static List<TabModel>tabList=[
const TabModel(
  title: "Popular", index: 0,
),
  const TabModel(
      title: "PlayingNow", index: 1,
    ),
   const TabModel(
      title:" ComingSoon", index: 2,
    ),


  ];
}