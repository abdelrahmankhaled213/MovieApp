import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Core/api_constants.dart';
import 'package:movie_app/Domain/entities/MovieDetails.dart';
import 'package:movie_app/Domain/entities/movie.dart';
import 'package:movie_app/Presentation/Themes/Size/sizeconstants.dart';
import 'package:movie_app/Presentation/Themes/Styles/styles.dart';
import 'package:movie_app/Presentation/Themes/color/appcolor.dart';
import 'package:movie_app/Presentation/blocs/CastBloc/cast_bloc.dart';
import 'package:movie_app/Presentation/blocs/CastBloc/cast_state.dart';
import 'package:movie_app/Presentation/blocs/FavouriteBloc/favourite_bloc.dart';
import 'package:movie_app/Presentation/blocs/FavouriteBloc/favourite_event.dart';
import 'package:movie_app/Presentation/blocs/FavouriteBloc/favourite_state.dart';
import 'package:movie_app/Presentation/blocs/MovieVideoBloc/video_bloc.dart';
import 'package:movie_app/Presentation/blocs/MovieVideoBloc/video_state.dart';
import 'package:movie_app/Presentation/journeys/MovieDetails/VideoScreenView.dart';
import 'package:movie_app/Presentation/widgets/CastList.dart';
import 'package:movie_app/Presentation/widgets/CustomElvatedButton.dart';
import 'package:movie_app/common/extension/num_extensions.dart';

class BigPoster extends StatelessWidget {

  final MovieDetailsEntity movieDetails;

 const BigPoster({super.key, required this.movieDetails});

 @override
  Widget build(BuildContext context) {
 final favouriteBloc =  context.read<FavouriteBloc>();

    return Padding(
      padding: EdgeInsets.only(
        top: 10.h
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
                children: [
                  Container(
                      foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Theme
                                .of(context)
                                .primaryColor
                                .withOpacity(0.3),
                            Theme
                                .of(context)
                                .primaryColor
                          ],
                        ),
                      ),
                      child: SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 400.h,
                        child: CachedNetworkImage
                          (imageUrl:
                        ApiConstants.imageBaseUrl + movieDetails.posterpath!
                          , fit: BoxFit.cover,),
                      )
                  ),

                  Positioned(
                    right: 5.w,
                    top: 5.h,
                    child: BlocBuilder<FavouriteBloc, FavouriteState>(

                      builder: (context, state) {

      if(state is IsFavState){

        return IconButton(

          onPressed: () {

         favouriteBloc .add(

               ToggleFavouriteMovieEvent
             (
                   movieEntity:MovieEntity.fromMovieDetails(movieDetails) , isFav: state.isFav)
         );

            },

          icon:  Icon(state.isFav? Icons.favorite:Icons.favorite_outline
            , size: 30.sp,
            color: Colors.white,
          ),
        );
      }

      return const SizedBox.shrink();
        },
      ),
                  ),

                  Positioned(
                    left: 0.w,
                    right: 0.w,
                    bottom: 0.h,
                    child: ListTile(
                      title: Text(movieDetails.title,
                        style: ThemeText.vulcanSubtitle1?.copyWith(
                          color: AppColor.violet
                        ),
                      ),
                      subtitle: Text(movieDetails.releaseDate, style:
                          ThemeText.vulcanSubtitle1?.copyWith(
                            color: Colors.grey
                          ),
                      ),
                      trailing: Text(
                          movieDetails.voteaverage.convertToPercentageToString()
                          , style:ThemeText.vulcanBodyText2?.copyWith(
                              color: AppColor.violet
                      )),
                    ),
                  )
                ]
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0.sp),
                child: Text(movieDetails.OverView, style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp
                )
                ),
              )
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.sp
                  ,vertical: Sizes.dimen_12.sp),
              child: Text("Cast", style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp
              )
              ),),
          ),
          SliverToBoxAdapter(

              child: BlocBuilder
              <CastBloc, CastState>(

                builder: (context, state) {
                  if(state is CastLoaded) {
                    return CastList(cast: state.cast);
                  }
                  return const SizedBox.shrink();
                },
              )
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 15.h,
            ),
          ),
          SliverToBoxAdapter(
            child:
            BlocBuilder<VideoBloc, VideoState>(
        builder: (context, state) {

      return
      CustomElevatedButton(
        text: "Watch Trailers",
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
              VideoScreenView(
                videos: state is VideoLoaded?
                state.trailers: null,
              )
          )
          );
        },
      );
        },
      ),
          )
        ],
      ),
    );
  }
}