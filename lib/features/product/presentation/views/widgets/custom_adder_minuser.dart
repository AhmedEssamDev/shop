import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';

class CustomAdderMinuser extends StatelessWidget {
  const CustomAdderMinuser({super.key, this.onTap, this.color, this.icon});
  final VoidCallback? onTap;
  final Color? color;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: color ,
        ),
        height: 24.h,
        width: 24.w,
        child: Icon(icon, color: AppColors.backgroundColor, size: 16.r),
      ),
    );
  }
}
