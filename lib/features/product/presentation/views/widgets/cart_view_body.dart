import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/utils/context_extension.dart';
import 'package:shop/core/widgets/custom_app_bar.dart';
import 'package:shop/core/widgets/custom_button.dart';
import 'package:shop/core/widgets/custom_snack_bar.dart';
import 'package:shop/features/product/presentation/manger/cubit/cart_cubit.dart';
import 'package:shop/features/product/presentation/manger/cubit/place_order_cubit.dart';
import 'package:shop/features/product/presentation/views/widgets/cart_item_widget.dart';
import 'package:shop/features/product/presentation/views/widgets/cart_summary.dart';
import 'package:shop/features/product/presentation/views/widgets/delivery_address_widget.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 22, vertical: 50),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cubit = CartCubit.get(context);

          return Column(
            children: [
              CustomAppBar(title: context.tr.cart),
              SizedBox(height: 36.h),
              DeliveryAddressWidget(cubit: cubit),
              Expanded(
                child: cubit.cartItems.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 80.r,
                              color: AppColors.borderColor,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              context.tr.yourCartIsEmpty,
                              style: AppTextStyles.textStyle18.copyWith(
                                color: AppColors.borderColor,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: REdgeInsets.only(top: 20.h, bottom: 10),
                            child: Text(
                              context.tr.shoppingList,
                              style: AppTextStyles.textStyle13.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondary,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              itemCount: cubit.cartItems.length,
                              separatorBuilder: (context, index) =>
                                  Divider(color: AppColors.lightgrey, height: 24.h),
                              itemBuilder: (context, index) =>
                                  CartItemWidget(item: cubit.cartItems[index]),
                            ),
                          ),
                          Divider(color: AppColors.borderColor, height: 1),
                          SizedBox(height: 16.h),
                          CartSummary(totalPrice: cubit.totalPrice),
                          SizedBox(height: 16.h),
                          BlocConsumer<PlaceOrderCubit, PlaceOrderState>(
                            listener: (context, state) {
                              if (state is PlaceOrderSuccess) {
                                AppNotifications.showSuccess(
                                  context,
                                  state.placeOrder.message ??
                                      context.tr.orderPlacedSuccessfully,
                                );
                                cubit.clearCart();
                                GoRouter.of(context).pop();
                              } else if (state is PlaceOrderFailure) {
                                AppNotifications.showError(
                                    context, state.message);
                              }
                            },
                            builder: (context, state) {
                              final orderCubit = PlaceOrderCubit.get(context);
                              return state is PlaceOrderLoading
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : CustomButton(
                                      onPressed: () => orderCubit.placeOrder(
                                          items: cubit.cartItems),
                                      text: context.tr.checkout,
                                      width: double.infinity,
                                      backgroundColor: AppColors.primary,
                                      textColor: AppColors.white,
                                    );
                            },
                          ),
                          SizedBox(height: 10.h),
                        ],
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
