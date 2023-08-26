import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerImageWidget extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerImageWidget({
    this.width = 110,
    this.height = 165,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.surfaceVariant,
        highlightColor: Theme.of(context).colorScheme.onSurfaceVariant,
        direction: ShimmerDirection.ltr,
        enabled: true,
        child: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}
