import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wavenews/UI/common/news_card.dart';
import 'package:wavenews/UI/common/page_error_widget.dart';
import 'package:wavenews/UI/common/shimmer/news_shimmer_widget.dart';
import 'package:wavenews/cubits/news_list/news_list_cubit.dart';
import 'package:wavenews/cubits/top_news/top_news_cubit.dart';
import 'package:wavenews/models/data_status.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({required this.title, this.keyword, this.countryCode, super.key});

  final String title;
  final String? keyword;
  final String? countryCode;

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  @override
  void initState() {
    if (widget.keyword != null) {
      context.read<NewsListCubit>().fetchCategoryNews(widget.keyword!);
    } else if (widget.countryCode != null) {
      context.read<NewsListCubit>().fetchCountryNews(widget.countryCode!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: GoogleFonts.urbanist(
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: BlocBuilder<NewsListCubit, TopNewsState>(
        builder: (context, state) {

          return BlocBuilder<NewsListCubit, TopNewsState>(
            builder: (context, state) {
              switch (state.status) {
                case DataStatus.success:
                  final newsList = state.newsList;
                  return SingleChildScrollView(
                    child: Column(
                      children: List.generate(newsList.length, (index) {
                        return NewsCard(news: newsList[index]);
                      }),
                    ),
                  );
                case DataStatus.loading:
                case DataStatus.initial:
                  return const NewsShimmerWidget();
                case DataStatus.error:
                  return PageErrorWidget(onPressed: () {
                    context.read<TopNewsCubit>().fetchNews();
                  });
              }
            },
          );
        },
      ),
    );
  }
}
