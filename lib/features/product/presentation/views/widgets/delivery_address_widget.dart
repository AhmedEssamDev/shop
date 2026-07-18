import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/core/router/app_router_keys.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/features/product/presentation/manger/cubit/cart_cubit.dart';

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({super.key, required this.cubit});

  final CartCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(AppSvgs.location),
            SizedBox(width: 8.w),
            Text(
              'Delivery Address',
              style: AppTextStyles.textStyle13,
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Container(
              padding: REdgeInsets.all(12),
              width: 241.w,
              height: 79.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 14,
                    spreadRadius: -8,
                    offset: const Offset(0, 6),
                    color: AppColors.secondary.withAlpha(63),
                  ),
                  BoxShadow(
                    blurRadius: 9,
                    spreadRadius: -7,
                    offset: const Offset(0, -4),
                    color: AppColors.secondary.withAlpha(63),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Address', style: AppTextStyles.textStyle12),
                  SizedBox(height: 8.h),
                  Text(
                    cubit.selectedAddress ?? 'Pick an address',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.textStyle12.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            GestureDetector(
              onTap: () async {
                final result = await GoRouter.of(context).push(AppRouterKeys.map);
                if (result != null && result is Map<String, dynamic>) {
                  cubit.updateAddress(result['address']);
                }
              },
              child: Container(
                width: 78.w,
                height: 78.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: AppColors.primary,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 14,
                      spreadRadius: -8,
                      offset: const Offset(0, 6),
                      color: AppColors.secondary.withAlpha(63),
                    ),
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppSvgs.location,
                    width: 33.w,
                    height: 41.25.h,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
