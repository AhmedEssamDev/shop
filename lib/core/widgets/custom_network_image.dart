import 'package:flutter/material.dart';
import 'package:shop/core/widgets/custom_shimmer.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool isCircular;
  final BorderRadius? borderRadius;

  const CustomNetworkImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.isCircular = false,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        if (isCircular) {
          return CustomShimmer.circular(width: width, height: height ?? width);
        } else if (borderRadius != null) {
          return CustomShimmer.roundedRectangular(
            width: width,
            height: height,
            borderRadius: borderRadius!,
          );
        } else {
          return CustomShimmer.rectangular(width: width, height: height);
        }
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          color: Colors.grey[200],
          child: const Icon(Icons.error_outline, color: Colors.grey),
        );
      },
    );

    if (isCircular) {
      return ClipOval(child: imageWidget);
    } else if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: imageWidget,
      );
    }

    return imageWidget;
  }
}
