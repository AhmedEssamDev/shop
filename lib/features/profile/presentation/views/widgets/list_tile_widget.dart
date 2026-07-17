import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/core/utils/app_text_styles.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key, required this.leading, required this.title,  this.trailing,required this.onTap});
  final String leading;
  final String title;
  final String? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: SvgPicture.asset(leading),
        title: Text(
          title,
          style: AppTextStyles.textStyle18.copyWith(fontWeight: FontWeight.w500),
        ),
        trailing: trailing != null ? SvgPicture.asset(trailing!, matchTextDirection: true) : null,
      ),
    );
  }
}
