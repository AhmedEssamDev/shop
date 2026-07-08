import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';
import 'package:shop/features/profile/presentation/manger/user_data/user_data_cubit.dart';
import 'package:shop/features/profile/presentation/views/widgets/custom_avatar.dart';

class UserDataSection extends StatelessWidget {
  const UserDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        var cubit = UserDataCubit.get(context);
        if (state is UserDataLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserDataError) {
          return Center(child: Text(state.message));
        }
        return Column(
          children: [
            SizedBox(height: 23.h),
            Text('Profile', style: AppTextStyles.textStyle18),
            SizedBox(height: 32.h),
            CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.primary,
              backgroundImage:
                  (cubit.userData?.imagePath != null &&
                          cubit.userData!.imagePath!.isNotEmpty)
                      ? NetworkImage(cubit.userData!.imagePath!)
                      : null,
              child: (cubit.userData?.imagePath == null ||
                      cubit.userData!.imagePath!.isEmpty)
                  ? const Icon(Icons.person, size: 50, color: Colors.white)
                  : null,
            ),
            SizedBox(height: 19.h),
            Text(
              cubit.userData?.name ?? 'Unknown',
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
