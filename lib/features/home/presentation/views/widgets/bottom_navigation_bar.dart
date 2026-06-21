import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: AppColors.primary,
      items: [
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            AppSvgs.home,
            colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
          ),
          icon: SvgPicture.asset(AppSvgs.home),
          label: 'home',
        ),
        BottomNavigationBarItem(
           activeIcon: SvgPicture.asset(
            AppSvgs.cart,
            colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
          ),
          icon: SvgPicture.asset(AppSvgs.cart),
          label: 'cart',
        ),
        BottomNavigationBarItem(
           activeIcon: SvgPicture.asset(
            AppSvgs.profile,
            colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
          ),
          icon: SvgPicture.asset(AppSvgs.profile),
          label: 'profile',
        ),
      ],
    );
    ;
  }
}
