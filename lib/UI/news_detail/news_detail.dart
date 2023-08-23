import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wavenews/UI/common/custom_image_widget.dart';
import 'package:wavenews/models/news_article.dart';

class NewsDetail extends StatelessWidget {
  const NewsDetail({required this.newsArticle, super.key});

  final NewsArticle newsArticle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomImageWidget(
              width: MediaQuery.of(context).size.width,
              height: 250,
              imageUrl: newsArticle.urlToImage,
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsArticle.title,
                    style: GoogleFonts.urbanist(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    newsArticle.getFormattedPublishedAt(),
                    style: GoogleFonts.urbanist(
                        fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    newsArticle.description,
                    style: GoogleFonts.lato(
                        fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    newsArticle.content,
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
