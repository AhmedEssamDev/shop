import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/widgets/custom_shimmer.dart';

class SliderShimmer extends StatelessWidget {
  const SliderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomShimmer.roundedRectangular(
          width: 343.w,
          height: 189.h,
          borderRadius: BorderRadius.circular(20.r),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: CustomShimmer.circular(
                width: 12.w,
                height: 12.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
