import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wavenews/UI/common/custom_sliver_app_bar.dart';
import 'package:wavenews/UI/settings/contact_us_page.dart';
import 'package:wavenews/cubits/theme/theme_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: const Color(0xff071a52),
        centerTitle: true,
        title: Text(
          "Settings",
          style: GoogleFonts.urbanist(color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Theme
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Theme",
                    style: GoogleFonts.openSans(fontSize: 18),
                  ),

                  /// Change Theme
                  BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, state) {
                      return IconButton(
                        color: state.themeMode == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                        icon: state.themeMode == ThemeMode.light
                            ? const Icon(Icons.light_mode)
                            : const Icon(Icons.dark_mode),
                        onPressed: () {
                          context.read<ThemeCubit>().changeTheme();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),

            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContactUsPage()));
                },
                child: Text(
                  "Contact us",
                  style: GoogleFonts.openSans(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.onSecondary),
                ))
          ],
        ),
      ),
    );
  }
}
