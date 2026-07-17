import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/features/profile/presentation/manger/user_data/user_data_cubit.dart';

import 'package:shop/core/widgets/user_data_shimmer.dart';
import 'package:shop/core/widgets/custom_network_image.dart';
import 'package:shop/core/utils/context_extension.dart';

class UserDataSection extends StatelessWidget {
  const UserDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        var cubit = UserDataCubit.get(context);
        if (state is UserDataLoading) {
          return const UserDataShimmer();
        } else if (state is UserDataError) {
          return Center(child: Text(state.message));
        }
        return Column(
          children: [
            SizedBox(height: 23.h),
            Text(context.tr.profile, style: AppTextStyles.textStyle18),
            SizedBox(height: 32.h),
            (cubit.userData?.imagePath != null && cubit.userData!.imagePath!.isNotEmpty)
                ? CustomNetworkImage(
                    imageUrl: cubit.userData!.imagePath!,
                    isCircular: true,
                    width: 100, // radius 50 * 2
                    height: 100,
                  )
                : CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.primary,
                    child: const Icon(Icons.person, size: 50, color: Colors.white),
                  ),
            SizedBox(height: 19.h),
            Text(
              cubit.userData?.name ?? context.tr.unknown,
              style: AppTextStyles.textStyle18.copyWith(
                color: AppColors.primary,
              ),
            ),
          ],
        );
      },
    );
  }
}
