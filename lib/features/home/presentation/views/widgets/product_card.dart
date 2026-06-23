import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_text_styles.dart';

class productCard extends StatelessWidget {
  const productCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 3, // إضافة ظل
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ), // حواف دائرية
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                'https://petapixel.com/assets/uploads/2024/01/The-Star-of-System-Sol-Rectangle-640x800.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: REdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mens Starry',
                  style: AppTextStyles.textStyle16.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
                Text(
                  'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
                  style: AppTextStyles.textStyle10,
                ),
                SizedBox(height: 4.h),
    
                Text('₹399', style: AppTextStyles.textStyle12),
                SizedBox(height: 4.h),
                Icon(Icons.star, size: 14.r, color: Colors.amber),
                SizedBox(height: 8.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
