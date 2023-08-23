import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/news_article.dart';

class NewsRepository {
  final String baseUrl = 'https://newsapi.org/v2';
  static final apiKey = dotenv.env['apiKey'];

  NewsRepository();

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    final response = await http
        .get(Uri.parse('$baseUrl/top-headlines?country=us&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> articlesData = jsonData['articles'];

      return articlesData
          .map((articleData) => NewsArticle.fromJson(articleData))
          .toList();
    } else {
      throw Exception('Failed to fetch news articles');
    }
  }

  Future<List<NewsArticle>> fetchNews({String keyword = "latest"}) async {
    final response = await http
        .get(Uri.parse('$baseUrl/everything?q=$keyword&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> articlesData = jsonData['articles'];

      return articlesData
          .map((articleData) => NewsArticle.fromJson(articleData))
          .toList();
    } else {
      throw Exception('Failed to fetch news articles');
    }
  }
}
