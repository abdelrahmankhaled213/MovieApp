import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Domain/entities/TrailersEntity.dart';
import 'package:movie_app/Presentation/Themes/Size/sizeconstants.dart';
import 'package:movie_app/Presentation/Themes/color/appcolor.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class VideoScreenView extends StatefulWidget {

  final List<TrailersEntity>? videos;

  const VideoScreenView( {required this.videos,super.key});

  @override
  State<VideoScreenView> createState() => _VideoScreenViewState();

}

class _VideoScreenViewState extends State<VideoScreenView> {
  YoutubePlayerController? controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
if(widget.videos!=null){

  if(widget.videos!.length>0){
    controller = YoutubePlayerController(
      initialVideoId: widget.videos?[0].key??'',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

  }
}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text("Watch Trailers",style: TextStyle(
       color: Colors.white,
       fontSize: 20.sp,
     ),),
       backgroundColor: Colors.transparent,

       centerTitle: true,
       ),
      body:widget.videos!=null&&
          widget.videos!.length>0?

      Expanded(
        flex: 1,
        child: YoutubePlayerBuilder(

          player: YoutubePlayer(
            controller: controller!,
            aspectRatio: 16/9,
            progressIndicatorColor: Colors.amber,
            showVideoProgressIndicator: true,
            progressColors: const ProgressBarColors(
              playedColor: AppColor.violet,
              handleColor: AppColor.royalblue,
            ),
          ),
          builder: (context, player) {


            return  SingleChildScrollView(
              child: Column(
                children: [
                  player,
                  Column(
                    children: [
                      for(int i=0;i<widget.videos!.length;i++)
                        SingleChildScrollView(
                          child: Container(
                            height: Sizes.dimen_100.h,
                            padding: EdgeInsets.symmetric(
                              vertical: Sizes.dimen_12.h,
                              horizontal: Sizes.dimen_12.w
                            ),

                            child:Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if(controller!=null) {
                                      controller?.load(widget.videos![i].key);
                                      controller?.play();
                                    }
                                  },
                                  child: CachedNetworkImage(
                                    imageUrl: YoutubePlayer.getThumbnail(
                                        videoId: widget.videos![i].key,
                                    quality: ThumbnailQuality.high
                                    ),
                                    errorWidget: (context, url, error) {
                                      return Icon(Icons.error,size: 60.sp,color: AppColor.royalblue);
                                    },

                                  ),
                                ),
                                Expanded(child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Text(widget.videos![i].title,
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.white ,
                                    ),),
                                ),
                                )

                              ],
                            ) ,
                          ),
                        )


                    ],
                  )
                ],
              ),
            );

          },
        ),
      ):
          Center(
    child: Shimmer.fromColors(
    baseColor: AppColor.royalblue,
    highlightColor: Colors.grey.shade300,
    enabled: true,
    child: const Center(
    child: Text(" There is no trailers for this movie",
    style:
    TextStyle(color: AppColor.royalblue,letterSpacing: 1.5),)),)

          )
    );

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller?.dispose();
  }
}
