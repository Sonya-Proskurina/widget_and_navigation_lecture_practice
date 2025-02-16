import 'package:flutter/material.dart';

class StatefulCase extends StatefulWidget {
  final String text;

  const StatefulCase({required this.text, super.key});

  @override
  State<StatefulCase> createState() => _StatefulCaseState();
}

class _StatefulCaseState extends State<StatefulCase> {
  late int _counter;

  @override
  void initState() {
    super.initState();
    print('StatefulCase initState');
    _counter = 0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('StatefulCase didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant StatefulCase oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('StatefulCase didUpdateWidget: ${oldWidget.text} -> ${widget.text}');
  }

  @override
  void dispose() {
    print('StatefulCase dispose');
    super.dispose();
  }

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('StatefulCase Build');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _increment,
            child: Text('Click ' + _counter.toString()),
          ),
          _Counter(
            count: _counter,
            text: widget.text,
          ),
          if (_counter < 10) const _Notification()
        ],
      ),
    );
  }
}

class _Counter extends StatefulWidget {
  final int count;
  final String text;

  const _Counter({
    required this.count,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  State<_Counter> createState() => _CounterState();
}

class _CounterState extends State<_Counter> {
  @override
  void initState() {
    print("Counter initState");
    super.initState();
  }

  @override
  void dispose() {
    print("Counter dispose");
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print("Counter didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant _Counter oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('Counter didUpdateWidget: ${oldWidget.count} -> ${widget.count}');
  }

  @override
  Widget build(BuildContext context) {
    print("Counter Build");
    return Text('${widget.text} Count: ${widget.count}');
  }
}

class _Notification extends StatefulWidget {
  const _Notification();

  @override
  State<_Notification> createState() => _NotificationState();
}

class _NotificationState extends State<_Notification> {
  @override
  void initState() {
    super.initState();
    print("_Notification init");
  }

  @override
  void dispose() {
    print("_Notification dispose");
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print("_Notification didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("_Notification Build");
    return ElevatedButton(
      onPressed: _onTap,
      child: const Text('Send'),
    );
  }

  Future<void> _onTap() async {
    print('Mounted: $mounted');

    await Future<void>.delayed(const Duration(seconds: 3));

    print('Mounted: $mounted');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Hi!')),
    );
  }
}
