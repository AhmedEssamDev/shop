import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(child: Text('hello profile'),),
    );
  }
}