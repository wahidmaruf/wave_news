import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wavenews/UI/common/custom_image_widget.dart';
import '../../../models/news_article.dart';

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
            return Column(
              children: [
                CustomImageWidget(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  imageUrl: news.urlToImage,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
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
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Container(
              color: Theme.of(context).colorScheme.secondaryContainer,
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
          );
        },
        childCount: newsList.length,
      ),
    );
  }
}
