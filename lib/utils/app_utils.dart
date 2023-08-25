import 'package:flutter/material.dart';
import 'package:wavenews/UI/my_news/widgets/topics_sheet.dart';

class AppUtils {
  static void showTopicsSheet(Size sheetSize, BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        constraints: BoxConstraints(
            maxWidth: sheetSize.width, maxHeight: sheetSize.height),
        context: context,
        builder: (BuildContext context) {
          return const TopicsSheet();
        },
        isScrollControlled: true);
  }
}