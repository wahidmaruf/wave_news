import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wavenews/UI/common/news_card.dart';
import 'package:wavenews/cubits/latest_news/latest_news_cubit.dart';
import 'package:wavenews/utils/app_defaults.dart';


class LatestNewsAdapter extends StatelessWidget {
  const LatestNewsAdapter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<LatestNewsCubit, LatestNewsState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Latest News",
                  style: GoogleFonts.urbanist(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10,),
              ...List.generate(state.newsList.length, (index) {
                return NewsCard(news: state.newsList[index]);
              })
            ],
          );
        },
      ),
    );
  }
}