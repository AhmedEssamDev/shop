import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({super.key, this.imageUrl,});
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96.w,
      height: 96.h,
      child: CircleAvatar(
        backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
        child: imageUrl == null 
            ? const Icon(Icons.person, size: 50, color: Colors.white) 
            : null,
      ),
    );
  }
}
