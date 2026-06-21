import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/widgets/custom_search_field.dart';

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
            SizedBox(
              height: 90.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: REdgeInsets.only(left:8.0),
                    child: Column(
                      children: [
                        Container(
                        width: 60.w,
                        height: 60.h,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(AppImages.authBackground),
                        ),
                      ),
                      Text('Beauty')
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
