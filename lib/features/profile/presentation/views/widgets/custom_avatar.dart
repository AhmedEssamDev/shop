import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96.w,
      height: 96.h,
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          'https://i.pinimg.com/1200x/54/8a/65/548a659c2b06a877516d3c998f5b0939.jpg',
        ),
      ),
    );
  }
}
