part of 'my_news_cubit.dart';

class MyNewsState extends Equatable {
  final List<NewsArticle> newsList;
  final List<Country> countryList;
  final List<String> categoryList;
  final DataStatus status;

  const MyNewsState({
    required this.newsList,
    required this.countryList,
    required this.categoryList,
    required this.status,
  });

  factory MyNewsState.initial() {
    return const MyNewsState(
      newsList: [],
      countryList: [],
      categoryList: [],
      status: DataStatus.success,
    );
  }

  factory MyNewsState.fromJson(Map<String, dynamic> json) {
    final newsList = (json['newsList'] as List<dynamic>)
        .map((articleJson) => NewsArticle.fromJson(articleJson))
        .toList();

    final countryList = (json['countryList'] as List<dynamic>)
        .map((countryJson) => Country.fromJson(countryJson))
        .toList();

    final categoryList = (json['categoryList'] as List<dynamic>)
        .map((category) => category as String)
        .toList();

    final statusString = json['status'] as String;
    final status = DataStatus.values.firstWhere(
            (element) => element.toString() == 'DataStatus.$statusString');

    return MyNewsState(
      newsList: newsList,
      countryList: countryList,
      categoryList: categoryList,
      status: status,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'newsList': newsList.map((article) => article.toJson()).toList(),
      'countryList': countryList.map((country) => country.toJson()).toList(),
      'categoryList': categoryList,
      'status': status.toString().split('.').last,
    };
  }

  @override
  String toString() => 'TopNewsState(newsList: $newsList, countryList: $countryList, categoryList: $categoryList, status: $status)';

  @override
  List<Object> get props => [newsList, countryList, categoryList, status];

  MyNewsState copyWith({
    List<NewsArticle>? newsList,
    List<Country>? countryList,
    List<String>? categoryList,
    DataStatus? status,
  }) {
    return MyNewsState(
      newsList: newsList ?? this.newsList,
      countryList: countryList ?? this.countryList,
      categoryList: categoryList ?? this.categoryList,
      status: status ?? this.status,
    );
  }
}

