import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/features/profile/presentation/views/widgets/favorite_view_body.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: const FavoriteViewBody(),
    );
  }
}