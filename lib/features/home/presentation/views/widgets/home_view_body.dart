import 'package:flutter/material.dart';
import 'package:shop/features/home/presentation/views/sections/all_featured_section.dart';
import 'package:shop/features/home/presentation/views/widgets/products_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [AllFeaturedSection(), ProductsGridView()],
    );
  }
}
