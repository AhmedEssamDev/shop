import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/widgets/custom_app_bar.dart';
import 'package:shop/core/widgets/custom_button.dart';
import 'package:shop/core/widgets/custom_network_image.dart';
import 'package:shop/core/widgets/custom_snack_bar.dart';
import 'package:shop/features/product/presentation/manger/cubit/cart_cubit.dart';
import 'package:shop/features/product/presentation/views/widgets/custom_adder_minuser.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key, this.product});
  final dynamic product;

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 22, vertical: 50),

      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: 'Product'),
            SizedBox(height: 27.h),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 15),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: CustomNetworkImage(
                      height: 308.h,
                      imageUrl: widget.product.imagePath ?? '',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 10.r,
                    right: 10.r,
                    child: Container(child: SvgPicture.asset(AppSvgs.love1)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 36.h),
            Padding(
              padding: REdgeInsets.only(left: 8),
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
                      Spacer(),
                      CustomAdderMinuser(
                        color: AppColors.lightPink,
                        onTap: () {
                          if (count > 1) {
                            setState(() {
                              count--;
                            });
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
                        onTap: () {
                          setState(() {
                            count++;
                          });
                        },
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
                        'Added to cart successfully!',
                      );
                    },
                    text: 'Add to Cart',
                    width: double.infinity,
                    backgroundColor: AppColors.primary,
                    textColor: AppColors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
