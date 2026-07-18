import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/widgets/custom_app_bar.dart';
import 'package:shop/features/profile/data/model/order_response_model.dart';
import 'package:shop/features/profile/presentation/views/widgets/order_detail_item_widget.dart';
import 'package:shop/core/utils/context_extension.dart';

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody({
    super.key,
    required this.order,
    required this.status,
  });

  final Order order;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 22, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: context.tr.orderDetails),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${context.tr.orderNo}${order.id}',
                style: AppTextStyles.textStyle20.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                status,
                style: AppTextStyles.textStyle18.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            order.orderDate ?? '',
            style: AppTextStyles.textStyle12.copyWith(
              color: AppColors.borderColor,
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: order.items?.length ?? 0,
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemBuilder: (context, index) {
                final item = order.items![index];
                return OrderDetailItemWidget(item: item);
              },
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.tr.orderTotal,
                style: AppTextStyles.textStyle16.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$${order.total ?? 0}',
                style: AppTextStyles.textStyle16.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
