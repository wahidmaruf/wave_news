import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavenews/UI/common/news_card.dart';
import 'package:wavenews/cubits/search/search_cubit.dart';

class SearchResultWidget extends StatelessWidget {
  const  SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          final newsList = state.newsList;
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 30),
              itemBuilder: (context, index) {
                return NewsCard(
                  news: newsList[index],
                );
              },
            itemCount: newsList.length,
          );
        }
    );
  }
}
