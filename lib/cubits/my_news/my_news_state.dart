part of 'my_news_cubit.dart';

class MyNewsState extends Equatable {
  final List<NewsArticle> newsList;
  final List<String> categoryList;
  final DataStatus status;
  final bool showNoTopics;

  const MyNewsState({
    required this.newsList,
    required this.categoryList,
    required this.status,
    required this.showNoTopics,
  });

  factory MyNewsState.initial() {
    return const MyNewsState(
      newsList: [],
      categoryList: [],
      status: DataStatus.success,
      showNoTopics: true,
    );
  }

  factory MyNewsState.fromJson(Map<String, dynamic> json) {
    final newsList = (json['newsList'] as List<dynamic>)
        .map((articleJson) => NewsArticle.fromJson(articleJson))
        .toList();

    final categoryList = (json['categoryList'] as List<dynamic>)
        .map((category) => category as String)
        .toList();

    final statusString = json['status'] as String;
    final status = DataStatus.values.firstWhere(
            (element) => element.toString() == 'DataStatus.$statusString');

    return MyNewsState(
      newsList: newsList,
      categoryList: categoryList,
      status: status,
      showNoTopics: json['showNoTopics'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'newsList': newsList.map((article) => article.toJson()).toList(),
      'categoryList': categoryList,
      'status': status.toString().split('.').last,
      'showNoTopics': showNoTopics,
    };
  }

  @override
  String toString() =>
      'TopNewsState(newsList: $newsList, categoryList: $categoryList, status: $status, showNoTopics: $showNoTopics)';

  @override
  List<Object> get props =>
      [newsList, categoryList, status, showNoTopics];

  MyNewsState copyWith({
    List<NewsArticle>? newsList,
    List<Country>? countryList,
    List<String>? categoryList,
    DataStatus? status,
    bool? showNoTopics,
  }) {
    return MyNewsState(
      newsList: newsList ?? this.newsList,
      categoryList: categoryList ?? this.categoryList,
      status: status ?? this.status,
      showNoTopics: showNoTopics ?? this.showNoTopics,
    );
  }
}


