import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/core/widgets/custom_app_bar.dart';
import 'package:shop/core/widgets/custom_search_field.dart';
import 'package:shop/features/home/presentation/manger/search/cubit/search_cubit.dart';
import 'package:shop/features/home/presentation/views/widgets/product_card.dart';
import 'package:shop/core/widgets/product_card_shimmer.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    var cubit = SearchCubit.get(context);

    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 22, vertical: 50),
      child: Column(
        children: [
          CustomAppBar(title: 'Search'),
          SizedBox(height: 34.h),
          CustomSearchField(
            controller: searchController,
            readOnly: false,
            onChanged: (value) {
              cubit.search(value);
            },
          ),
          SizedBox(height: 17.h),

          // هنا نقوم بعمل BlocBuilder للنتائج فقط
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 4, // Show 4 skeleton items
                    itemBuilder: (context, index) {
                      return const ProductCardShimmer();
                    },
                  );
                } else if (state is SearchFailure) {
                  return Center(child: Text(state.errMessage));
                }

                // عرض النتائج
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          '${cubit.products.length} items',
                          style: AppTextStyles.textStyle18,
                        ),
                      ),
                      SizedBox(height: 17.h),
                      GridView.builder(
                        // استخدم GridView.builder بدلاً من List.generate لسهولة التعامل
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.6,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                        itemCount: cubit.products.length,
                        itemBuilder: (context, index) {
                          final product = cubit.products[index];
                          return productCard(product: product);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
