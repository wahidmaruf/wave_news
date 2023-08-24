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
