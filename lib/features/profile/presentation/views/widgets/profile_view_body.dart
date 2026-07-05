import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/core/router/app_router_keys.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/features/profile/presentation/views/widgets/custom_avatar.dart';
import 'package:shop/features/profile/presentation/views/widgets/list_tile_widget.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 23.h),
            Text('Profile',style: AppTextStyles.textStyle18,),
            SizedBox(height: 32.h),
            CustomAvatar(),
            SizedBox(height: 19.h),
            Text('User full Name',style: AppTextStyles.textStyle18.copyWith(
              color: AppColors.primary
            ),),
            SizedBox(height: 40.h),
           ListTileWidget(
            leading: AppSvgs.profile,
            title: 'My Profile',
            trailing: AppSvgs.forward, onTap: () { 
              GoRouter.of(context).push(AppRouterKeys.editProfile);
             },
           ),
           ListTileWidget(
            leading: AppSvgs.order,
            title: 'My Orders',
            trailing: AppSvgs.forward, onTap: () {  },
           ),
           ListTileWidget(
            leading: AppSvgs.favorite,
            title: 'My Favorites',
            trailing: AppSvgs.forward, onTap: () {  },
           ),
           ListTileWidget(
            leading: AppSvgs.setting,
            title: 'Settings',
            trailing: AppSvgs.forward, onTap: () {  },
           ),
           SizedBox(height: 32.h),
           Container(
            width: 308.w,
            height: 1.h,
            color: AppColors.primary,
           ),
           SizedBox(height: 32.h,),
           ListTileWidget(
            leading: AppSvgs.logout,
            title: 'Log Out', onTap: () {  },
           ),
          
          ],
        ),
      ),
    );
  }
}
