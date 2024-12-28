import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Domain/entities/CastEntity.dart';
import 'package:movie_app/Presentation/widgets/CastWidget.dart';
class CastList extends StatelessWidget {
  final List<CastEntity> cast;
  const CastList({super.key, required this.cast});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cast.length,
        itemBuilder: (context, index) {
          return CastWidget(
            cast: cast[index],
          )
          ;
        },
      ),
    );
  }
}