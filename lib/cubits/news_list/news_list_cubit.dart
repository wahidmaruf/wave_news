import 'package:flutter/foundation.dart';
import 'package:wavenews/models/data_status.dart';
import '../top_news/top_news_cubit.dart';

class NewsListCubit extends TopNewsCubit {
  NewsListCubit({required super.repository});

  void fetchCountryNews(String country) async {
    try {
      emit(state.copyWith(status: DataStatus.loading));
      final newsList = await repository.fetchNews(countryList: [country.toString()]);
      emit(state.copyWith(newsList: newsList, status: DataStatus.success));
    } catch (e) {
      emit(state.copyWith(status: DataStatus.error));
      if (kDebugMode) {
        print(e);
      }
    }
  }


  void fetchCategoryNews(String keyword) async {
    try {
      emit(state.copyWith(status: DataStatus.loading));
      final newsList = await repository.fetchNews(categoryList: [keyword.toString()]);
      if (kDebugMode) {
        print(newsList.toString());
      }
      emit(state.copyWith(newsList: newsList, status: DataStatus.success));
    } catch (e) {
      emit(state.copyWith(status: DataStatus.error));
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
