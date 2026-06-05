import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';

class pageDots extends StatelessWidget {
  const pageDots({super.key, required this.currentPage});

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: currentPage.toDouble(),
      decorator: DotsDecorator(
        size: Size.square(9.0.r),
        activeSize: Size(40.0.r, 9.0.r),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0.r),
        ),
        activeColor: AppColors.secondary,
        color: AppColors.borderColor,
      ),
    );
  }
}
