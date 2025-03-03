import 'package:flutter/material.dart';

class ExampleKeys extends StatelessWidget {
  const ExampleKeys({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Пример работы ключей')),
      body: UniqueKeyDemo(),
    );
  }
}

class UniqueKeyDemo extends StatefulWidget {
  @override
  _UniqueKeyDemoState createState() => _UniqueKeyDemoState();
}

class _UniqueKeyDemoState extends State<UniqueKeyDemo> {
  List<Widget> items = [
    CounterWidget(text: 'Виджет А'),
    CounterWidget(text: 'Виджет B'),
  ];

  // List<Item> items = [
  //   Item(text: 'Виджет А', id: 0),
  //   Item(text: 'Виджет B', id: 1),
  // ];

  void swapWidgets() {
    setState(() {
      // Меняем виджеты местами
      final temp = items[0];
      items[0] = items[1];
      items[1] = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: items,
              // children: items
              //     .map(
              //       (item) => CounterWidget(
              //         text: item.text,
              //         // key: UniqueKey(),
              //         // key: ValueKey(item.id),
              //         // key: ObjectKey(item),
              //       ),
              //     )
              //     .toList(),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: swapWidgets,
          child: Text('Поменять виджеты местами'),
        ),
      ],
    );
  }
}

class CounterWidget extends StatefulWidget {
  final String text;

  CounterWidget({Key? key, required this.text}) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      color: Colors.blue.withOpacity(0.2),
      child: Column(
        children: [
          Text('${widget.text} (Счетчик: $_counter)'),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: _incrementCounter,
            child: Text('+1'),
          ),
        ],
      ),
    );
  }
}

class Item {
  final String text;
  final int id;

  const Item({
    required this.text,
    required this.id,
  });
}
