import 'package:flutter/material.dart';

class StatelessCase extends StatelessWidget {
  const StatelessCase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Hello, Widget World'),
      ),
    );
  }
}
