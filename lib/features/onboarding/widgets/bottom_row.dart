import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/features/onboarding/models/onboarding_data_model.dart';
import 'package:shop/features/onboarding/widgets/pages_dots.dart';

class BottomRow extends StatelessWidget {
  const BottomRow({super.key, required this.currentPage, required this.pages, required this.pageController});
  final int currentPage;
  final List<OnboardingData> pages;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                maintainSize:
                    true, // مهم جداً للحفاظ على المساحة حتى عند الاختفاء
                maintainAnimation: true,
                maintainState: true,
                visible: currentPage > 0,
                child: TextButton(
                  onPressed: () {
                    previousPage();
                  },
                  child: Text(
                    'Prev',
                    style: AppTextStyles.textStyle18.copyWith(
                      color: AppColors.borderColor,
                    ),
                  ),
                ),
              ),
              pageDots(currentPage: currentPage),
              TextButton(
                onPressed: () {
                  nextPage();
                },
                child: Text(
                  currentPage == pages.length - 1 ? 'Get Started' : 'Next',
                  style: AppTextStyles.textStyle18.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
    );
  }
  void nextPage() {
    if (currentPage < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }
}