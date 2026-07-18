import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/widgets/custom_network_image.dart';
import 'package:shop/features/profile/data/model/order_response_model.dart';
import 'package:shop/core/utils/context_extension.dart';

class OrderDetailItemWidget extends StatelessWidget {
  const OrderDetailItemWidget({super.key, required this.item});

  final OrderItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withAlpha(20),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: SizedBox(
                  width: 80.w,
                  height: 80.h,
                  child: item.imagePath != null
                      ? CustomNetworkImage(imageUrl: item.imagePath!)
                      : Container(color: AppColors.lightgrey),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name ?? '',
                      style: AppTextStyles.textStyle13.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6.h),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 12.r),
                          SizedBox(width: 4.w),
                          Text(
                            '${item.rating ?? 0.0}',
                            style: AppTextStyles.textStyle12,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '${item.quantity ?? 1} ${context.tr.item}',
                      style: AppTextStyles.textStyle12.copyWith(
                        color: AppColors.borderColor,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '\$${item.price ?? 0}',
                      style: AppTextStyles.textStyle13.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          const Divider(color: AppColors.lightgrey),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${context.tr.totalOrder} (${item.quantity ?? 1}) :',
                style: AppTextStyles.textStyle12,
              ),
              Text(
                '\$${((item.price ?? 0) * (item.quantity ?? 1)).toStringAsFixed(2)}',
                style: AppTextStyles.textStyle13.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
