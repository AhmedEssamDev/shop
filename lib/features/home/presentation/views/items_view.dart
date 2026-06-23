import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/features/home/presentation/views/widgets/items_view_body.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ItemsViewBody(),
    );
  }
}