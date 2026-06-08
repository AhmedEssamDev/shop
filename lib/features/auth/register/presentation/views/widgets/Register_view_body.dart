import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/widgets/custom_button.dart';
import 'package:shop/core/widgets/custom_text_field.dart';
import 'package:shop/features/auth/register/presentation/views/widgets/rich_text.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody();
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 32, vertical: 20),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).pop();
                },
                child: SvgPicture.asset(AppSvgs.back)),
              SizedBox(height: 39.h),
              Text('Create an\naccount!', style: AppTextStyles.textStyle34),
              SizedBox(height: 33.h),
              CustomTextField(),
              SizedBox(height: 10.h),
              CustomTextField(),
              SizedBox(height: 10.h),
              CustomTextField(),
              SizedBox(height: 10.h),
              CustomTextField(),
              SizedBox(height: 10.h),
              CustomTextField(),
              SizedBox(height: 21.h),
              RichTextWidget(),
              SizedBox(height: 28.h),
             CustomButton(
                width: 317.w,
                backgroundColor: AppColors.primary,
                textColor: AppColors.white,
                onPressed: () {},
                text: 'Create Account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}