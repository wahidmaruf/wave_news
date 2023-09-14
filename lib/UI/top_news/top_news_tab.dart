import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavenews/UI/common/custom_refresh_indicator.dart';
import 'package:wavenews/UI/common/custom_sliver_app_bar.dart';
import 'package:wavenews/UI/common/page_error_widget.dart';
import 'package:wavenews/UI/common/shimmer/news_shimmer_widget.dart';
import 'package:wavenews/UI/settings/settings_page.dart';
import 'package:wavenews/UI/top_news/widgets/news_widget.dart';
import 'package:wavenews/cubits/theme/theme_cubit.dart';
import 'package:wavenews/cubits/top_news/top_news_cubit.dart';
import 'package:wavenews/models/data_status.dart';

class TopNewsTab extends StatelessWidget {
  const TopNewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocBuilder<TopNewsCubit, TopNewsState>(
        builder: (context, state) {
          final newsList = state.newsList;
          return CustomRefreshIndicator(
            onRefresh: () async {
              context.read<TopNewsCubit>().fetchNews();
            },
            child: CustomScrollView(
              physics: (state.status == DataStatus.loading || state.status == DataStatus.initial ||
                  newsList.isEmpty)
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
              slivers: [
                /// Header
                CustomSliverAppBar(
                  title: "Top News",
                  actions: [
                    /// Settings icon
                    BlocBuilder<ThemeCubit, ThemeState>(
                      builder: (context, state) {
                        return IconButton(
                          color: Colors.white,
                          icon: const Icon(Icons.settings),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SettingsPage()
                                )
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),

                /// List of news
                if (state.status == DataStatus.success ||
                    newsList.isNotEmpty) ...[
                  NewsWidget(newsList: newsList),
                  const SliverToBoxAdapter(
                      child: SizedBox(
                    height: 50,
                  )),
                ] else if (state.status == DataStatus.loading ||
                    state.status == DataStatus.initial) ...[
                  const NewsShimmerSliverWidget()
                ] else ...[
                  /// Error Widget
                  SliverFillRemaining(
                    child: PageErrorWidget(onPressed: () {
                      context.read<TopNewsCubit>().fetchNews();
                    }),
                  )
                ]
              ],
            ),
          );
        },
      ),
    );
  }
}
