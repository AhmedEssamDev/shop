import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/widgets/custom_network_image.dart';
import 'package:shop/features/product/data/models/cart_item_model.dart';
import 'package:shop/features/product/presentation/manger/cubit/cart_cubit.dart';
import 'package:shop/features/product/presentation/views/widgets/custom_adder_minuser.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({required this.item});
  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.productId),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        CartCubit.get(context).removeFromCart(item.productId);
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: REdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(Icons.delete, color: AppColors.white, size: 30.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة المنتج
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CustomNetworkImage(
              imageUrl: item.imagePath,
              width: 85.w,
              height: 85.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 14.w),

          // التفاصيل
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: AppTextStyles.textStyle20.copyWith(
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Text(
                    item.rating.toString(),
                    style: AppTextStyles.textStyle13
                    ),
                    SizedBox(width: 4.w),
                    Icon(Icons.star,color: AppColors.gold,size: 15.r)
                  ]
                ),
                SizedBox(height: 6.h),
                Text(
                  '${item.price} \$',
                  style: AppTextStyles.textStyle16.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ), 
              ],
            ),
          ),

          // أزرار التحكم في الكمية
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 30.h),
              Row(
                children: [
                  CustomAdderMinuser(
                    color: AppColors.lightPink,
                    onTap: () {
                      CartCubit.get(
                        context,
                      ).updateQuantity(item.productId, item.quantity - 1);
                    },
                    icon: Icons.remove,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    item.quantity.toString(),
                    style: AppTextStyles.textStyle16.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  CustomAdderMinuser(
                    color: AppColors.primary,
                    onTap: () {
                      CartCubit.get(
                        context,
                      ).updateQuantity(item.productId, item.quantity + 1);
                    },
                    icon: Icons.add,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
