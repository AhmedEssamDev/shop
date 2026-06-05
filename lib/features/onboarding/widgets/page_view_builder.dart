import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/features/onboarding/models/onboarding_data_model.dart';

class PageViewBuilder extends StatefulWidget {
  const PageViewBuilder({
    super.key,
    required this.pages,
    required this.currentPage,
    required this.pageController,
    required this.onPageChanged,
  });
  final PageController pageController;
  final int currentPage;
  final List<OnboardingData> pages;
  final Function(int) onPageChanged;
  @override
  State<PageViewBuilder> createState() => _PageViewBuilderState();
}

class _PageViewBuilderState extends State<PageViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        itemCount: widget.pages.length,
        controller: widget.pageController,
        onPageChanged: (value) {
          widget.onPageChanged(value);
        },
        itemBuilder: (context, index) {
          final page = widget.pages[index];
          return Column(
            children: [
              SvgPicture.asset(page.imageUrl, height: 300.h, width: 300.w),
              SizedBox(height: 40.h),
              Text(page.title1, style: AppTextStyles.textStyle24),
              SizedBox(height: 10.h),
              Text(
                page.description,
                style: AppTextStyles.textStyle13.copyWith(
                  color: AppColors.borderColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
            ],
          );
        },
      ),
    );
  }
}
