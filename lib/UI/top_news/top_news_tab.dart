import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavenews/UI/common/custom_sliver_app_bar.dart';
import 'package:wavenews/UI/common/page_error_widget.dart';
import 'package:wavenews/UI/top_news/shimmer/top%20_news_shimmer_widget.dart';
import 'package:wavenews/UI/top_news/widgets/news_widget.dart';
import 'package:wavenews/cubits/top_news/top_news_cubit.dart';
import 'package:wavenews/models/data_status.dart';

class TopNewsTab extends StatelessWidget {
  const TopNewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<TopNewsCubit, TopNewsState>(
          builder: (context, state) {
            switch (state.status) {
              case DataStatus.success:
                final newsList = state.newsList;
                return CustomScrollView(
                  slivers: [
                    /// Header
                    CustomSliverAppBar(
                      title: "Top News",
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.settings),
                          onPressed: () {},
                        ),
                      ],
                    ),

                    /// List of news
                    NewsWidget(newsList: newsList),

                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 50,
                    )),
                  ],
                );
              case DataStatus.loading:
              case DataStatus.initial:
                return const TopNewsShimmerWidget();
              case DataStatus.error:
                return PageErrorWidget(onPressed: () {
                  context.read<TopNewsCubit>().fetchNews();
                });
            }
          },
        ),
      ),
    );
  }
}
