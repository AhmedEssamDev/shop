import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/widgets/custom_button.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      height: 362.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF000000).withValues(alpha: 0.0),
            const Color(0xFF000000).withValues(alpha: 0.63),
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            'You want\nAuthentic, here\nyou go!',
            textAlign: TextAlign.center,
            style: AppTextStyles.textStyle34.copyWith(color: AppColors.white),
          ),
          SizedBox(height: 24.h),
          Text(
            'Find it here, buy it now!',
            style: AppTextStyles.textStyle13.copyWith(
              color: AppColors.lightgrey,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 24.h),
          CustomButton(
            onPressed: () {
              
            },
            width: 279.w,
            backgroundColor: AppColors.primary,
            textColor: AppColors.white,
            text: 'Login',
          ),
          SizedBox(height: 15.h),
          CustomButton(
            onPressed: () {

            },
            width: 279.w,
            backgroundColor: AppColors.white,
            textColor: AppColors.primary,
            text: 'Register',
          ),
        ],
      ),
    );
  }
}
