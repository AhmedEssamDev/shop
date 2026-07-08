import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/network/api_helper.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/features/profile/data/repo/user_data_repo_impl.dart';
import 'package:shop/features/profile/presentation/manger/user_data/user_data_cubit.dart';
import 'package:shop/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) =>UserDataCubit(UserDataRepoImpl(ApiHelper()))..getUserData(),
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: ProfileViewBody(),
        ),
      ),
    );
  }
}