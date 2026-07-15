import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/features/home/presentation/views/home_view.dart';
import 'package:shop/features/home/presentation/views/items_view.dart';
import 'package:shop/features/home/presentation/views/widgets/bottom_navigation_bar.dart';
import 'package:shop/features/profile/presentation/views/profile_view.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/core/router/app_router_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/product/presentation/manger/cubit/cart_cubit.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  final List<Widget> screens = [HomeView(), ItemsView(), ProfileView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.secondary.withAlpha(65),
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: AppColors.primary,
          onPressed: () => context.push(AppRouterKeys.cart),
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              final count = CartCubit.get(context).cartCount;
              return Badge(
                isLabelVisible: count > 0,
                label: Text(count.toString()),
                child: SvgPicture.asset(
                  AppSvgs.bag,
                  colorFilter: ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: currentIndex,
        onTap: (p0) {
          setState(() {
            currentIndex = p0;
          });
        },
      ),
      body: IndexedStack(index: currentIndex, children: screens),
    );
  }
}
