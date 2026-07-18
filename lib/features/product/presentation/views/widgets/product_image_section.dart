import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/context_extension.dart';
import 'package:shop/core/widgets/custom_network_image.dart';
import 'package:shop/features/profile/presentation/manger/user_data/user_data_cubit.dart';

class ProductImageSection extends StatelessWidget {
  const ProductImageSection({super.key, required this.product});

  final dynamic product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CustomNetworkImage(
              height: 308.h,
              imageUrl: product.imagePath ?? '',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 10.r,
            right: 10.r,
            child: BlocBuilder<UserDataCubit, UserDataState>(
              builder: (context, state) {
                final isFavorite = UserDataCubit.get(context)
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
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: 0.5),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      isFavorite ? AppSvgs.love : AppSvgs.love1,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
