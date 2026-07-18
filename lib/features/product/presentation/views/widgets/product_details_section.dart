import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/utils/context_extension.dart';
import 'package:shop/core/widgets/custom_button.dart';
import 'package:shop/core/widgets/custom_snack_bar.dart';
import 'package:shop/features/product/presentation/manger/cubit/cart_cubit.dart';
import 'package:shop/features/product/presentation/views/widgets/custom_adder_minuser.dart';

class ProductDetailsSection extends StatefulWidget {
  const ProductDetailsSection({super.key, required this.product});

  final dynamic product;

  @override
  State<ProductDetailsSection> createState() => _ProductDetailsSectionState();
}

class _ProductDetailsSectionState extends State<ProductDetailsSection> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsetsDirectional.only(start: 8, end: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.product.name ?? '',
            style: AppTextStyles.textStyle20.copyWith(
              color: AppColors.secondary,
            ),
          ),
          SizedBox(height: 18.h),
          Text(
            widget.product.description ?? '',
            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 30.h),
          Row(
            children: [
              Text(
                '${widget.product.price * count} \$',
                style: AppTextStyles.textStyle20.copyWith(
                  color: AppColors.primary,
                ),
              ),
              const Spacer(),
              CustomAdderMinuser(
                color: AppColors.lightPink,
                onTap: () {
                  if (count > 1) {
                    setState(() => count--);
                  }
                },
                icon: Icons.remove,
              ),
              SizedBox(width: 10.w),
              Text(
                count.toString(),
                style: AppTextStyles.textStyle16.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              SizedBox(width: 10.w),
              CustomAdderMinuser(
                color: AppColors.primary,
                onTap: () => setState(() => count++),
                icon: Icons.add,
              ),
            ],
          ),
          SizedBox(height: 49.h),
          CustomButton(
            onPressed: () {
              CartCubit.get(context).addToCart(
                rating: widget.product.rating ?? 0,
                productId: widget.product.id,
                name: widget.product.name ?? '',
                imagePath: widget.product.imagePath ?? '',
                price: widget.product.price ?? 0,
                quantity: count,
              );
              AppNotifications.showSuccess(
                context,
                context.tr.addedToCartSuccessfully,
              );
            },
            text: context.tr.addToCart,
            width: double.infinity,
            backgroundColor: AppColors.primary,
            textColor: AppColors.white,
          ),
        ],
      ),
    );
  }
}
