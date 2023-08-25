import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:wavenews/models/country.dart';
import 'package:wavenews/models/data_status.dart';
import 'package:wavenews/models/news_article.dart';
import 'package:wavenews/repository/news_repository.dart';

part 'my_news_state.dart';

class MyNewsCubit extends HydratedCubit<MyNewsState> {
  final NewsRepository repository;

  MyNewsCubit({required this.repository}) : super(MyNewsState.initial());

  void fetchNews() async {
    if (state.categoryList.isNotEmpty) {
      try {
        emit(state.copyWith(showNoTopics: false));
        final newsList =
            await repository.fetchNews(categoryList: state.categoryList);
        emit(state.copyWith(newsList: newsList, status: DataStatus.success));
      } catch (e) {
        emit(state.copyWith(status: DataStatus.error));
        if (kDebugMode) {
          print(e);
        }
      }
    } else {
      emit(state.copyWith(showNoTopics: true));
    }
  }

  void updateCountrySelection(bool isSelected, String category) {
    List<String> categoryList =
        List.from(state.categoryList); // Create a copy of the list

    if (isSelected) {
      categoryList.add(category);
    } else {
      categoryList.removeWhere((element) => element == category);
    }

    emit(state.copyWith(categoryList: categoryList));
    fetchNews();
  }

  @override
  MyNewsState? fromJson(Map<String, dynamic> json) {
    try {
      return MyNewsState.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(MyNewsState state) {
    return state.toJson();
  }
}
