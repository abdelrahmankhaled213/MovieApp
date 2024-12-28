import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Core/api_constants.dart';
import 'package:movie_app/Data/dI/getit.dart';
import 'package:movie_app/Domain/entities/movie.dart';
import 'package:movie_app/Presentation/Themes/color/appcolor.dart';
import 'package:movie_app/Presentation/blocs/FavouriteBloc/favourite_bloc.dart';
import 'package:movie_app/Presentation/blocs/FavouriteBloc/favourite_event.dart';
import 'package:movie_app/Presentation/blocs/FavouriteBloc/favourite_state.dart';
import 'package:movie_app/Presentation/journeys/MovieDetails/MovieDetailsScreenView.dart';
import 'package:shimmer/shimmer.dart';

class FavouriteScreenView extends StatefulWidget{

  const FavouriteScreenView({super.key});

  @override
  State<FavouriteScreenView> createState() => _FavouriteScreenViewState();
}
class _FavouriteScreenViewState extends State<FavouriteScreenView> {

  FavouriteBloc? favouriteBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    favouriteBloc=getitinstance<FavouriteBloc>();

    if(favouriteBloc?.isClosed==false) {
      favouriteBloc?.add(LoadFavouriteMovieEvent());
    }
  }
  @override
  void dispose() {
    super.dispose();

    favouriteBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

   appBar: AppBar(
     backgroundColor: AppColor.vulcan,
     title: Text("Favourite Movies",style: TextStyle(
    fontSize: 20.sp,
    color: Colors.white,

  ),

  ),
     centerTitle: true,
),
      body: BlocProvider.value(
          value:
          favouriteBloc!,

        child: BlocBuilder<FavouriteBloc,FavouriteState>(
          builder: (context, state) {
            if(state is FavouriteMovieSuccessState) {
              return
                state.movieEntityList.length>0?
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.sp,
                  vertical: 10.sp),
                  child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 1/1.5
                                ), itemCount: state.movieEntityList.length
                    ,itemBuilder: (context, index) {
                  return FavouriteMovieContent(movieEntity: state.movieEntityList[index]);
                                },
                  ),
                ):Shimmer.fromColors(
                  baseColor: AppColor.royalblue,
                  highlightColor: Colors.grey.shade300,
                  enabled: true,
                  child: const Center(
                      child: Text("No Favourite Movies",
                        style:
                        TextStyle(color: AppColor.royalblue,letterSpacing: 1.5),)
                  )
                );

            }
            return const SizedBox.shrink();
    }
    )
    )
    );
    }
      }

class FavouriteMovieContent extends StatelessWidget {

  final MovieEntity movieEntity;

    const FavouriteMovieContent({
    required this.movieEntity
  }
  );

  @override
  Widget build(BuildContext context) {

   final favoriteBloc=BlocProvider.of<FavouriteBloc>(context);

   return SizedBox(
     height: 150.h,
     child: GestureDetector(

       onTap: () async{

  await Navigator.push(
             context,
             MaterialPageRoute(
               builder: (context) {

         return MovieDetailsScreenView(movieId: movieEntity.id);

         },
         )
         );
 favoriteBloc.add(LoadFavouriteMovieEvent());

         },

       child: ClipRRect(
         borderRadius: BorderRadius.circular(25.sp),
         child: CachedNetworkImage(
           imageUrl: ApiConstants.imageBaseUrl+movieEntity.posterPath!,
          placeholder: (context, url) {
            return Image.asset("assets/png/Animation - 1720792156981 (1).gif");
          },
         ),
       ),
     ),
   );
  }
}

