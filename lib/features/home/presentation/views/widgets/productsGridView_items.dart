import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/features/home/presentation/manger/categories/cubit/categories_cubit.dart';
import 'package:shop/features/home/presentation/views/widgets/product_card.dart';

class ProductsGridViewItems extends StatelessWidget {
  const ProductsGridViewItems({super.key,});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        var cubit = CategoriesCubit.get(context);
        final products = cubit.categories?[cubit.currentIndex]?.products ?? [];
        if (state is CategoriesLoading) {
          // حل المشكلة: غلف الـ Center بـ SliverToBoxAdapter
          return const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (state is CategoriesFailure) {
          // حل المشكلة: غلف الـ Center بـ SliverToBoxAdapter
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errMessage)),
          );
        }else{
          return SliverPadding(
            padding: REdgeInsets.all(16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: products.length,
                (context, index) {
                  return productCard(
                    product: products[index],
                    );
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
        }
      },
    );
  }
}
