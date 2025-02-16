import 'package:flutter/material.dart';

class ProductItemInheritedNotifier
    extends InheritedNotifier<ValueNotifier<int>> {
  const ProductItemInheritedNotifier({
    super.key,
    required super.notifier,
    required super.child,
  });

  static ValueNotifier<int> of(BuildContext context) {
    final result = context
        .dependOnInheritedWidgetOfExactType<ProductItemInheritedNotifier>();

    final notifier = result?.notifier;
    if (notifier == null) {
      throw StateError('No ProductItemInheritedNotifier found in context');
    }

    return notifier;
  }
}
