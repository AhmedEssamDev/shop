import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/widgets/custom_app_bar.dart';
import 'package:shop/core/widgets/custom_snack_bar.dart';
import 'package:shop/features/profile/data/model/order_response_model.dart';
import 'package:shop/core/widgets/order_card_shimmer.dart';
import 'package:shop/features/profile/presentation/manger/orders/cubit/orders_cubit.dart';
import 'package:shop/features/profile/presentation/views/widgets/empty_orders_widget.dart';
import 'package:shop/features/profile/presentation/views/widgets/order_card_widget.dart';
import 'package:shop/features/profile/presentation/views/widgets/order_tabs_widget.dart';
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
    final List<String> tabs = [
      context.tr.active,
      context.tr.completed,
      context.tr.cancelled,
    ];

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
                OrderTabsWidget(
                  tabs: tabs,
                  selectedIndex: _selectedIndex,
                  onTabSelected: (index) => setState(() => _selectedIndex = index),
                ),
                SizedBox(height: 30.h),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (state is OrdersLoading && cubit.ordersData == null) {
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          itemCount: 4,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 16.h),
                          itemBuilder: (context, index) =>
                              const OrderCardShimmer(),
                        );
                      } else if (state is OrdersFailure &&
                          cubit.ordersData == null) {
                        return Center(
                          child: Text(
                            state.errMessage,
                            style: AppTextStyles.textStyle18
                                .copyWith(color: Colors.red),
                          ),
                        );
                      }

                      if (cubit.ordersData == null) return const SizedBox();

                      final List<Order>? currentOrders = _selectedIndex == 0
                          ? cubit.ordersData!.active
                          : _selectedIndex == 1
                              ? cubit.ordersData!.completed
                              : cubit.ordersData!.canceled;

                      if (currentOrders == null || currentOrders.isEmpty) {
                        return EmptyOrdersWidget(
                          message:
                              '${context.tr.youDontHaveAny}\n${tabs[_selectedIndex].toLowerCase()} ${context.tr.ordersAtThisTime}',
                        );
                      }

                      return Stack(
                        children: [
                          ListView.separated(
                            padding: EdgeInsets.zero,
                            itemCount: currentOrders.length,
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 16.h),
                            itemBuilder: (context, index) {
                              return OrderCardWidget(
                                order: currentOrders[index],
                                selectedIndex: _selectedIndex,
                                statusLabel: tabs[_selectedIndex],
                                cubit: cubit,
                              );
                            },
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
