import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.width,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    required this.text,
    this.borderSide,
  });
  final double width;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Function()? onPressed;
  final BorderSide? borderSide;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
            side: borderSide ?? BorderSide(color: AppColors.primary, width: 2.w),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyles.textStyle20.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
