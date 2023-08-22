part of 'top_news_cubit.dart';

class TopNewsState extends Equatable {
  final List<NewsArticle> newsList;
  final DataStatus status;

  const TopNewsState({
    required this.newsList,
    required this.status,
  });

  factory TopNewsState.initial() {
    return const TopNewsState(
      newsList: [],
      status: DataStatus.initial,
    );
  }

  factory TopNewsState.fromJson(Map<String, dynamic> json) {
    final newsList = (json['newsList'] as List<dynamic>)
        .map((articleJson) => NewsArticle.fromJson(articleJson))
        .toList();

    final statusString = json['status'] as String;
    final status = DataStatus.values.firstWhere(
            (element) => element.toString() == 'DataStatus.$statusString');

    return TopNewsState(
      newsList: newsList,
      status: status,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'newsList': newsList.map((article) => article.toJson()).toList(),
      'status': status.toString().split('.').last,
    };
  }

  @override
  String toString() => 'TopNewsState(newsList: $newsList, status: $status)';

  @override
  List<Object> get props => [newsList, status];

  TopNewsState copyWith({
    List<NewsArticle>? newsList,
    DataStatus? status,
  }) {
    return TopNewsState(
      newsList: newsList ?? this.newsList,
      status: status ?? this.status,
    );
  }
}
