import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/features/home/presentation/manger/categories/cubit/categories_cubit.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.cubit, required this.index});

  final CategoriesCubit cubit;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        cubit.changeIndex(index);
      },
      child: Padding(
        padding: REdgeInsets.only(left: 8.0),
        child: Column(
          children: [
            Container(
              width: 60.w,
              height: 60.h,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  cubit.categories![index].imagePath ?? '',
                ),
              ),
            ),
            Text(
              cubit.categories![index].title ?? 'Unknown',
              style: AppTextStyles.textStyle10.copyWith(
                color: cubit.currentIndex == index
                    ? AppColors.primary
                    : Color(0xff21003D),
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
