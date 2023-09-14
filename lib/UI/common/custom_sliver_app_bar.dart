import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final bool? isCenter;

  const CustomSliverAppBar({super.key, required this.title, this.actions, this.isCenter});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      elevation: 0.0,
      shadowColor: Colors.transparent,
      expandedHeight: 95.0,
      floating: true,
      pinned: true,
      actions: actions,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff071a52), Color(0xff27345b)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          final bool isExpanded = constraints.biggest.height ==
              kToolbarHeight + MediaQuery.of(context).padding.top;
          return FlexibleSpaceBar(
            titlePadding:
                const EdgeInsetsDirectional.only(start: 15.0, bottom: 20),
            centerTitle: isCenter ?? isExpanded,
            title: Text(
              title,
              style: GoogleFonts.raleway(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
          );
        }),
      ),
    );
  }
}
