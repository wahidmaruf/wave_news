import 'package:intl/intl.dart';

class NewsArticle {
  final String title;
  final String link;
  final List<String> keywords;
  final List<String> creator;
  final String videoUrl;
  final String description;
  final String content;
  final DateTime pubDate;
  final String imageUrl;
  final String sourceId;
  final int sourcePriority;
  final List<String> country;
  final List<String> category;
  final String language;

  NewsArticle({
    required this.title,
    required this.link,
    required this.keywords,
    required this.creator,
    required this.videoUrl,
    required this.description,
    required this.content,
    required this.pubDate,
    required this.imageUrl,
    required this.sourceId,
    required this.sourcePriority,
    required this.country,
    required this.category,
    required this.language,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] as String? ?? "",
      link: json['link'] as String? ?? "",
      keywords: json['keywords'] != null
          ? List<String>.from(json['keywords'] ?? [])
          : [],
      creator: json['creator'] != null
          ? List<String>.from(json['creator'] ?? [])
          : [],
      videoUrl: json['video_url'] as String? ?? "",
      description: json['description'] as String? ?? "",
      content: json['content'] as String? ?? "",
      pubDate: DateTime.parse(json['pubDate'] as String? ?? ""),
      imageUrl: json['image_url'] as String? ?? "",
      sourceId: json['source_id'] as String? ?? "",
      sourcePriority: json['source_priority'] as int? ?? 0,
      country:  json['country'] != null
          ? List<String>.from(json['country'])
          : [],
      category:   json['category'] != null
          ? List<String>.from(json['category'])
          : [],
      language: json['language'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'link': link,
      'keywords': keywords,
      'creator': creator,
      'video_url': videoUrl,
      'description': description,
      'content': content,
      'pubDate': pubDate.toIso8601String(),
      'image_url': imageUrl,
      'source_id': sourceId,
      'source_priority': sourcePriority,
      'country': country,
      'category': category,
      'language': language,
    };
  }

  String getFormattedPublishedAt() {
    final now = DateTime.now();
    final difference = now.difference(pubDate);

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
      final formattedDate = DateFormat('MMM d, yyyy, HH:mm').format(pubDate);
      return formattedDate;
    }
  }
}





