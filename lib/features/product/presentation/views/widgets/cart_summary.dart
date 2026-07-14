import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({required this.totalPrice});
  final int totalPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total, plus taxes and delivery:',
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