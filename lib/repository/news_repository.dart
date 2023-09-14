import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/news_article.dart';

class NewsRepository {
  static final apiKey = dotenv.env['apiKey'];

  NewsRepository();

  Future<List<NewsArticle>> _fetchNewsArticles(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> articlesData = jsonData['results'];

      final List<NewsArticle> filteredArticles = [];

      for (dynamic articleData in articlesData) {
        NewsArticle article = NewsArticle.fromJson(articleData);

        article = article.copyWith(
          title: removeUnnecessaryCharacters(article.title),
          description: removeUnnecessaryCharacters(article.description),
          content: removeUnnecessaryCharacters(article.content),
        );
        filteredArticles.add(article);
      }

      return filteredArticles;
    } else {
      throw Exception('Failed to fetch news articles');
    }
  }

  String removeUnnecessaryCharacters(String input) {
    final pattern = RegExp(r'[^\x00-\x7F]+'); // Matches non-ASCII characters
    return input.replaceAll(pattern, '');
  }

  Future<List<NewsArticle>> fetchTopHeadlines(
      {List<String> countryList = const ["us"]}) async {
    final countryParameter = countryList.join(',');
    final url =
        "https://newsdata.io/api/1/news?country=$countryParameter&apikey=$apiKey&image=1&video=0&language=en&prioritydomain=top&category=politics,environment";

    return _fetchNewsArticles(url);
  }

  Future<List<NewsArticle>> fetchNews(
      {List<String> categoryList = const ["top"],
      List<String> countryList = const ["us"]}) async {
    final countryParameter = countryList.join(',');
    final categoryParameter = categoryList.join(',');
    final url =
        "https://newsdata.io/api/1/news?apikey=$apiKey&image=1&video=0&language=en&country=$countryParameter&category=$categoryParameter";

    return _fetchNewsArticles(url);
  }

  Future<List<NewsArticle>> searchNews(String keyword) async {
    final url =
        "https://newsdata.io/api/1/news?apikey=$apiKey&image=1&video=0&language=en&q=$keyword";

    return _fetchNewsArticles(url);
  }
}
