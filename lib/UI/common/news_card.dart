import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wavenews/UI/news_detail/news_detail.dart';
import 'package:wavenews/models/news_article.dart';
import 'custom_image_widget.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.news,
  });

  final NewsArticle news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushNewsDetail(context, news);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
        child: Container(
          color: Theme
              .of(context)
              .colorScheme
              .secondaryContainer,
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageWidget(
                width: 100,
                height: 100,
                imageUrl: news.urlToImage,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.urbanist(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        news.getFormattedPublishedAt(),
                        style: GoogleFonts.urbanist(
                            fontSize: 12, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void pushNewsDetail(BuildContext context, NewsArticle news) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewsDetail(newsArticle: news))
    );
  }
}