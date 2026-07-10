import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

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
    Widget imageWidget = FancyShimmerImage(
      imageUrl: imageUrl,
      width: width ?? 300,
      height: height ?? 300,
      boxFit: fit ?? BoxFit.cover,
      shimmerBaseColor: Colors.grey[300],
      shimmerHighlightColor: Colors.grey[100],
      shimmerBackColor: Colors.transparent,
      errorWidget: Container(
        width: width,
        height: height,
        color: Colors.grey[200],
        child: const Icon(Icons.error_outline, color: Colors.grey),
      ),
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
