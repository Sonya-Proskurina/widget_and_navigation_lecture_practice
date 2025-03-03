import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/shop.dart';

class ShopNotifier extends ValueNotifier<ShopModel> {
  ShopNotifier(super.value);

  void show() {
    value = value.show();
  }

  void hide() {
    value = value.hide();
  }

  ValueNotifier<int> getValueNotifierById(int id) {
    final valueNotifier = value.countMap[id];
    if (valueNotifier == null) {
      value.countMap[id] = ValueNotifier(0);
      return value.countMap[id]!;
    }
    return valueNotifier;
  }

  void addCountById(int id) {
    final notifier = getValueNotifierById(id);
    notifier.value = notifier.value + 1;
  }
}

class ShopInheritedNotifier extends InheritedNotifier<ShopNotifier> {
  const ShopInheritedNotifier({
    super.key,
    required super.notifier,
    required super.child,
  });

  static ShopNotifier of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<ShopInheritedNotifier>();

    final notifier = result?.notifier;
    if (notifier == null) {
      throw StateError('No ShopInheritedNotifier found in context');
    }

    return notifier;
  }
}
