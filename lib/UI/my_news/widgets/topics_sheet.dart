import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wavenews/cubits/my_news/my_news_cubit.dart';
import 'package:wavenews/utils/app_defaults.dart';

class TopicsSheet extends StatelessWidget {
  const TopicsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyNewsCubit, MyNewsState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.xmark),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 8,
                      runSpacing: 4,
                      children: AppDefaults.categories.map((category) {
                        return ChoiceChip(
                            label: Text(
                                category
                            ),
                            selected: state.categoryList.any((element) => element == category),
                          onSelected: (isSelected) {
                              context.read<MyNewsCubit>().updateCountrySelection(isSelected, category);
                          },
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
