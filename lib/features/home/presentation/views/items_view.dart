import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/network/api_helper.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/features/home/data/repos/home_repo_impl.dart';
import 'package:shop/features/home/presentation/manger/categories/cubit/categories_cubit.dart';
import 'package:shop/features/home/presentation/views/widgets/items_view_body.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CategoriesCubit(HomeRepoImpl(ApiHelper()))..getCategories();
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: ItemsViewBody(),
      ),
    );
  }
}
