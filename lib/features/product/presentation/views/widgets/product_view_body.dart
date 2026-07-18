import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/utils/context_extension.dart';
import 'package:shop/core/widgets/custom_app_bar.dart';
import 'package:shop/features/product/presentation/views/widgets/product_details_section.dart';
import 'package:shop/features/product/presentation/views/widgets/product_image_section.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key, this.product});

  final dynamic product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 22, vertical: 50),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: context.tr.product),
            SizedBox(height: 27.h),
            ProductImageSection(product: product),
            SizedBox(height: 36.h),
            ProductDetailsSection(product: product),
          ],
        ),
      ),
    );
  }
}
