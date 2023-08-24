import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavenews/UI/common/custom_sliver_app_bar.dart';
import 'package:wavenews/UI/common/page_error_widget.dart';
import 'package:wavenews/UI/common/shimmer/news_shimmer_widget.dart';
import 'package:wavenews/cubits/my_news/my_news_cubit.dart';
import 'package:wavenews/models/data_status.dart';

class MyNewsTab extends StatelessWidget {
  const MyNewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<MyNewsCubit, MyNewsState>(
          builder: (context, state) {
            switch (state.status) {
              case DataStatus.success:
                return CustomScrollView(
                  slivers: [
                    /// Header
                    CustomSliverAppBar(
                      title: "My News",
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.settings),
                          onPressed: () {},
                        ),
                      ],
                    ),

                    /// List of news

                    const SliverToBoxAdapter(
                        child: SizedBox(
                          height: 50,
                        )),
                  ],
                );
              case DataStatus.loading:
              case DataStatus.initial:
                return const NewsShimmerWidget();
              case DataStatus.error:
                return PageErrorWidget(onPressed: () {

                });
            }
          },
        ),
      ),
    );
  }
}
