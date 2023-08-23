part of 'latest_news_cubit.dart';

class LatestNewsState extends Equatable {
  final List<NewsArticle> newsList;
  final DataStatus status;

  const LatestNewsState({
    required this.newsList,
    required this.status,
  });

  factory LatestNewsState.initial() {
    return const LatestNewsState(
      newsList: [],
      status: DataStatus.initial,
    );
  }

  factory LatestNewsState.fromJson(Map<String, dynamic> json) {
    final newsList = (json['newsList'] as List<dynamic>)
        .map((articleJson) => NewsArticle.fromJson(articleJson))
        .toList();

    final statusString = json['status'] as String;
    final status = DataStatus.values.firstWhere(
            (element) => element.toString() == 'DataStatus.$statusString');

    return LatestNewsState(
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

  LatestNewsState copyWith({
    List<NewsArticle>? newsList,
    DataStatus? status,
  }) {
    return LatestNewsState(
      newsList: newsList ?? this.newsList,
      status: status ?? this.status,
    );
  }
}
