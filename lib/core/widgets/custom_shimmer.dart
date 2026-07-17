import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double? width;
  final double? height;
  final ShapeBorder shapeBorder;

  const CustomShimmer.rectangular({
    super.key,
    this.width,
    required this.height,
  })  : shapeBorder = const RoundedRectangleBorder(),
        _borderRadius = null;

  const CustomShimmer.circular({
    super.key,
    this.width,
    required this.height,
    this.shapeBorder = const CircleBorder(),
  })  : _borderRadius = null;

  const CustomShimmer.roundedRectangular({
    super.key,
    this.width,
    required this.height,
    required BorderRadius borderRadius,
  })  : shapeBorder = const RoundedRectangleBorder(borderRadius: BorderRadius.zero), // Dummy, we use container decoration
        _borderRadius = borderRadius;

  final BorderRadius? _borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: _borderRadius != null
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: _borderRadius,
              )
            : ShapeDecoration(
                color: Colors.white,
                shape: shapeBorder,
              ),
      ),
    );
  }
}
