import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/core/router/app_router_keys.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/widgets/custom_network_image.dart';
import 'package:shop/features/profile/data/model/order_response_model.dart';
import 'package:shop/features/profile/presentation/manger/orders/cubit/orders_cubit.dart';
import 'package:shop/core/utils/context_extension.dart';

class OrderCardWidget extends StatelessWidget {
  const OrderCardWidget({
    super.key,
    required this.order,
    required this.selectedIndex,
    required this.statusLabel,
    required this.cubit,
  });

  final Order order;
  final int selectedIndex;
  final String statusLabel;
  final OrdersCubit cubit;

  @override
  Widget build(BuildContext context) {
    final firstItem =
        order.items != null && order.items!.isNotEmpty ? order.items!.first : null;

    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouterKeys.orderDetails, extra: {
          'order': order,
          'status': statusLabel,
        });
      },
      child: Container(
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: SizedBox(
                width: 80.w,
                height: 80.h,
                child: firstItem?.imagePath != null
                    ? CustomNetworkImage(imageUrl: firstItem!.imagePath!)
                    : Container(color: AppColors.lightgrey),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          firstItem?.name ?? 'Order #${order.id}',
                          style: AppTextStyles.textStyle13.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '\$${order.total != null ? (order.total! + order.total! * 0.15 + 10).toStringAsFixed(2) : 0}',
                        style: AppTextStyles.textStyle13.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        order.orderDate ?? '',
                        style: AppTextStyles.textStyle12.copyWith(
                          color: AppColors.borderColor,
                          fontSize: 10.sp,
                        ),
                      ),
                      Text(
                        '${order.items?.length ?? 0} ${(order.items?.length ?? 0) > 1 ? context.tr.items : context.tr.item}',
                        style: AppTextStyles.textStyle12.copyWith(
                          color: AppColors.borderColor,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  if (selectedIndex == 0) _ActiveOrderActions(cubit: cubit, order: order),
                  if (selectedIndex == 1) _CompletedOrderStatus(context: context),
                  if (selectedIndex == 2) _CancelledOrderStatus(context: context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActiveOrderActions extends StatelessWidget {
  const _ActiveOrderActions({required this.cubit, required this.order});

  final OrdersCubit cubit;
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: InkWell(
            onTap: () => cubit.cancelOrder(order.id!),
            child: Container(
              padding: REdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Center(
                child: Text(
                  context.tr.cancel,
                  style: AppTextStyles.textStyle12.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: InkWell(
            onTap: () => cubit.completeOrder(order.id!),
            child: Container(
              padding: REdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Center(
                child: Text(
                  context.tr.complete,
                  style: AppTextStyles.textStyle12.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CompletedOrderStatus extends StatelessWidget {
  const _CompletedOrderStatus({required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext ctx) {
    return Row(
      children: [
        Icon(Icons.check_circle_outline, color: Colors.green, size: 16.r),
        SizedBox(width: 4.w),
        Text(
          context.tr.orderDelivered,
          style: AppTextStyles.textStyle12.copyWith(color: AppColors.primary),
        ),
      ],
    );
  }
}

class _CancelledOrderStatus extends StatelessWidget {
  const _CancelledOrderStatus({required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext ctx) {
    return Row(
      children: [
        Icon(Icons.cancel_outlined, color: Colors.red, size: 16.r),
        SizedBox(width: 4.w),
        Text(
          context.tr.orderCanceled,
          style: AppTextStyles.textStyle12.copyWith(color: AppColors.primary),
        ),
      ],
    );
  }
}
