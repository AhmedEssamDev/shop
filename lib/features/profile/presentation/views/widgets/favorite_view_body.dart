import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/widgets/custom_app_bar.dart';
import 'package:shop/features/profile/presentation/manger/user_data/user_data_cubit.dart';
import 'package:shop/features/profile/presentation/views/widgets/favorite_product_card.dart';
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
                    return FavoriteProductCard(product: product);
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