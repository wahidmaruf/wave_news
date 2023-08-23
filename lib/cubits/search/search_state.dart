part of 'search_cubit.dart';

class SearchState extends Equatable {
  final List<NewsArticle> newsList;
  final DataStatus status;

  const SearchState({
    required this.newsList,
    required this.status,
  });

  factory SearchState.initial() {
    return const SearchState(
      newsList: [],
      status: DataStatus.initial,
    );
  }

  factory SearchState.fromJson(Map<String, dynamic> json) {
    final newsList = (json['newsList'] as List<dynamic>)
        .map((articleJson) => NewsArticle.fromJson(articleJson))
        .toList();

    final statusString = json['status'] as String;
    final status = DataStatus.values.firstWhere(
            (element) => element.toString() == 'DataStatus.$statusString');

    return SearchState(
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

  SearchState copyWith({
    List<NewsArticle>? newsList,
    DataStatus? status,
  }) {
    return SearchState(
      newsList: newsList ?? this.newsList,
      status: status ?? this.status,
    );
  }
}
