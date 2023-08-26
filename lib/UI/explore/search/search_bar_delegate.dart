import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarDelegate extends SliverPersistentHeaderDelegate {
  SearchBarDelegate({required this.onTap});
  final VoidCallback onTap;

  double height = 56.0;

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        height: height,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Theme.of(context).colorScheme.secondaryContainer,
              height: 48,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.search),
                    Text(
                      "Search news",
                      style: GoogleFonts.openSans(
                        color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(SearchBarDelegate oldDelegate) {
    return false;
  }
}
