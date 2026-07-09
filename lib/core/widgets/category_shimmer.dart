import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/widgets/custom_shimmer.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(left: 8.0),
      child: Column(
        children: [
          CustomShimmer.circular(
            width: 60.w,
            height: 60.h,
          ),
          SizedBox(height: 4.h),
          CustomShimmer.roundedRectangular(
            width: 40.w,
            height: 10.h,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ],
      ),
    );
  }
}
