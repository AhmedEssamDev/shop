import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/widgets/custom_app_bar.dart';
import 'package:shop/core/widgets/custom_button.dart';
import 'package:shop/core/widgets/custom_snack_bar.dart';
import 'package:shop/features/product/presentation/manger/cubit/cart_cubit.dart';
import 'package:shop/features/product/presentation/manger/cubit/place_order_cubit.dart';
import 'package:shop/features/product/presentation/views/widgets/cart_item_widget.dart';
import 'package:shop/features/product/presentation/views/widgets/cart_summary.dart';
import 'package:shop/core/utils/context_extension.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 22, vertical: 50),
        child: Column(
          children: [
            CustomAppBar(title: context.tr.cart),
            SizedBox(height: 36.h),
            Row(
              children: [
                SvgPicture.asset(AppSvgs.location),
                SizedBox(width: 8.w),
                Text(context.tr.deliveryAddress, style: AppTextStyles.textStyle13),
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
                        offset: Offset(0, 6),
                        color: AppColors.secondary.withAlpha(63),
                      ),
                      BoxShadow(
                        blurRadius: 9,
                        spreadRadius: -7,
                        offset: Offset(0, -4),
                        color: AppColors.secondary.withAlpha(63),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(context.tr.address, style: AppTextStyles.textStyle12),
                      SizedBox(height: 8.h),
                      Text(
                        context.tr.pickAddress,
                        style: AppTextStyles.textStyle12.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                Container(
                  width: 78.w,
                  height: 78.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: AppColors.primary,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 14,
                        spreadRadius: -8,
                        offset: Offset(0, 6),
                        color: AppColors.secondary.withAlpha(63),
                      ),
                      BoxShadow(
                        blurRadius: 9,
                        spreadRadius: -7,
                        offset: Offset(0, -4),
                        color: AppColors.secondary.withAlpha(63),
                      ),
                    ],
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      width: 33.w,
                      height: 41.25.h,
                      colorFilter: ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                      AppSvgs.location,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  final cubit = CartCubit.get(context);

                  if (cubit.cartItems.isEmpty) {
                    return Center(
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
                    );
                  }

                  return Column(
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
                          itemBuilder: (context, index) {
                            final item = cubit.cartItems[index];
                            return CartItemWidget(item: item);
                          },
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
                            AppNotifications.showError(context, state.message);
                          }
                        },
                        builder: (context, state) {
                          var orderCubit = PlaceOrderCubit.get(context);
                          return state is PlaceOrderLoading
                              ? const Center(child: CircularProgressIndicator())
                              : CustomButton(
                                  onPressed: () {
                                    orderCubit.placeOrder(
                                      items: cubit.cartItems,
                                    );
                                  },
                                  text: context.tr.checkout,
                                  width: double.infinity,
                                  backgroundColor: AppColors.primary,
                                  textColor: AppColors.white,
                                );
                        },
                      ),
                      SizedBox(height: 10.h),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
