import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageErrorWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const PageErrorWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Something went wrong. Please try again later!",
            style: GoogleFonts.urbanist(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
                "Retry",
              style: GoogleFonts.raleway(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
