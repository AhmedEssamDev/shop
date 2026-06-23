import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/core/utils/app_text_styles.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key, required this.leading, required this.title,  this.trailing});
  final String leading;
  final String title;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(leading),
      title: Text(
        title,
        style: AppTextStyles.textStyle18.copyWith(fontWeight: FontWeight.w500),
      ),
      trailing: trailing != null ? SvgPicture.asset(trailing!) : null,
    );
  }
}
