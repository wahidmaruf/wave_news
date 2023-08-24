import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wavenews/UI/common/custom_image_widget.dart';
import 'package:wavenews/UI/news_detail/news_detail.dart';
import '../../../models/news_article.dart';
import '../../common/news_card.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    super.key,
    required this.newsList,
  });

  final List<NewsArticle> newsList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final news = newsList[index];
          if (index == 0) {
            return GestureDetector(
              onTap: () {
                pushNewsDetail(context, news);
              },
              child: Column(
                children: [
                  CustomImageWidget(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    imageUrl: news.urlToImage,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 5, bottom: 12),
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
                          style: GoogleFonts.urbanist(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return NewsCard(
            news: news,
          );
        },
        childCount: newsList.length,
      ),
    );
  }

  void pushNewsDetail(BuildContext context, NewsArticle news) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => NewsDetail(news: news)));
  }
}
