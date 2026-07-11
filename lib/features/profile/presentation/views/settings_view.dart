import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/features/profile/presentation/views/widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SettingsViewBody(),
    );
  }
}