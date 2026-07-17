import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/widgets/custom_shimmer.dart';

class ProductCardShimmer extends StatelessWidget {
  const ProductCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CustomShimmer.rectangular(
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: REdgeInsetsDirectional.only(start: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomShimmer.roundedRectangular(
                  height: 16.h,
                  width: 100.w,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                SizedBox(height: 4.h),
                CustomShimmer.roundedRectangular(
                  height: 10.h,
                  width: 60.w,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                SizedBox(height: 8.h),
                CustomShimmer.roundedRectangular(
                  height: 12.h,
                  width: 40.w,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                SizedBox(height: 8.h),
                CustomShimmer.circular(
                  height: 14.r,
                  width: 14.r,
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
