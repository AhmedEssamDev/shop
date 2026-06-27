import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/network/api_helper.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/features/home/data/repos/home_repo_impl.dart';
import 'package:shop/features/home/presentation/manger/best_sellers/cubit/best_seller_cubit.dart';
import 'package:shop/features/home/presentation/manger/categories/cubit/categories_cubit.dart';
import 'package:shop/features/home/presentation/manger/sliders/cubit/sliders_cubit.dart';
import 'package:shop/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
        BlocProvider(
          create: (context) =>
              BestSellerCubit(HomeRepoImpl(ApiHelper()))..getBestSeller(),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: HomeViewBody(),
      ),
    );
  }
}
