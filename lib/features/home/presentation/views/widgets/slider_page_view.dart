import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderPageView extends StatelessWidget {
  const SliderPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343.w,
      height: 189.h,
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(
                image: NetworkImage(
                  'https://static.vecteezy.com/system/resources/thumbnails/057/068/323/small/single-fresh-red-strawberry-on-table-green-background-food-fruit-sweet-macro-juicy-plant-image-photo.jpg',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
