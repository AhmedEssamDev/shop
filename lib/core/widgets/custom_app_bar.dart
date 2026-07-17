import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const SizedBox(width: double.infinity),
        PositionedDirectional(start: 0, child: GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: SvgPicture.asset(AppSvgs.back, matchTextDirection: true))),
        Text(title, style: AppTextStyles.textStyle18),
      ],
    );
  }
}
