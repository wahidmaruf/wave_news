import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wavenews/UI/common/custom_sliver_app_bar.dart';
import 'package:wavenews/UI/common/news_card.dart';
import 'package:wavenews/UI/common/page_error_widget.dart';
import 'package:wavenews/UI/my_news/widgets/no_topics_widget.dart';
import 'package:wavenews/cubits/my_news/my_news_cubit.dart';
import 'package:wavenews/models/data_status.dart';
import 'package:wavenews/utils/app_utils.dart';
import 'package:wavenews/utils/color_constraint.dart';
import 'package:wavenews/utils/sheet_size.dart';

class MyNewsTab extends StatelessWidget {
  const MyNewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var sheetSize = getSheetSize(context);

    return Scaffold(
      body: BlocBuilder<MyNewsCubit, MyNewsState>(
        builder: (context, state) {
          return CustomScrollView(
            physics: state.showNoTopics
                ? const NeverScrollableScrollPhysics()
                : const AlwaysScrollableScrollPhysics(),
            slivers: [
              CustomSliverAppBar(
                title: "My News",
                actions: [
                  Visibility(
                    visible: !state.showNoTopics,
                    child: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        AppUtils.showTopicsSheet(sheetSize, context);
                      },
                    ),
                  ),
                ],
              ),
              if (state.status == DataStatus.success ||
                  state.newsList.isNotEmpty) ...[
                if (state.showNoTopics) ...[
                  NoTopicsWidget(
                    sheetSize: sheetSize,
                  )
                ] else
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                    return NewsCard(news: state.newsList[index]);
                  }, childCount: state.newsList.length)),
                const SliverToBoxAdapter(
                    child: SizedBox(
                  height: 50,
                )),
              ] else if (state.status == DataStatus.loading ||
                  state.status == DataStatus.initial) ...[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6.0,
                          horizontal: 16.0,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SizedBox(
                            // width: 150,
                            height: 150,
                            child: Shimmer.fromColors(
                              baseColor: CustomColors.shimmerBaseColor,
                              highlightColor:
                                  CustomColors.shimmerHighlightColor,
                              direction: ShimmerDirection.ltr,
                              enabled: true,
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: 8,
                  ),
                )
              ] else if (state.status == DataStatus.error) ...[
                SliverFillRemaining(
                  child: PageErrorWidget(onPressed: () {}),
                )
              ]
            ],
          );
        },
      ),
    );
  }
}
