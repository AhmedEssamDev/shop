import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/core/router/app_router_keys.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/widgets/custom_network_image.dart';
import 'package:shop/features/home/presentation/views/widgets/custom_rating_stars.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/profile/presentation/manger/user_data/user_data_cubit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/core/utils/context_extension.dart';

class productCard extends StatelessWidget {
  const productCard({super.key, required this.product});
  final dynamic product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouterKeys.product, extra: product);
      },
      child: Card(
        color: AppColors.white,
        elevation: 3, // إضافة ظل
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ), // حواف دائرية
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
                    child: BlocBuilder<UserDataCubit, UserDataState>(
                      builder: (context, state) {
                        bool isFavorite = UserDataCubit.get(context)
                                .userData
                                ?.favoriteProducts
                                ?.any((element) => element.id == product.id) ??
                            false;
                        return InkWell(
                          onTap: () {
                            if (isFavorite) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(context.tr.alreadyInFavorites),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            } else if (product.id != null) {
                              UserDataCubit.get(context).toggleFavorite(product.id!);
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(6.r),
                            decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              isFavorite ? AppSvgs.love : AppSvgs.love1,
                              width: 16.r,
                              height: 16.r,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: REdgeInsetsDirectional.only(start: 8, end: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name ?? '',
                    style: AppTextStyles.textStyle16.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                  Text(
                    product.description ?? '',
                    style: AppTextStyles.textStyle10,
                  ),
                  SizedBox(height: 4.h),

                  Text(
                    '${product.price ?? ''} USD',
                    style: AppTextStyles.textStyle12,
                  ),
                  SizedBox(height: 4.h),
                  CustomRatingStars(product: product),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
