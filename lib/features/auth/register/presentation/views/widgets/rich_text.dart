import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/utils/context_extension.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: context.tr.agreeText,
        style: AppTextStyles.textStyle12.copyWith(
          color: AppColors.nameFieldColor,
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(
            text: context.tr.agreeRegister,
            style: AppTextStyles.textStyle12.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(text: context.tr.agreeOffer),
        ],
      ),
    );
  }
}
