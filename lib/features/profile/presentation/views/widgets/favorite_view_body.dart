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
import 'package:shop/features/home/data/models/products_model.dart';
import 'package:shop/features/profile/presentation/manger/user_data/user_data_cubit.dart';
import 'package:shop/core/widgets/product_card_shimmer.dart';
import 'package:shop/core/utils/context_extension.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 22, vertical: 50),
      child: Column(
        children: [
          CustomAppBar(title: context.tr.myFavorites),
          SizedBox(height: 20.h),
          Expanded(
            child: BlocBuilder<UserDataCubit, UserDataState>(
              builder: (context, state) {
                final favorites =
                    UserDataCubit.get(context).userData?.favoriteProducts ?? [];

                if (state is UserDataLoading && UserDataCubit.get(context).userData == null) {
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return const ProductCardShimmer();
                    },
                  );
                }

                if (favorites.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppSvgs.file,
                        width: 120.w,
                        height: 120.h,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        context.tr.noFavoritesYet,
                        style: AppTextStyles.textStyle16.copyWith(
                          color: AppColors.borderColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        context.tr.tapHeartIcon,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.textStyle12.copyWith(
                          color: AppColors.borderColor,
                        ),
                      ),
                    ],
                  );
                }

                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                  ),
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    final product = favorites[index];
                    return _FavoriteProductCard(product: product);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FavoriteProductCard extends StatelessWidget {
  const _FavoriteProductCard({required this.product});
  final Products product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouterKeys.product, extra: product),
      child: Card(
        color: AppColors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: CustomNetworkImage(
                      imageUrl: product.imagePath ?? '',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8.r,
                    right: 8.r,
                    child: InkWell(
                      onTap: () {
                        if (product.id != null) {
                          UserDataCubit.get(context).toggleFavorite(product.id!);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.7),
                          shape: BoxShape.circle,
                        ),
                        // Already favorited, show filled heart
                        child: SvgPicture.asset(
                          AppSvgs.love,
                          width: 16.r,
                          height: 16.r,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: REdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name ?? '',
                    style: AppTextStyles.textStyle13.copyWith(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    product.description ?? '',
                    style: AppTextStyles.textStyle10,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '\$${product.price ?? ''}',
                    style: AppTextStyles.textStyle12.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}