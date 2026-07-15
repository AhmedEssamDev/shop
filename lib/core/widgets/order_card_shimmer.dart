import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/widgets/custom_shimmer.dart';

class OrderCardShimmer extends StatelessWidget {
  const OrderCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withAlpha(20),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomShimmer.roundedRectangular(
            width: 80.w,
            height: 80.h,
            borderRadius: BorderRadius.circular(10.r),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomShimmer.roundedRectangular(
                      width: 100.w,
                      height: 16.h,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    CustomShimmer.roundedRectangular(
                      width: 50.w,
                      height: 16.h,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomShimmer.roundedRectangular(
                      width: 70.w,
                      height: 12.h,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    CustomShimmer.roundedRectangular(
                      width: 40.w,
                      height: 12.h,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomShimmer.roundedRectangular(
                        height: 28.h,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: CustomShimmer.roundedRectangular(
                        height: 28.h,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
