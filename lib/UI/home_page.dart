
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavenews/UI/top_news/top_news_tab.dart';
import 'package:wavenews/cubits/latest_news/latest_news_cubit.dart';
import 'package:wavenews/cubits/top_news/top_news_cubit.dart';

import 'explore/explore_tab.dart';
import 'my_news/top_news_tab.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";

  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const TopNewsTab(),
    const ExploreTab(),
    const MyNewsTab()
  ];

  @override
  void initState() {
    context.read<TopNewsCubit>().fetchNews();
    context.read<LatestNewsCubit>().fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (_, BoxConstraints constraints) {
        return _tabs[_currentIndex];
      }),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Top News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_outlined),
            label: 'My News',
          ),
        ],
      ),
    );
  }
}
