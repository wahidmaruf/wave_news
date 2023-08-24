import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavenews/UI/home_page.dart';
import 'package:wavenews/cubits/latest_news/latest_news_cubit.dart';
import 'package:wavenews/cubits/search/search_cubit.dart';
import 'package:wavenews/cubits/theme/theme_cubit.dart';
import 'package:wavenews/cubits/top_news/top_news_cubit.dart';
import 'package:wavenews/repository/news_repository.dart';

import 'cubits/news_list/news_list_cubit.dart';

class WaveNewsApp extends StatelessWidget {
  const WaveNewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<NewsRepository>(
          create: (context) => NewsRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
          BlocProvider<TopNewsCubit>(
              create: (context) =>
                  TopNewsCubit(repository: context.read<NewsRepository>())),
          BlocProvider<LatestNewsCubit>(
              create: (context) => LatestNewsCubit(
                  newsRepository: context.read<NewsRepository>())),
          BlocProvider<SearchCubit>(
              create: (context) =>
                  SearchCubit(repository: context.read<NewsRepository>())),
          BlocProvider<NewsListCubit>(
              create: (context) =>
                  NewsListCubit(repository: context.read<NewsRepository>())),
        ],
        child: LayoutBuilder(builder: (context, constraints) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                title: 'Wave News',
                debugShowCheckedModeBanner: false,
                themeMode: state.themeMode,
                initialRoute: HomePage.routeName,
                routes: {
                  HomePage.routeName: (context) => const HomePage(),
                },
                theme: ThemeData(
                    useMaterial3: true,
                    brightness: Brightness.light,
                    colorSchemeSeed: const Color(0xff25143a)),
                darkTheme: ThemeData(
                    useMaterial3: true,
                    brightness: Brightness.dark,
                    colorSchemeSeed: const Color(0xff25143a)),
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: child!,
                  );
                },
              );
            },
          );
        }),
      ),
    );
  }
}
