import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/widgets/custom_search_field.dart';
import 'package:shop/features/home/presentation/views/widgets/all_featured.list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: REdgeInsets.only(top: 30, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.fullLogo, height: 110.h, width: 110.w),
            CustomSearchField(),
            SizedBox(height: 17.h),
            Padding(
              padding: REdgeInsets.only(left: 8),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'All Featured',
                  style: AppTextStyles.textStyle18.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
              ),
            ),
            SizedBox(height: 25.h),
            AllFeaturedListView(),
            SizedBox(height: 24.h,),
            Container(
              width: 343.w,
              height: 189.h,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(AppImages.slider))
              ),
            )
          ],
        ),
      ),
    );
  }
}
