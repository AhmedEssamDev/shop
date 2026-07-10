import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/features/home/presentation/manger/categories/cubit/categories_cubit.dart';
import 'package:shop/core/widgets/category_shimmer.dart';
import 'package:shop/core/widgets/custom_network_image.dart';
class AllFeaturedListView extends StatelessWidget {
  const AllFeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: REdgeInsets.only(left: 8),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              'All Featured',
              style: AppTextStyles.textStyle18.copyWith(
                color: AppColors.secondary,
              ),
            ),
          ),
        ),
        SizedBox(height: 25.h),
        BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            var cubit  = CategoriesCubit.get(context);
            if (state is CategoriesSuccess) {
              return SizedBox(
                height: 85.h,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: cubit.categories!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: REdgeInsets.only(left: 8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 60.w,
                            height: 60.h,
                            child: CustomNetworkImage(
                              imageUrl: cubit.categories![index].imagePath?? '',
                              isCircular: true,
                              width: 60.w,
                              height: 60.h,
                            ),
                          ),
                          Text(
                            cubit.categories![index].title?? 'Unknown',
                            style: AppTextStyles.textStyle10.copyWith(
                              color: Color(0xff21003D),
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else if (state is CategoriesLoading) {
              return SizedBox(
                height: 85.h,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 6, // Show 6 skeleton items
                  itemBuilder: (context, index) {
                    return const CategoryShimmer();
                  },
                ),
              );
            } else if (state is CategoriesFailure) {
              return Center(child: Text(state.errMessage));
            }
            return Container();
          },
        ),
      ],
    );
  }
}
