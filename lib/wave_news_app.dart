import 'package:flutter/material.dart';

class WaveNewsApp extends StatelessWidget {
  const WaveNewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return MaterialApp(
        title: 'Wave News',
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: const Center(
              child: Text("Hello World"),
            ),
          );
        },
      );
    });
  }
}
