import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';

class CustomRatingStars extends StatelessWidget {
  const CustomRatingStars({super.key, this.product});
  final dynamic product;
  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: (product.rating ?? 0).toDouble(),
      starCount: 5,
      starSize: 14.sp,
      starSpacing: 1.w,
      valueLabelVisibility: false,

      // allowHalfRating: true,
      starBuilder: (index, color) {
        double rating = (product.rating ?? 0).toDouble();

        if (index + 1 <= rating) {
          return Icon(Icons.star, color: AppColors.gold, size: 14.sp);
        } else if (index < rating && index + 1 > rating) {
          double fillPercentage = rating - index;

          return SizedBox(
            width: 14.sp,
            height: 14.sp,
            child: Stack(
              children: [
                Icon(Icons.star_border, color: Colors.grey, size: 14.sp),

                ClipRect(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    widthFactor: fillPercentage,
                    child: Icon(Icons.star, color: Colors.grey, size: 14.sp),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Icon(Icons.star_border, color: Colors.grey, size: 14.sp);
        }
      },
    );
  }
}
