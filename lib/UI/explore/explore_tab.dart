import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavenews/UI/common/custom_sliver_app_bar.dart';
import 'package:wavenews/UI/explore/search/explore_search_delegate.dart';
import 'package:wavenews/UI/explore/search/search_bar_delegate.dart';
import 'package:wavenews/UI/explore/widgets/categories_sliver_adapter.dart';
import 'package:wavenews/UI/explore/widgets/country_sliver_adapter.dart';
import 'package:wavenews/UI/explore/widgets/latest_news_adapter.dart';
import 'package:wavenews/cubits/latest_news/latest_news_cubit.dart';
import 'package:wavenews/models/data_status.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocBuilder<LatestNewsCubit, LatestNewsState>(
          builder: (context, state) {
        return CustomScrollView(
          slivers: [
            /// Header
            const CustomSliverAppBar(
              title: "Explore",
            ),

            /// Search Bar
            SliverPersistentHeader(
              delegate: SearchBarDelegate(onTap: () {
                showSearch(context: context, delegate: ExploreSearchDelegate());
              }),
              pinned: true,
            ),

            /// Categories
            const CategoriesSliverAdapter(),

            /// More
            const CountrySliverAdapter(),

            /// Latest News
            if (state.status == DataStatus.success) ...[
              const LatestNewsAdapter(),
            ],

            const SliverToBoxAdapter(
                child: SizedBox(
              height: 50,
            )),
          ],
        );
      }),
    );
  }
}
