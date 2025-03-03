import 'package:flutter/material.dart';

class InheritedCase extends StatefulWidget {
  const InheritedCase({super.key});

  @override
  State<InheritedCase> createState() => _InheritedCaseState();
}

class _InheritedCaseState extends State<InheritedCase> {
  late int _counter;

  @override
  void initState() {
    super.initState();
    _counter = 0;
  }

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CounterScope(
          count: _counter,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _increment,
                  child: const Text('Click'),
                ),
                const CounterText(),
              ],
            ),
          ),
        ),
      );
}

class CounterScope extends InheritedWidget {
  final int count;

  const CounterScope({
    required this.count,
    required Widget child,
    super.key,
  }) : super(child: child);

  static CounterScope of(BuildContext context) {
    final CounterScope? result =
        context.dependOnInheritedWidgetOfExactType<CounterScope>();
    assert(result != null, 'No CounterScope found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CounterScope oldWidget) {
    return oldWidget.count != count;
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final scope = CounterScope.of(context);
    return Text('Count: ${scope.count}');
  }
}
