import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationDrawerListItem extends StatelessWidget {
  final String title;
  final Function() onTap;
  const NavigationDrawerListItem({required this.title, required this.onTap,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 8.w
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme
                    .of(context)
                    .primaryColor
                    .withOpacity(0.7),
                blurRadius: 2,
              )
            ],
          ),
          child: ListTile(title: Text(title
            , style: TextStyle(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.w600),)),
        ),
      ),
    );
  }
}