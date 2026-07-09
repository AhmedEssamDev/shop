import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/widgets/custom_shimmer.dart';

class UserDataShimmer extends StatelessWidget {
  const UserDataShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 23.h),
        Text('Profile', style: AppTextStyles.textStyle18), // Keep title static if preferred
        SizedBox(height: 32.h),
        CustomShimmer.circular(
          width: 100, // radius 50 * 2
          height: 100,
        ),
        SizedBox(height: 19.h),
        CustomShimmer.roundedRectangular(
          width: 120.w,
          height: 20.h,
          borderRadius: BorderRadius.circular(4.r),
        ),
      ],
    );
  }
}
