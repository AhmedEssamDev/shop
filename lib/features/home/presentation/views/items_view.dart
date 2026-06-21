import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_colors.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(child: Text('hello items'),),
    );
  }
}