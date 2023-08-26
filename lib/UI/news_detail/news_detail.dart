import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wavenews/UI/common/custom_image_widget.dart';
import 'package:wavenews/models/news_article.dart';

class NewsDetail extends StatelessWidget {
  const NewsDetail({required this.news, super.key});

  final NewsArticle news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomImageWidget(
              width: MediaQuery.of(context).size.width,
              height: 250,
              imageUrl: news.imageUrl,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    style: GoogleFonts.urbanist(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    news.getFormattedPublishedAt(),
                    style: GoogleFonts.openSans(
                        fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    news.description,
                    style: GoogleFonts.openSans(
                        fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    news.content,
                    style: GoogleFonts.lato(
                        fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
