import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/utils/context_extension.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({super.key, required this.totalPrice});
  final int totalPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.tr.totalPlusTaxes,
          style: AppTextStyles.textStyle13.copyWith(),
        ),
        Text(
          '${totalPrice +totalPrice*0.15 +10} \$',
          style: AppTextStyles.textStyle20.copyWith(color: AppColors.primary),
        ),
      ],
    );
  }
}