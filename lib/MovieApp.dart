import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Presentation/Themes/Styles/styles.dart';
import 'package:movie_app/Presentation/Themes/color/appcolor.dart';
import 'package:movie_app/Presentation/journeys/Home/homescreen.dart';
import 'package:wiredash/wiredash.dart';

class MovieApp extends StatelessWidget {

  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
             Wiredash(
              projectId: "movie-app-ytywslz",
              secret: "94DqbaC_1rmG9AXzRh5nJj9Fm_t0V6Tr"
              ,
              theme: WiredashThemeData(
                brightness: Brightness.dark,
                primaryColor: AppColor.royalblue,
                secondaryColor: AppColor.violet,
              ),
              child: ScreenUtilInit(
                minTextAdapt: true,
                designSize: const Size(360, 690 ),
                builder: (context, child) {
                  return MaterialApp(
                    title: 'Movie App',
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                        primaryColor: AppColor.vulcan,
                        scaffoldBackgroundColor: AppColor.vulcan,
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        textTheme: ThemeText.getTextTheme(),
                        appBarTheme: AppBarTheme(
                            elevation: 8.sp
                        )
                    ),
                    home: HomeScreen(),
                  );
                },
              ),
            );
          }
}
