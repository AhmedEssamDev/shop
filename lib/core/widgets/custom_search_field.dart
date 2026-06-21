import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

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
        onChanged: (value) {
          // Run your search filter logic here
        },
        decoration: InputDecoration(
          hintText: 'Search any Product..',
          hintStyle: AppTextStyles.textStyle13.copyWith(
            color: AppColors.searchHint,
          ),
          prefixIcon: const Icon(Icons.search, color: AppColors.searchHint),
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
