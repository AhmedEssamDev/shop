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
import 'package:shop/features/auth/login/presentation/manger/login_cubit/login_cubit.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          AppNotifications.showError(context, state.errMessage);
        } else if (state is LoginSuccess) {
          AppNotifications.showSuccess(
            context,
            'Welcome Back ${state.userModel.name ?? 'Guest'}',
          );
          GoRouter.of(context).pushReplacement(AppRouterKeys.mainLayout);
        }
      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
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
                      GoRouter.of(
                        context,
                      ).pushReplacement(AppRouterKeys.authScreen);
                    },
                    child: SvgPicture.asset(AppSvgs.back),
                  ),
                  SizedBox(height: 42.h),
                  Text('Welcome\nBack!', style: AppTextStyles.textStyle34),
                  SizedBox(height: 45.h),
                  CustomTextField(
                    validator: (String? p1) {
                      return AppValidators.emailValidator(p1);
                    },
                    controller: cubit.emailController,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    hintText: 'Email',
                    prefixIcon: SvgPicture.asset(AppSvgs.email),
                  ),
                  SizedBox(height: 22.h),
                  CustomTextField(
                    validator: (String? p1) {
                      return AppValidators.passwordValidator(p1);
                    },
                    controller: cubit.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: cubit.isPassword,
                    hintText: 'Password',
                    prefixIcon: SvgPicture.asset(AppSvgs.password),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        cubit.changePasswordVisibility();
                      },
                      child: cubit.isPassword
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                  ),
                  SizedBox(height: 56.h),
                  state is LoginLoading
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                          width: 317.w,
                          backgroundColor: AppColors.primary,
                          textColor: AppColors.white,
                          onPressed: () {
                            state is LoginLoading ? null : cubit.login();
                          },
                          text: 'Login',
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
