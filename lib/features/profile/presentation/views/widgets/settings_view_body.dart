import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/localization/locale_cubit.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/utils/context_extension.dart';
import 'package:shop/core/widgets/custom_app_bar.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 22, vertical: 50),
      child: Column(
        children: [
          CustomAppBar(title: context.tr.settings),
          SizedBox(height: 65.h),
          Row(
            children: [
              Text(
                context.tr.language,
                style: AppTextStyles.textStyle18.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(), 
              BlocBuilder<LocaleCubit, Locale>(
                builder: (context, locale) {
                  final isEnglish = locale.languageCode == 'en';
                  return ToggleButtons(
                    onPressed: (index) {
                      context.read<LocaleCubit>().changeLanguage(index == 0 ? 'ar' : 'en');
                    },
                    fillColor: Colors.transparent,
                    selectedColor: Colors.transparent,
                    renderBorder: false, 
                    isSelected: isEnglish ? [false, true] : [true, false],
                    children: [
                      _buildLanguageButton('AR', !isEnglish, BorderRadius.only(
                        topLeft: Radius.circular(5.r),
                        bottomLeft: Radius.circular(5.r),
                      )),
                      _buildLanguageButton('EN', isEnglish, BorderRadius.only(
                        topRight: Radius.circular(5.r),
                        bottomRight: Radius.circular(5.r),
                      )),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageButton(String text, bool isSelected, BorderRadiusGeometry? borderRadius) {
    return Container(
      width: 50.w,
      height: 36.h,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.lightPink,
        borderRadius: borderRadius,
      ),
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.textStyle20.copyWith(
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : AppColors.secondary,
          ),
        ),
      ),
    );
  }
}
