import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';

class pageDots extends StatelessWidget {
  const pageDots({super.key, required this.currentPage,required this.activeColor, required this.activeSize});

  final int currentPage;
  final Color activeColor;
  final Size activeSize;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: currentPage.toDouble(),
      decorator: DotsDecorator(
        size: Size.square(9.0.r),
        activeSize: activeSize,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0.r),
        ),
        activeColor: activeColor,
        color: AppColors.borderColor,
      ),
    );
  }
}
