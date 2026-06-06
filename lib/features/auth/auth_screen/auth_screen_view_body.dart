import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/features/auth/auth_screen/widgets/gradient_container.dart';

class AuthScreenViewBody extends StatelessWidget {
  const AuthScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 447.h),
          GradientContainer(),
        ],
      ),
    );
  }
}
