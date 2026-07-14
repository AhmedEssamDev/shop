import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/widgets/custom_app_bar.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 22, vertical: 50),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            CustomAppBar(title: 'My Orders'),
            SizedBox(height: 40.h),
            SizedBox(
              width: double.infinity,
              height: 30.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                return Container(
                width: 104.w,
                height: 28.h,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(38.r)
                ),
                child:Center(
                  child: Text('Active',style: AppTextStyles.textStyle18.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500
                  ))
                )
              );
              }, separatorBuilder: (BuildContext context, int index) { 
                return SizedBox(width: 10.w,);
               },),
            )
          ],
        ),
      ),
    );
  }
}