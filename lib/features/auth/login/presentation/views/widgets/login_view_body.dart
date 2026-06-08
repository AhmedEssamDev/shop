import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/widgets/custom_button.dart';
import 'package:shop/core/widgets/custom_text_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key,});

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
              SizedBox(height: 42.h),
              Text('Welcome\nBack!', style: AppTextStyles.textStyle34),
              SizedBox(height: 45.h),
              CustomTextField(),
              SizedBox(height: 22.h),
              CustomTextField(),
              SizedBox(height: 56.h),
             CustomButton(
                width: 317.w,
                backgroundColor: AppColors.primary,
                textColor: AppColors.white,
                onPressed: () {},
                text: 'Login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
