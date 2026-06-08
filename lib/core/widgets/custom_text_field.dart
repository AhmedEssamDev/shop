import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.validator,
   required this.controller, required this.keyboardType,
   required this.obscureText, required this.hintText,
   required this.prefixIcon,  this.suffixIcon});

  final String? Function(String?) validator;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
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
            start: 20,
            end: 12,
            top: 16,
            bottom: 16,
          ),
          child: prefixIcon,
        ),
        suffixIcon:suffixIcon,
        fillColor: AppColors.fieldColor,
        filled: true,
        hintText: hintText,
        hintMaxLines: 1,
        hintStyle: AppTextStyles.textStyle12.copyWith(
          color: AppColors.nameFieldColor,
        ),
      ),
    );
  }
}
