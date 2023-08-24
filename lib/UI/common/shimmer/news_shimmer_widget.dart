import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wavenews/utils/color_constraint.dart';

class NewsShimmerWidget extends StatelessWidget {
  const NewsShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverList(
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
                          baseColor: CustomColors.shimmerBaseColor,
                          highlightColor: CustomColors.shimmerHighlightColor,
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
            )
          ],
        ),
      ),
    );
  }
}
