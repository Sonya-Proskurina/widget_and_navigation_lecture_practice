import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class HidePriceScope extends StatefulWidget {
  final Widget child;

  const HidePriceScope({
    required this.child,
    super.key,
  });

  @override
  State<HidePriceScope> createState() => _HidePriceScopeState();
}

class _HidePriceScopeState extends State<HidePriceScope> {
  late final HidePriceNotifier _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = HidePriceNotifier(true);
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => HidePriceInheritedNotifier(
        notifier: _notifier,
        child: widget.child,
      );
}

class HidePriceNotifier extends ValueNotifier<bool> {
  HidePriceNotifier(super.value);

  void show() => value = true;

  void hide() => value = false;
}

class HidePriceInheritedNotifier extends InheritedNotifier<HidePriceNotifier> {
  const HidePriceInheritedNotifier({
    super.key,
    required super.notifier,
    required super.child,
  });

  static HidePriceNotifier of(BuildContext context) {
    final result = context
        .dependOnInheritedWidgetOfExactType<HidePriceInheritedNotifier>();

    final notifier = result?.notifier;
    if (notifier == null) {
      throw StateError('No HidePriceInheritedNotifier found in context');
    }

    return notifier;
  }
}