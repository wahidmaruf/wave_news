import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewsShimmerWidget extends StatelessWidget {
  const NewsShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 16.0,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                // width: 150,
                height: 150,
                child: Shimmer.fromColors(
                  baseColor: Theme.of(context).colorScheme.surfaceVariant,
                  highlightColor:
                      Theme.of(context).colorScheme.onSurfaceVariant,
                  direction: ShimmerDirection.ltr,
                  enabled: true,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
        childCount: 8,
      ),
    );
  }
}
