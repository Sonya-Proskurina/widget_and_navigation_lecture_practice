import 'package:flutter/material.dart';
import 'package:flutter_widget_seminar/store/widget/store_screen.dart';
import 'example/example_3.dart';
import 'example/example_4.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
      ),
      // home: const StatelessCase(),
      // home: const StatefulCase(text: 'StatefulWidget'),
      // home: const InheritedCase(),
      // home: const BuilderCase(),
      home: const StoreScreen(),
    );
  }
}
