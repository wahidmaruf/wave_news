import 'package:intl/intl.dart';

class NewsArticle {
  final String sourceId;
  final String sourceName;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  NewsArticle({
    required this.sourceId,
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      sourceId: json['source']['id'] ?? "",
      sourceName: json['source']['name'] ?? "",
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] ?? "",
      publishedAt: DateTime.parse(json['publishedAt'] ?? ""), // Parse to DateTime
      content: json['content'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sourceId': sourceId,
      'sourceName': sourceName,
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt.toIso8601String(), // Convert to ISO 8601 string
      'content': content,
    };
  }

  String getFormattedPublishedAt() {
    final now = DateTime.now();
    final difference = now.difference(publishedAt);

    if (difference.inSeconds < 60) {
      return "${difference.inSeconds} seconds ago";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} minutes ago";
    } else if (difference.inMinutes == 60) {
      return "1 hour ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} hours ago";
    } else if (difference.inHours >= 24 && difference.inHours < 36) {
      return "1 day ago";
    } else {
      final formattedDate = DateFormat('MMM d, yyyy, HH:mm').format(publishedAt);
      return formattedDate;
    }
  }
}
