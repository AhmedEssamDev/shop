import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/features/onboarding/models/onboarding_data_model.dart';

class SkipPage extends StatelessWidget {
  const SkipPage({super.key, required this.currentPage, required this.pages});
  final int currentPage;
  final List<OnboardingData> pages;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Visibility(
        visible: currentPage < pages.length - 1,
        child: TextButton(
          onPressed: () {},
          child: Text(
            'Skip',
            style: AppTextStyles.textStyle18.copyWith(
              color: AppColors.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
