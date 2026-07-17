import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/core/router/app_router_keys.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/widgets/custom_app_bar.dart';
import 'package:shop/core/widgets/custom_network_image.dart';
import 'package:shop/core/widgets/custom_snack_bar.dart';
import 'package:shop/features/profile/presentation/manger/orders/cubit/orders_cubit.dart';
import 'package:shop/features/profile/data/model/order_response_model.dart';
import 'package:shop/core/widgets/order_card_shimmer.dart';
import 'package:shop/core/utils/context_extension.dart';

class OrderViewBody extends StatefulWidget {
  const OrderViewBody({super.key});

  @override
  State<OrderViewBody> createState() => _OrderViewBodyState();
}

class _OrderViewBodyState extends State<OrderViewBody> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = [context.tr.active, context.tr.completed, context.tr.cancelled];
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {
        if (state is OrderActionSuccess) {
          AppNotifications.showSuccess(context, state.message);
        } else if (state is OrderActionFailure) {
          AppNotifications.showError(context, state.errMessage);
        }
      },
      builder: (context, state) {
        final cubit = OrdersCubit.get(context);
        
        return Padding(
          padding: REdgeInsets.symmetric(horizontal: 22, vertical: 50),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                CustomAppBar(title: context.tr.myOrders),
                SizedBox(height: 40.h),
                SizedBox(
                  width: double.infinity,
                  height: 28.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: tabs.length,
                    separatorBuilder: (context, index) => SizedBox(width: 10.w),
                    itemBuilder: (context, index) {
                      final isSelected = _selectedIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Container(
                          padding: REdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.primary : Colors.transparent,
                            borderRadius: BorderRadius.circular(38.r),
                          ),
                          child: Center(
                            child: Text(
                              tabs[index],
                              style: AppTextStyles.textStyle18.copyWith(
                                color: isSelected ? AppColors.white : AppColors.primary,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30.h),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (state is OrdersLoading && cubit.ordersData == null) {
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          itemCount: 4,
                          separatorBuilder: (context, index) => SizedBox(height: 16.h),
                          itemBuilder: (context, index) {
                            return const OrderCardShimmer();
                          },
                        );
                      } else if (state is OrdersFailure && cubit.ordersData == null) {
                        return Center(
                          child: Text(
                            state.errMessage,
                            style: AppTextStyles.textStyle18.copyWith(color: Colors.red),
                          ),
                        );
                      }

                      if (cubit.ordersData == null) {
                        return const SizedBox();
                      }

                      List<Order>? currentOrders;
                      if (_selectedIndex == 0) {
                        currentOrders = cubit.ordersData!.active;
                      } else if (_selectedIndex == 1) {
                        currentOrders = cubit.ordersData!.completed;
                      } else {
                        currentOrders = cubit.ordersData!.canceled;
                      }

                      if (currentOrders == null || currentOrders.isEmpty) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppSvgs.file,
                              height: 120.h,
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              '${context.tr.youDontHaveAny}\n${tabs[_selectedIndex].toLowerCase()} ${context.tr.ordersAtThisTime}',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.textStyle18.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        );
                      }

                      return Stack(
                        children: [
                          ListView.separated(
                            padding: EdgeInsets.zero,
                            itemCount: currentOrders.length,
                            separatorBuilder: (context, index) => SizedBox(height: 16.h),
                            itemBuilder: (context, index) {
                              final order = currentOrders![index];
                              final firstItem = order.items != null && order.items!.isNotEmpty 
                                  ? order.items!.first 
                                  : null;
                                  
                              return InkWell(
                                onTap: () {
                                  GoRouter.of(context).push(AppRouterKeys.orderDetails, extra: {
                                    'order': order,
                                    'status': tabs[_selectedIndex],
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
                                          if (_selectedIndex == 0) // Active
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: InkWell(
                                                    onTap: () {
                                                      cubit.cancelOrder(order.id!);
                                                    },
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
                                                    onTap: () {
                                                      cubit.completeOrder(order.id!);
                                                    },
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
                                            ),
                                          if (_selectedIndex == 1) // Completed
                                            Row(
                                              children: [
                                                Icon(Icons.check_circle_outline, color: Colors.green, size: 16.r),
                                                SizedBox(width: 4.w),
                                                Text(
                                                  context.tr.orderDelivered,
                                                  style: AppTextStyles.textStyle12.copyWith(color: AppColors.primary),
                                                ),
                                              ],
                                            ),
                                          if (_selectedIndex == 2) // Cancelled
                                            Row(
                                              children: [
                                                Icon(Icons.cancel_outlined, color: Colors.red, size: 16.r),
                                                SizedBox(width: 4.w),
                                                Text(
                                                  context.tr.orderCanceled,
                                                  style: AppTextStyles.textStyle12.copyWith(color: AppColors.primary),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                            }
                          ),
                          if (state is OrderActionLoading)
                            Container(
                              color: Colors.black.withAlpha(50),
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
