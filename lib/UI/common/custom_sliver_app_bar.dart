import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;

  const CustomSliverAppBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.blue,
      elevation: 0.0,
      shadowColor: Colors.white,
      expandedHeight: 95.0,
      floating: false,
      pinned: true,
      actions: actions,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        final bool isExpanded = constraints.biggest.height ==
            kToolbarHeight + MediaQuery.of(context).padding.top;
        return FlexibleSpaceBar(
          titlePadding:
              const EdgeInsetsDirectional.only(start: 15.0, bottom: 20),
          centerTitle: isExpanded,
          title: Text(
            title,
            style: GoogleFonts.raleway(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        );
      }),
    );
  }
}
