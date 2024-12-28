import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Presentation/Themes/Size/sizeconstants.dart';
import 'package:movie_app/Presentation/journeys/Drawer/navigationdrawerlistitem.dart';
import 'package:movie_app/Presentation/journeys/Favourite/FavouriteScreenView.dart';
import 'package:movie_app/Presentation/widgets/Dialog.dart';
import 'package:movie_app/Presentation/widgets/MovieLogo.dart';
import 'package:wiredash/wiredash.dart';
class DrawerHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
    child:    SingleChildScrollView(
      child: Container(
          width: Sizes.dimen_300.w,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color:Theme.of(context).primaryColor.withOpacity(0.7),
                  blurRadius: 4.0,
                )
              ]
          ),
          child:SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: Sizes.dimen_10.h,
                      bottom: Sizes.dimen_18.h,
                      left: Sizes.dimen_16.w,
                      right: Sizes.dimen_8.w,
                    ),
                    child: MovieLogo(
                      height: Sizes.dimen_24.h,
                    ),
                  ),
                       NavigationDrawerListItem(
                         onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) {
                 return FavouriteScreenView();
               },));
                         },
                         title: "Favourites Movies"
                       ),
                  SizedBox(height: 10.h,),
                  NavigationDrawerListItem(
                    onTap: () {
                      Navigator.of(context).pop();
                      Wiredash.of(context).show();
                    },
                    title: "FeedBack",
                  ),
                  SizedBox(height: 10.h,),
                  NavigationDrawerListItem(
                    onTap: () {
                      Navigator.of(context).pop();
                      showDialogFun(context);
                    },
                    title: "About",
                  ),
                ],
              ),
            ),
          )
      ),
    ),
    );
  }
}
 showDialogFun(BuildContext context){
  return showDialog(context: context, builder: (context) {
    return CustomDialog(
      description: "This is product uses the TMDB API but is not endorsed or certified by TMDB.This app is developed by for education purpose.",

      text: "About",
    );

  },);
}