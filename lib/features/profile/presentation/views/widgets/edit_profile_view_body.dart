import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_validators.dart';
import 'package:shop/core/widgets/custom_app_bar.dart';
import 'package:shop/core/widgets/custom_button.dart';
import 'package:shop/core/widgets/custom_text_field.dart';
import 'package:shop/features/profile/presentation/views/widgets/custom_avatar.dart';

class EditProfileViewBody extends StatelessWidget {
  EditProfileViewBody({super.key});
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 22, vertical: 50),
      child: SizedBox(
        width: double.infinity,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAppBar(title: 'Profile'),
                SizedBox(height: 25.h),
                CustomAvatar(),
                SizedBox(height: 66.h),
                CustomTextField(
                  validator: (p0) {
                        return AppValidators.requiredValidator(p0 ?? '', 'Name');
                      },
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  hintText: 'Full Name',
                  prefixIcon: SvgPicture.asset(AppSvgs.person),
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  validator: (p0) {
                        return AppValidators.requiredValidator(p0 ?? '', 'Phone');
                      },
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  obscureText: false,
                  hintText: 'Phone',
                  prefixIcon: SvgPicture.asset(AppSvgs.phone),
                ),
                SizedBox(height: 75.h),
                CustomButton(
                  width: 327.w,
                  backgroundColor: AppColors.primary,
                  textColor: AppColors.white,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Handle save changes logic here
                    }
                  },
                  text: 'Save',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
