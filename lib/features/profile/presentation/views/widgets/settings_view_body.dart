import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/widgets/custom_app_bar.dart';

class SettingsViewBody extends StatefulWidget {
  const SettingsViewBody({super.key});

  @override
  State<SettingsViewBody> createState() => _SettingsViewBodyState();
}

class _SettingsViewBodyState extends State<SettingsViewBody> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 22, vertical: 50),
      child: Column(
        children: [
          CustomAppBar(title: 'Settings'),
          SizedBox(height: 65.h),
          Row(
            children: [
              Text(
                'Language',
                style: AppTextStyles.textStyle18.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              ToggleButtons(
                onPressed: (index) {
                  setState(() {
                    isSelected =
                        (index == 1); // تعديل منطق الاختيار ليناسب الـ list
                  });
                },
                // إزالة اللون الافتراضي ليأخذ الـ Container اللون الخاص به
                fillColor: Colors.transparent,
                selectedColor: Colors.transparent,
                renderBorder: false, // لإخفاء الحدود الافتراضية
                isSelected: isSelected ? [false, true] : [true, false],
                children: [
                  _buildLanguageButton('AR', !isSelected,BorderRadius.only(
                    topLeft: Radius.circular(5.r),
                    bottomLeft: Radius.circular(5.r),
                  )),
                  _buildLanguageButton('EN', isSelected,BorderRadius.only(
                    topRight: Radius.circular(5.r),
                    bottomRight: Radius.circular(5.r),
                  )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildLanguageButton(String text, bool isSelected,BorderRadiusGeometry? borderRadius) {
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
