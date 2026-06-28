import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/features/home/presentation/manger/categories/cubit/categories_cubit.dart';
import 'package:shop/features/home/presentation/views/widgets/category_widget.dart';

class AllFeaturedListViewItems extends StatelessWidget {
  const AllFeaturedListViewItems({super.key});

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
            var cubit = CategoriesCubit.get(context);
            if (state is CategoriesLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CategoriesFailure) {
              return Center(child: Text(state.errMessage));
            } else {
              return SizedBox(
                height: 85.h,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: cubit.categories!.length,
                  itemBuilder: (context, index) {
                    return CategoryWidget(cubit: cubit, index: index);
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
