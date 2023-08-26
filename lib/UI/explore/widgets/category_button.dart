import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    required this.text,
    required this.onTap,
    super.key,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
            foregroundColor:
            Theme.of(context).colorScheme.onTertiaryContainer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            side: BorderSide(color: Theme.of(context).colorScheme.outline, width: 1)),
        onPressed: onTap

        ,
        child: Text(
          text,
          style: GoogleFonts.lato(
            fontSize: 15,
          ),
        )
    );
  }
}