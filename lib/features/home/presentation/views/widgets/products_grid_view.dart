import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/features/home/presentation/manger/best_sellers/cubit/best_seller_cubit.dart';
import 'package:shop/features/home/presentation/views/widgets/product_card.dart';
import 'package:shop/core/widgets/product_card_shimmer.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit, BestSellerState>(
      builder: (context, state) {
        var cubit = BestSellerCubit.get(context);
        if (state is BestSellerSuccess) {
          return SliverPadding(
            padding: REdgeInsets.all(16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: cubit.bestSeller?.length,
                (context, index) {
                  final reversedIndex = cubit.bestSeller!.length - 1 - index;
                  return ProductCard(product: cubit.bestSeller![reversedIndex]);
                },
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          );
        } else if (state is BestSellerLoading) {
          return SliverPadding(
            padding: REdgeInsets.all(16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: 4, // Show 4 skeleton items
                (context, index) {
                  return const ProductCardShimmer();
                },
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          );
        } else if (state is BestSellerFailure) {
          // حل المشكلة: غلف الـ Center بـ SliverToBoxAdapter
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        }
        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
