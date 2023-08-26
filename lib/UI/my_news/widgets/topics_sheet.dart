import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wavenews/cubits/my_news/my_news_cubit.dart';
import 'package:wavenews/utils/app_defaults.dart';

class TopicsSheet extends StatelessWidget {
  const TopicsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyNewsCubit, MyNewsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
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
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: TextButton.styleFrom(
                              foregroundColor:
                                  Theme.of(context).colorScheme.onSecondary),
                          child: Text(
                            "Done",
                            style: GoogleFonts.urbanist(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Select Category",
                      style: GoogleFonts.urbanist(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 8,
                      runSpacing: 4,
                      children: AppDefaults.categories.map((category) {
                        return ChoiceChip(
                          label: Text(
                            category,
                            style: GoogleFonts.lato(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                          selected: state.categoryList
                              .any((element) => element == category),
                          onSelected: (isSelected) {
                            context
                                .read<MyNewsCubit>()
                                .updateCountrySelection(isSelected, category);
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
