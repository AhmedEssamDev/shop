import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/features/home/presentation/views/widgets/all_featured_list_view_items.dart';
import 'package:shop/features/home/presentation/views/widgets/products_grid_view_items.dart';
import 'package:shop/core/utils/context_extension.dart';

class ItemsViewBody extends StatelessWidget {
  const ItemsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: REdgeInsets.only(top: 30, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.fullLogo, height: 110.h, width: 110.w),
                  SizedBox(height: 17.h),
                  AllFeaturedListViewItems(),
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
        ),
        ProductsGridViewItems(),
      ],
    );
  }
}
