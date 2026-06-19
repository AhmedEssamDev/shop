import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/core/router/app_router_keys.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/utils/app_validators.dart';
import 'package:shop/core/widgets/custom_button.dart';
import 'package:shop/core/widgets/custom_snack_bar.dart';
import 'package:shop/core/widgets/custom_text_field.dart';
import 'package:shop/features/auth/register/presentation/manger/cubit/register_cubit.dart';
import 'package:shop/features/auth/register/presentation/views/widgets/rich_text.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          AppNotifications.showError(context, state.message);
        } else if (state is RegisterSuccess) {
          AppNotifications.showSuccess(context, state.message);
          context.go(AppRouterKeys.login);
        }
      },
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
        return Padding(
          padding: REdgeInsets.symmetric(horizontal: 32, vertical: 20),
          child: SingleChildScrollView(
            child: Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pop();
                    },
                    child: SvgPicture.asset(AppSvgs.back),
                  ),
                  SizedBox(height: 39.h),
                  Text('Create an\naccount!', style: AppTextStyles.textStyle34),
                  SizedBox(height: 33.h),
                  CustomTextField(
                    validator: (p0) {
                      return AppValidators.requiredValidator(p0 ?? '', 'Name');
                    },
                    controller: cubit.nameController,
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    hintText: 'Full Name',
                    prefixIcon: SvgPicture.asset(AppSvgs.person),
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    validator: (String? p1) {
                      return AppValidators.requiredValidator(p1 ?? '', 'phone');
                    },
                    controller: cubit.phoneController,
                    keyboardType: TextInputType.phone,
                    obscureText: false,
                    hintText: 'Phone',
                    prefixIcon: SvgPicture.asset(AppSvgs.phone),
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    validator: (String? p1) {
                      return AppValidators.requiredValidator(p1 ?? '', 'email');
                    },
                    controller: cubit.emailController,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    hintText: 'Email',
                    prefixIcon: SvgPicture.asset(AppSvgs.email),
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    validator: (String? p1) {
                      return AppValidators.passwordValidator(
                       p1 ?? '',
                      );
                    },
                    controller: cubit.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: cubit.isPassword1,
                    hintText: 'Password',
                    prefixIcon: SvgPicture.asset(AppSvgs.password),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        cubit.PasswordVisibility1();
                      },
                      child: Icon(
                        cubit.isPassword1
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h),
                  CustomTextField(
                    validator: (String? p1) {
                      return AppValidators.passwordValidator(
                        p1 ?? '',
                      );
                    },
                    controller: cubit.confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: cubit.isPassword2,
                    hintText: 'Confirm Password',
                    prefixIcon: SvgPicture.asset(AppSvgs.password),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        cubit.PasswordVisibility2();
                      },
                      child: Icon(
                        cubit.isPassword2
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                  SizedBox(height: 21.h),
                  RichTextWidget(),
                  SizedBox(height: 28.h),
                state is RegisterLoading ? const Center(child: CircularProgressIndicator()) :
                 CustomButton(
                    width: 317.w,
                    backgroundColor: AppColors.primary,
                    textColor: AppColors.white,
                    onPressed: () {
                      state is RegisterLoading ? null : cubit.register();
                    },
                    text: 'Create Account',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
