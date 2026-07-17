import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/core/router/app_router_keys.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/utils/context_extension.dart';
import 'package:shop/core/widgets/custom_search_field.dart';
import 'package:shop/features/home/presentation/views/widgets/all_featured.list_view.dart';
import 'package:shop/features/home/presentation/views/widgets/slider_page_view.dart';

class AllFeaturedSection extends StatelessWidget {
  const AllFeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: REdgeInsets.only(top: 30, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.fullLogo, height: 110.h, width: 110.w),
              CustomSearchField(
                onTap: () {
                  GoRouter.of(context).push(AppRouterKeys.search);
                },
                readOnly: true
              ),
              SizedBox(height: 17.h),
              AllFeaturedListView(),
              SizedBox(height: 24.h),
              SliderPageView(),
              SizedBox(height: 32.h),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Padding(
                  padding: REdgeInsetsDirectional.only(start: 8.0),
                  child: Text(
                    context.tr.bestSellers,
                    style: AppTextStyles.textStyle18.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 18.h),
            ],
          ),
        ),
      ),
    );
  }
}
