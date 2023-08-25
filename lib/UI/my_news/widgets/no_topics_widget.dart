import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wavenews/utils/app_utils.dart';

class NoTopicsWidget extends StatelessWidget {
  const NoTopicsWidget({super.key, required this.sheetSize});

  final Size sheetSize;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "Add topics",
                style: GoogleFonts.urbanist(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              TextSpan(
                text: " to form your personalized news stream",
                style: GoogleFonts.openSans(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              )
            ])),
            const SizedBox(
              height: 15,
            ),
            const Text(
                "You'll find all the most recent stories related to your chosen topics displayed here."),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide.none)),
                onPressed: () {
                  AppUtils.showTopicsSheet(sheetSize, context);
                },
                child: const Text("Lets get started"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
