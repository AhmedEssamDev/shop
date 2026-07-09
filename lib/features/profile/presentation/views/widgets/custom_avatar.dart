import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/widgets/custom_network_image.dart';
class CustomAvatar extends StatelessWidget {
  const CustomAvatar({super.key, this.imageUrl,});
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96.w,
      height: 96.h,
      child: imageUrl != null && imageUrl!.isNotEmpty
          ? CustomNetworkImage(
              imageUrl: imageUrl!,
              isCircular: true,
              width: 96.w,
              height: 96.h,
            )
          : const CircleAvatar(
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
    );
  }
}
