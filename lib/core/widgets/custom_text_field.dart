import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  // final String? Function(String?) validator;
  // final TextEditingController controller;
  // final TextInputType keyboardType;
  // final bool obscureText;
  // final String hintText;
  // final Widget prefixIcon;
  // final Widget suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {},
      controller: null,
      keyboardType: TextInputType.text,
      obscureText: false,
      cursorColor: AppColors.borderColor,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.borderColor, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.borderColor, width: 1.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.error, width: 1.w),
        ),
        prefixIcon: Padding(
          padding: REdgeInsetsDirectional.only(
            start: 16,
            end: 8,
            top: 12,
            bottom: 12,
          ),
          child: SvgPicture.asset(AppSvgs.email),
        ),
        suffixIcon: Icon(
          Icons.visibility_off,
          color: AppColors.borderColor,
          size: 24.sp,
        ),
        fillColor: AppColors.fieldColor,
        filled: true,
        hintText: 'Email',
        hintStyle: AppTextStyles.textStyle12.copyWith(
          color: AppColors.nameFieldColor,
        ),
      ),
    );
  }
}
