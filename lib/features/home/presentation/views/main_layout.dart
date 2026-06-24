import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/features/home/presentation/manger/sliders/cubit/sliders_cubit.dart';
import 'package:shop/features/home/presentation/views/home_view.dart';
import 'package:shop/features/home/presentation/views/items_view.dart';
import 'package:shop/features/home/presentation/views/widgets/bottom_navigation_bar.dart';
import 'package:shop/features/profile/presentation/views/profile_view.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/network/api_helper.dart';
import 'package:shop/features/home/data/repos/home_repo_impl.dart';
import 'package:shop/features/home/presentation/manger/categories/cubit/categories_cubit.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CategoriesCubit(HomeRepoImpl(ApiHelper()))..getCategories(),
        ),
        BlocProvider(
          create: (context) =>
              SlidersCubit(HomeRepoImpl(ApiHelper()))..getSliders(),
        ),
      ],
      child: Scaffold(
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
            onPressed: () {},
            child: SvgPicture.asset(
              AppSvgs.bag,
              colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
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
      ),
    );
  }
}
