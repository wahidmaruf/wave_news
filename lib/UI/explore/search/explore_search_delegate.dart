import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wavenews/UI/explore/search/search_result_widget.dart';
import 'package:wavenews/cubits/search/search_cubit.dart';

class ExploreSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  TextStyle? get searchFieldStyle => GoogleFonts.openSans();

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios_new));
  }

  @override
  Widget buildResults(BuildContext context) {
    _search(context);
    return const SearchResultWidget();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _search(context);
    return const SearchResultWidget();
  }

  void _search(BuildContext context) {
    if (query.length >= 3) {
      context.read<SearchCubit>().fetchNews(query);
    }
  }
}
