import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:wavenews/models/data_status.dart';
import 'package:wavenews/repository/news_repository.dart';
import '../../models/news_article.dart';

part 'top_news_state.dart';

class TopNewsCubit extends HydratedCubit<TopNewsState> {
  final NewsRepository repository;

  TopNewsCubit({required this.repository}) : super(TopNewsState.initial());

  void fetchNews() async {
    try {
      emit(state.copyWith(status: DataStatus.loading));
      final newsList = await repository.fetchTopHeadlines();
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
  TopNewsState? fromJson(Map<String, dynamic> json) {
    try {
      return TopNewsState.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(TopNewsState state) {
    return state.toJson();
  }
}
