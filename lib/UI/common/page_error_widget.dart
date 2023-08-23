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
            style: GoogleFonts.lato(
              color: Colors.black,
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }
}
