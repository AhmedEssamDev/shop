import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/widgets/custom_app_bar.dart';
import 'package:shop/core/widgets/custom_button.dart';
import 'package:shop/core/widgets/custom_network_image.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key, this.product});
  final dynamic product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 22, vertical: 50),

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
                    imageUrl: product.imagePath ?? '',
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
                  product.name ?? '',
                  style: AppTextStyles.textStyle20.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
                SizedBox(height: 18.h),
                Text(
                  product.description ?? '',
                  style: AppTextStyles.textStyle12.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Text(
                      '${product.price} \$',
                      style: AppTextStyles.textStyle20.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.lightPink,
                      ),
                      height: 24.h,
                      width: 24.w,
                      child: Icon(
                        Icons.remove,
                        color: AppColors.backgroundColor,
                        size: 16.r,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      ' 1 ',
                      style: AppTextStyles.textStyle16.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.primary,
                      ),
                      height: 24.h,
                      width: 24.w,
                      child: Icon(
                        Icons.add,
                        color: AppColors.backgroundColor,
                        size: 16.r,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 49.h),
                CustomButton(
                  onPressed: () {},
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
    );
  }
}
