import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';

class AllFeaturedListView extends StatelessWidget {
  const AllFeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          height: 85.h,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: REdgeInsets.only(left: 8.0),
                child: Column(
                  children: [
                    Container(
                      width: 60.w,
                      height: 60.h,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(AppImages.authBackground),
                      ),
                    ),
                    Text(
                      'Beauty',
                      style: AppTextStyles.textStyle10.copyWith(
                        color: Color(0xff21003D),
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
