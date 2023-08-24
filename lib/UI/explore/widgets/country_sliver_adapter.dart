import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wavenews/UI/news_list/news_list_page.dart';
import 'package:wavenews/utils/app_utils.dart';

class CountrySliverAdapter extends StatelessWidget {
  const CountrySliverAdapter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "More",
              style: GoogleFonts.urbanist(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing: 8,
              runSpacing: 4,
              children: AppUtils.countries.map((country) {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        backgroundColor: Colors.grey.shade200,
                        foregroundColor:
                            Theme.of(context).colorScheme.secondary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        side: const BorderSide(color: Colors.grey, width: 1)),
                    onPressed: () {
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewsListPage(
                                    title: country.countryName,
                                    keyword: country.countryCode)));
                      }
                    },
                    child: Text(country.countryName));
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
