import 'package:flutter/material.dart';
import 'package:wavenews/models/news_article.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({required this.news, super.key});

  final NewsArticle news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ""
        ),
      ),
    );
  }
}
