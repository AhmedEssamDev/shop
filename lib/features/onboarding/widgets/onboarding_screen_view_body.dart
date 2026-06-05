import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/features/onboarding/models/onboarding_data_model.dart';
import 'package:shop/features/onboarding/widgets/bottom_row.dart';
import 'package:shop/features/onboarding/widgets/page_view_builder.dart';
import 'package:shop/features/onboarding/widgets/skip_page.dart';

class OnboardingScreenViewBody extends StatefulWidget {
  const OnboardingScreenViewBody({super.key});

  @override
  State<OnboardingScreenViewBody> createState() =>
      _OnboardingScreenViewBodyState();
}

class _OnboardingScreenViewBodyState extends State<OnboardingScreenViewBody> {
  final PageController pageController = PageController();
  int currentPage = 0;
  List<OnboardingData> get pages => [
    OnboardingData(
      title1: 'Choose Products',
      description:
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
      imageUrl: AppSvgs.onboarding1,
    ),
    OnboardingData(
      title1: 'Make Payment',
      description:
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
      imageUrl: AppSvgs.onboarding2,
    ),
    OnboardingData(
      title1: 'Get Your Order',
      description:
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
      imageUrl: AppSvgs.onboarding3,
    ),
  ];
  @override
  initState() {
    super.initState();
  }

  @override
  dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 18.0, vertical: 16),
      child: Column(
        children: [
          SkipPage(currentPage: currentPage, pages: pages),
          SizedBox(height: 95.h),
          PageViewBuilder(
            pages: pages,
            currentPage: currentPage,
            pageController: pageController,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
          ),
          BottomRow(
            pages: pages,
            pageController: pageController,
            currentPage: currentPage,
          ),
        ],
      ),
    );
  }
}
