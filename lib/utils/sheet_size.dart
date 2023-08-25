import 'package:flutter/cupertino.dart';

Size getSheetSize(BuildContext context) {
  double sheetHeight = 700;
  double sheetWidth = 400;
  Size screenSize = MediaQuery.of(context).size;

  if (screenSize.width < 600) {
    sheetWidth = double.infinity;
  } else if (screenSize.width > 600 && screenSize.width <= 900) {
    sheetWidth = screenSize.width * 0.65;
  } else if (screenSize.width > 900) {
    sheetWidth = 585;
  }

  if (screenSize.height < 700) {
    sheetHeight = screenSize.height * 0.9;
  } else if (screenSize.height > 700 && screenSize.height <= 900) {
    sheetHeight = screenSize.height * 0.88;
  } else if (screenSize.height > 900 && screenSize.height <= 1200) {
    sheetHeight = screenSize.height * 0.8;
  } else if (screenSize.height > 1200) {
    sheetHeight = 1000;
  }

  return Size(sheetWidth, sheetHeight);
}
