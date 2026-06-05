import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/features/auth/auth_screen/auth_screen_view_body.dart';

class AuthScreenView extends StatelessWidget {
  const AuthScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.authBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        body: const AuthScreenViewBody(),
      ),
    );
  }
}

class AppAssets {
}