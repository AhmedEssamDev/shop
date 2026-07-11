import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/widgets/custom_app_bar.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: REdgeInsets.symmetric(horizontal: 22, vertical: 50),
      child: Column(
        children: [
          CustomAppBar(title: 'My Favorites'),
        ],
      ),
    );
  }
}