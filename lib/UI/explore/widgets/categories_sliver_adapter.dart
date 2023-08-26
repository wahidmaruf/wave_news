import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wavenews/UI/explore/widgets/category_button.dart';
import 'package:wavenews/UI/news_list/news_list_page.dart';
import 'package:wavenews/utils/app_defaults.dart';

class CategoriesSliverAdapter extends StatelessWidget {
  const CategoriesSliverAdapter({
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
              "Categories",
              style: GoogleFonts.urbanist(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing: 8,
              runSpacing: 4,
              children: AppDefaults.categories.map((category) {
                return CategoryButton(
                  text: category,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsListPage(
                                title: category,
                                keyword: category.toString())));
                  },
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}


