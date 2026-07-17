import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/core/cache/cache_helper.dart';
import 'package:shop/core/cache/cache_keys.dart';
import 'package:shop/core/router/app_router_keys.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/features/profile/presentation/manger/user_data/user_data_cubit.dart';
import 'package:shop/features/profile/presentation/views/widgets/list_tile_widget.dart';
import 'package:shop/core/utils/context_extension.dart';

class ListTileSection extends StatelessWidget {
  const ListTileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.h),
        ListTileWidget(
          leading: AppSvgs.profile,
          title: context.tr.myProfile,
          trailing: AppSvgs.forward,
          onTap: () async {
            final cubit = context.read<UserDataCubit>();
            final userData = cubit.userData;
            final result = await GoRouter.of(context).push(AppRouterKeys.editProfile, extra: userData);
            if (result == true) {
              cubit.getUserData(); 
            } 
          },
        ),
        ListTileWidget(
          leading: AppSvgs.order,
          title: context.tr.myOrders,
          trailing: AppSvgs.forward,
          onTap: () {
            GoRouter.of(context).push(AppRouterKeys.order);
          },
        ),
        ListTileWidget(
          leading: AppSvgs.favorite,
          title: context.tr.myFavorites,
          trailing: AppSvgs.forward,
          onTap: () {
            GoRouter.of(context).push(AppRouterKeys.favorite);
          },
        ),
        ListTileWidget(
          leading: AppSvgs.setting,
          title: context.tr.settings,
          trailing: AppSvgs.forward,
          onTap: () {
            GoRouter.of(context).push(AppRouterKeys.settings);
          },
        ),
        SizedBox(height: 32.h),
        Container(width: 308.w, height: 1.h, color: AppColors.primary),
        SizedBox(height: 32.h),
        ListTileWidget(leading: AppSvgs.logout, title: context.tr.logOut, onTap: () async {
          await CacheHelper.removeValue(CacheKeys.accessToken);
          GoRouter.of(context).pushReplacement(AppRouterKeys.authScreen);
        }),
      ],
    );
  }
}
