import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:wavenews/models/data_status.dart';
import 'package:wavenews/models/news_article.dart';
import 'package:wavenews/repository/news_repository.dart';

part 'search_state.dart';

class SearchCubit extends HydratedCubit<SearchState> {
  final NewsRepository repository;

  SearchCubit({required this.repository})
      : super(SearchState.initial());

  void fetchNews(String keyword) async {
    try {
      emit(state.copyWith(status: DataStatus.loading));
      final newsList = await repository.fetchNews(keyword: keyword);
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

  @override
  SearchState? fromJson(Map<String, dynamic> json) {
    try {
      return SearchState.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(SearchState state) {
    return state.toJson();
  }
}
