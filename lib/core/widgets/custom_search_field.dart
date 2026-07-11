import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, this.readOnly = false, this.onTap, this.onChanged, this.controller});
  final bool readOnly;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withAlpha(10),
            spreadRadius: 0,
            blurRadius: 9,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        readOnly: readOnly,
        onTap: onTap,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search any Product..',
          hintStyle: AppTextStyles.textStyle13.copyWith(
            color: AppColors.searchFieldColor,
          ),
          prefixIcon: const Icon(Icons.search, color: AppColors.searchFieldColor),
          filled: true,
          fillColor: AppColors.white, // Background color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0), // Rounded corners
            borderSide: BorderSide.none, // Removes the default underline border
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
        ),
      ),
    );
  }
}
