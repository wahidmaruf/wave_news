import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});
  static final String? contactEmail = dotenv.env['contactUs'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(0xff071a52),
        centerTitle: true,
        title: Text(
          "Contact Us",
          style: GoogleFonts.urbanist(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You can reach us at:',
              style: GoogleFonts.urbanist(
                fontSize: 20,
                  color: Theme.of(context).colorScheme.onSecondary
              ),
            ),
            const SizedBox(height: 10),
            Text(
              contactEmail ?? 'contact@example.com',
              style: GoogleFonts.urbanist(
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
